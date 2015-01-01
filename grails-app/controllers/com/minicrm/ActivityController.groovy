package com.minicrm

class ActivityController {

	def springSecurityService
    def activityService
	
    def index() {
        redirect(action:"listActivities")
    }
	
    def listActivities() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params)

        def activities
        if(searchCriteria.size() == 0) {
            activities = Activity.list(params)
        } else {
            activities = activityService.findActivityByCriteria(searchCriteria)
        }

        render(view:"listActivities", model:[activities:activities,
                                                searchCriteria:searchCriteria])
    }

    def viewActivity() {
        def activity = Activity.get(params.id)
        if(activity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else {
            render(view:"viewActivity", model:[activity:activity])
        }
    }

    def addActivity() {
        render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
    }

    def updateActivity() {
        def activity = Activity.get(params.id)
        render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                                            activity:activity])
    }

    def saveActivity() {
        def activity
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            activity = new Activity(params)
            def customer = Customer.get(params.customerId)
            activity.customer = customer
            activity.createdDate = new Date()
            activity.createUser = springSecurityService.currentUser
            activity.lastUpdatedDate = new Date()
            activity.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            activity = Activity.get(params.id)
            activity.properties = params
            activity.lastUpdatedDate = new Date()
            activity.lastUpdateUser = springSecurityService.currentUser
        }

        if (activity.save(flush:true)) {
            redirect(action:"listActivities")
        } else {
            render(view:"editActivity", model:[actionFlag:params.actionFlag,
                                                    activity:activity])
        }
    }
	
	def deleteActivity() {
		def activity = Activity.get(params.id)
		
		activity.delete(flush:true)
		redirect(action:"listActivities")
	}
}
