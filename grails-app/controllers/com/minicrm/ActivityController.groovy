package com.minicrm

class ActivityController {

	def activityService
	def valueSetService
	
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
												searchCriteria:searchCriteria,
												activityTypes:valueSetService.getActivityType()])
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
		render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
												activityTypes:valueSetService.getActivityType()])
	}
	
	def updateActivity() {
		def activity = Activity.get(params.id)
		render(view:"editActivity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
												activity:activity,
												activityTypes:valueSetService.getActivityType()])
	}
	
	def saveActivity() {
		def activity
		if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
			activity = new Activity(params)
			def customer = Customer.get(params.customerId)
			activity.customer = customer
			activity.createdDate = new Date()
			activity.createUser = User.get(1)
			activity.lastUpdatedDate = new Date()
			activity.lastUpdateUser = User.get(1)
		} else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
			activity = Activity.get(params.id)
			activity.properties = params
			activity.lastUpdatedDate = new Date()
			activity.lastUpdateUser = User.get(1)
		}
		
		if (activity.save(flush:true)) {
			redirect(action:"listActivities")
		} else {
			render(view:"editActivity", model:[actionFlag:params.actionFlag,
												activity:activity,
												activityTypes:valueSetService.getActivityType()])
		}
	}
}
