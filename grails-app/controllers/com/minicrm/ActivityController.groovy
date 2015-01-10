package com.minicrm

class ActivityController {

    def springSecurityService
    def activityService
    def customerService
	
    def index() {
        redirect(action:"listActivities")
    }
	
    def listActivities() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params)
        def activities = activityService.findActivityByCriteria(searchCriteria)
        render(view:"listActivities", model:[activities:activities,
                searchCriteria:searchCriteria])
    }

    def viewActivity() {
        def activity = Activity.read(params.id)

        if(activity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(activity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
			def opportunities = OpportunityActivity.findAllByActivity(activity).collect{ it.opportunity }
            render(view:"viewActivity", model:[activity:activity, opportunities:opportunities])
        }
    }

    def addActivity() {
        render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
    }

    def updateActivity() {
        def activity = Activity.load(params.id)
        
        if(activity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(activity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                    activity:activity])
        }
    }

    def saveActivity() {
        def activity
		def opportunity
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            activity = new Activity(params)
            def customer = Customer.get(params.customerId)
			opportunity = Opportunity.get(params.opportunityId)
            activity.customer = customer
            activity.createdDate = new Date()
            activity.createUser = springSecurityService.currentUser
            activity.lastUpdatedDate = new Date()
            activity.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            activity = Activity.load(params.id)
            activity.properties = params
            activity.lastUpdatedDate = new Date()
            activity.lastUpdateUser = springSecurityService.currentUser
        }

        if (activity.save(flush:true)) {
			if(opportunity != null) {
				OpportunityActivity.create(opportunity, activity)
				redirect(controller:"opportunity", action:"viewOpportunity", id:opportunity.id)
			} else {
				redirect(action:"listActivities")
			}
            
        } else {
            render(view:"editActivity", model:[actionFlag:params.actionFlag,
                    activity:activity])
        }
    }
	
    def deleteActivity() {
        def activity = Activity.load(params.id)

        if(activity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(activity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            activity.delete(flush:true)
            redirect(action:"listActivities")
        }
    }
}
