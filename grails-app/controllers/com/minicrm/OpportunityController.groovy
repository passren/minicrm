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
            opportunity.signedDate = StringUtils.string2Date(params.txtSignedDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impStartDate = StringUtils.string2Date(params.txtImpStartDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impEndDate = StringUtils.string2Date(params.txtImpEndDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.createdDate = new Date()
            opportunity.createUser = User.get(1)
            opportunity.lastUpdatedDate = new Date()
            opportunity.lastUpdateUser = User.get(1)
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            opportunity = Opportunity.get(params.id)
            opportunity.properties = params
            opportunity.signedDate = StringUtils.string2Date(params.txtSignedDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impStartDate = StringUtils.string2Date(params.txtImpStartDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impEndDate = StringUtils.string2Date(params.txtImpEndDate, ConstUtils.DATE_DAY_FORMAT)
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
	
	def viewReceivable() {
		def receivable = Receivable.get(params.id)
		render(view:"viewReceivable", model:[receivable:receivable])
	}
	
	def addReceivable() {
		def opportunity = Opportunity.get(params.id)
		render(view:"editReceivable", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
												opportunity:opportunity,
												receiptMethods:valueSetService.getReceiptMethod()])
	}
	
	def updateReceivable() {
		def receivable = Receivable.get(params.id)
		render(view:"editReceivable", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
												receivable:receivable,
												opportunity:receivable.opportunity,
												receiptMethods:valueSetService.getReceiptMethod()])
	}
	
	def saveReceivable() {
		def receivable
		if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
			receivable = new Receivable(params)
			def opportunity = Opportunity.get(params.opportunityId)
			receivable.opportunity = opportunity
			receivable.receiptDate = StringUtils.string2Date(params.txtReceiptDate, ConstUtils.DATE_DAY_FORMAT)
			receivable.createdDate = new Date()
			receivable.createUser = User.get(1)
			receivable.lastUpdatedDate = new Date()
			receivable.lastUpdateUser = User.get(1)
		} else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
			receivable = Receivable.get(params.id)
			receivable.properties = params
			receivable.receiptDate = StringUtils.string2Date(params.txtReceiptDate, ConstUtils.DATE_DAY_FORMAT)
			receivable.lastUpdatedDate = new Date()
			receivable.lastUpdateUser = User.get(1)
		}

		if (receivable.save(flush:true)) {
			redirect(action:"viewOpportunity", id:receivable.opportunity.id)
		} else {
			render(view:"editReceivable", model:[actionFlag:params.actionFlag,
													receivable:receivable,
													opportunity:receivable.opportunity,
													receiptMethods:valueSetService.getReceiptMethod()])
		}
	}
	
	def deleteReceivable() {
		def receivable = Receivable.get(params.id)
		def opportunity = receivable.opportunity
		
		receivable.delete(flush:true)
		render(view:"viewOpportunity", model:[opportunity:opportunity])
	}
	
	def viewInvoice() {
		def invoice = Invoice.get(params.id)
		render(view:"viewInvoice", model:[invoice:invoice])
	}
	
	def addInvoice() {
		def opportunity = Opportunity.get(params.id)
		render(view:"editInvoice", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
												opportunity:opportunity,
												invoiceTypes:valueSetService.getInvoiceType()])
	}
	
	def updateInvoice() {
		def invoice = Invoice.get(params.id)
		render(view:"editInvoice", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
												invoice:invoice,
												opportunity:invoice.opportunity,
												invoiceTypes:valueSetService.getInvoiceType()])
	}
	
	def saveInvoice() {
		def invoice
		if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
			invoice = new Invoice(params)
			def opportunity = Opportunity.get(params.opportunityId)
			invoice.opportunity = opportunity
			invoice.invoiceDate = StringUtils.string2Date(params.txtInvoiceDate, ConstUtils.DATE_DAY_FORMAT)
			invoice.createdDate = new Date()
			invoice.createUser = User.get(1)
			invoice.lastUpdatedDate = new Date()
			invoice.lastUpdateUser = User.get(1)
		} else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
			invoice = Invoice.get(params.id)
			invoice.properties = params
			invoice.invoiceDate = StringUtils.string2Date(params.txtInvoiceDate, ConstUtils.DATE_DAY_FORMAT)
			invoice.lastUpdatedDate = new Date()
			invoice.lastUpdateUser = User.get(1)
		}

		if (invoice.save(flush:true)) {
			redirect(action:"viewOpportunity", id:invoice.opportunity.id)
		} else {
			render(view:"editInvoice", model:[actionFlag:params.actionFlag,
													invoice:invoice,
													opportunity:invoice.opportunity,
													invoiceTypes:valueSetService.getInvoiceType()])
		}
	}
	
	def deleteInvoice() {
		def invoice = Invoice.get(params.id)
		def opportunity = invoice.opportunity
		
		invoice.delete(flush:true)
		render(view:"viewOpportunity", model:[opportunity:opportunity])
	}
}
