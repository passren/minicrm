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
			def oa = OpportunityActivity.findByActivity(activity)
            render(view:"viewActivity", model:[activity:activity, opportunity:oa?.opportunity])
        }
    }
	
    def addActivity() {
        render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD, entrance:"Activity"])
    }

    def updateActivity() {
        def activity = Activity.load(params.id)
        def oa = OpportunityActivity.findByActivity(activity)
        
        if(activity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(activity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE, entrance:"Activity",
                                                            opportunity:oa?.opportunity, activity:activity])
        }
    }

    def saveActivity() {
        def activity
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            activity = new Activity(params)
            activity.customer = Customer.get(params.customerId)
            activity.createdDate = new Date()
            activity.createUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            activity = Activity.load(params.id)
            activity.properties = params
        }

        if (activityService.saveActivity(activity)) {
            redirect(action:"listActivities")
        } else {
            render(view:"editActivity", model:[actionFlag:params.actionFlag, entrance:"Activity",
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
