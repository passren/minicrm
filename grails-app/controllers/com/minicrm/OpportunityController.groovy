package com.minicrm

class OpportunityController {

    def opportunityService
    def valueSetService
    
    def index() {
        redirect(action:"listOpportunities")
    }
    
    def listOpportunities() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params)

        def opportunities
        if(searchCriteria.size() == 0) {
            opportunities = Opportunity.list(params)
        } else {
            opportunities = opportunityService.findOpportunityByCriteria(searchCriteria)
        }

        render(view:"listOpportunities", model:[opportunities:opportunities,
                                                searchCriteria:searchCriteria,
                                                status:valueSetService.getOpportunityStatus(),
                                                products:valueSetService.getProductList()])
    }
    
    def viewOpportunity() {
        def opportunity = Opportunity.get(params.id)
        if(opportunity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else {
            render(view:"viewOpportunity", model:[opportunity:opportunity])
        }
    }
    
    def addOpportunity() {
        render(view:"editOpportunity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
                                                status:valueSetService.getOpportunityStatus(),
                                                products:valueSetService.getProductList(),
                                                impStatus:valueSetService.getImplementStatus()])
    }

    def updateOpportunity() {
        def opportunity = Opportunity.get(params.id)
        render(view:"editOpportunity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                                                opportunity:opportunity,
                                                status:valueSetService.getOpportunityStatus(),
                                                products:valueSetService.getProductList(),
                                                impStatus:valueSetService.getImplementStatus()])
    }
    
    def saveOpportunity() {
        def opportunity
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            opportunity = new Opportunity(params)
            def customer = Customer.get(params.customerId)
            opportunity.customer = customer
            opportunity.signedDate = StringUtils.string2Date(params.signedDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impStartDate = StringUtils.string2Date(params.impStartDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impEndDate = StringUtils.string2Date(params.impEndDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.createdDate = new Date()
            opportunity.createUser = User.get(1)
            opportunity.lastUpdatedDate = new Date()
            opportunity.lastUpdateUser = User.get(1)
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            opportunity = Opportunity.get(params.id)
            opportunity.properties = params
            opportunity.signedDate = StringUtils.string2Date(params.signedDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impStartDate = StringUtils.string2Date(params.impStartDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impEndDate = StringUtils.string2Date(params.impEndDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.lastUpdatedDate = new Date()
            opportunity.lastUpdateUser = User.get(1)
        }

        if (opportunity.save(flush:true)) {
            redirect(action:"listOpportunities")
        } else {
            render(view:"editOpportunity", model:[actionFlag:params.actionFlag,
                                                    opportunity:opportunity,
                                                    status:valueSetService.getOpportunityStatus(),
                                                    products:valueSetService.getProductList(),
                                                    impStatus:valueSetService.getImplementStatus()])
        }
    }
}
