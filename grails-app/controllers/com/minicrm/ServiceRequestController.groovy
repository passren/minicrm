package com.minicrm

class ServiceRequestController {
	
    def springSecurityService
    def serviceRequestService
    def customerService
	
    def index(Integer max) {
        redirect(action:"listServiceRequests")
    }

    def listServiceRequests() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params, true)
        def serviceRequests = serviceRequestService.findServiceRequestByCriteria(searchCriteria)
        render(view:"listServiceRequests", model:[serviceRequests:serviceRequests,
                searchCriteria:searchCriteria])
    }

    def viewServiceRequest() {
        def serviceRequest = ServiceRequest.read(params.id)
        if(serviceRequest == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(serviceRequest.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"viewServiceRequest", model:[serviceRequest:serviceRequest])
        }
    }

    def addServiceRequest() {
        render(view:"editServiceRequest", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
    }

    def updateServiceRequest() {
        def serviceRequest = ServiceRequest.load(params.id)
        if(serviceRequest == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(serviceRequest.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editServiceRequest", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                    serviceRequest:serviceRequest])
        }
    }
	
    def saveServiceRequest() {
        def serviceRequest
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            serviceRequest = new ServiceRequest(params)
            def customer = Customer.get(params.customerId)
            serviceRequest.customer = customer
            serviceRequest.completedDate = StringUtils.string2Date(params.txtCompletedDate, ConstUtils.DATE_DAY_FORMAT)
            serviceRequest.createdDate = new Date()
            serviceRequest.createUser = springSecurityService.currentUser
            serviceRequest.lastUpdatedDate = new Date()
            serviceRequest.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            serviceRequest = ServiceRequest.load(params.id)
            serviceRequest.properties = params
            serviceRequest.completedDate = StringUtils.string2Date(params.txtCompletedDate, ConstUtils.DATE_DAY_FORMAT)
            serviceRequest.lastUpdatedDate = new Date()
            serviceRequest.lastUpdateUser = springSecurityService.currentUser
        }

        if (serviceRequest.save(flush:true)) {
            redirect(action:"listServiceRequests")
        } else {
            render(view:"editServiceRequest", model:[actionFlag:params.actionFlag,
                    serviceRequest:serviceRequest])
        }
    }
	
    def deleteServiceRequest() {
        def serviceRequest = ServiceRequest.load(params.id)
        if(serviceRequest == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(serviceRequest.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            serviceRequest.delete(flush:true)
            redirect(action:"listServiceRequests")
        }
    }
}
