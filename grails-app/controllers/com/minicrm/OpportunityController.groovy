package com.minicrm

class OpportunityController {

    def springSecurityService
    def opportunityService
    def customerService
    
    def index() {
        redirect(action:"listOpportunities")
    }
    
    def listOpportunities() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params)
        def opportunities = opportunityService.findOpportunityByCriteria(searchCriteria)
        render(view:"listOpportunities", model:[opportunities:opportunities,
                searchCriteria:searchCriteria])
    }
    
    def viewOpportunity() {
        def opportunity = Opportunity.read(params.id)
        if(opportunity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(opportunity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"viewOpportunity", model:[opportunity:opportunity])
        }
    }
    
    def addOpportunity() {
        render(view:"editOpportunity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
    }

    def updateOpportunity() {
        def opportunity = Opportunity.load(params.id)
        if(opportunity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(opportunity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editOpportunity", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                    opportunity:opportunity])
        }
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
            opportunity.createUser = springSecurityService.currentUser
            opportunity.lastUpdatedDate = new Date()
            opportunity.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            opportunity = Opportunity.load(params.id)
            opportunity.properties = params
            opportunity.signedDate = StringUtils.string2Date(params.txtSignedDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impStartDate = StringUtils.string2Date(params.txtImpStartDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.impEndDate = StringUtils.string2Date(params.txtImpEndDate, ConstUtils.DATE_DAY_FORMAT)
            opportunity.lastUpdatedDate = new Date()
            opportunity.lastUpdateUser = springSecurityService.currentUser
        }

        if (opportunity.save(flush:true)) {
            redirect(action:"listOpportunities")
        } else {
            render(view:"editOpportunity", model:[actionFlag:params.actionFlag,
                    opportunity:opportunity])
        }
    }
	
    def viewReceivable() {
        def receivable = Receivable.read(params.id)
        if(receivable == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(receivable.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"viewReceivable", model:[receivable:receivable])
        }
    }
	
    def addReceivable() {
        def opportunity = Opportunity.read(params.id)
        if(opportunity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(opportunity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editReceivable", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
                    opportunity:opportunity])
        }
    }
	
    def updateReceivable() {
        def receivable = Receivable.load(params.id)
        if(receivable == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(receivable.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editReceivable", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                    receivable:receivable,
                    opportunity:receivable.opportunity])
        }
    }
	
    def saveReceivable() {
        def receivable
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            receivable = new Receivable(params)
            def opportunity = Opportunity.get(params.opportunityId)
            receivable.opportunity = opportunity
            receivable.receiptDate = StringUtils.string2Date(params.txtReceiptDate, ConstUtils.DATE_DAY_FORMAT)
            receivable.createdDate = new Date()
            receivable.createUser = springSecurityService.currentUser
            receivable.lastUpdatedDate = new Date()
            receivable.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            receivable = Receivable.load(params.id)
            receivable.properties = params
            receivable.receiptDate = StringUtils.string2Date(params.txtReceiptDate, ConstUtils.DATE_DAY_FORMAT)
            receivable.lastUpdatedDate = new Date()
            receivable.lastUpdateUser = springSecurityService.currentUser
        }

        if (receivable.save(flush:true)) {
            redirect(action:"viewOpportunity", id:receivable.opportunity.id)
        } else {
            render(view:"editReceivable", model:[actionFlag:params.actionFlag,
                    receivable:receivable,
                    opportunity:receivable.opportunity])
        }
    }
	
    def deleteReceivable() {
        def receivable = Receivable.load(params.id)
        if(receivable == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(receivable.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            def opportunity = receivable.opportunity
            receivable.delete(flush:true)
            render(view:"viewOpportunity", model:[opportunity:opportunity])
        }
    }
	
    def viewInvoice() {
        def invoice = Invoice.read(params.id)
        if(invoice == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(invoice.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"viewInvoice", model:[invoice:invoice])
        }
    }
	
    def addInvoice() {
        def opportunity = Opportunity.read(params.id)
        if(opportunity == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(opportunity.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editInvoice", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
                    opportunity:opportunity])
        }
    }
	
    def updateInvoice() {
        def invoice = Invoice.load(params.id)
        if(invoice == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(invoice.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            render(view:"editInvoice", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                    invoice:invoice,
                    opportunity:invoice.opportunity])
        }
    }
	
    def saveInvoice() {
        def invoice
        if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
            invoice = new Invoice(params)
            def opportunity = Opportunity.get(params.opportunityId)
            invoice.opportunity = opportunity
            invoice.invoiceDate = StringUtils.string2Date(params.txtInvoiceDate, ConstUtils.DATE_DAY_FORMAT)
            invoice.createdDate = new Date()
            invoice.createUser = springSecurityService.currentUser
            invoice.lastUpdatedDate = new Date()
            invoice.lastUpdateUser = springSecurityService.currentUser
        } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
            invoice = Invoice.load(params.id)
            invoice.properties = params
            invoice.invoiceDate = StringUtils.string2Date(params.txtInvoiceDate, ConstUtils.DATE_DAY_FORMAT)
            invoice.lastUpdatedDate = new Date()
            invoice.lastUpdateUser = springSecurityService.currentUser
        }

        if (invoice.save(flush:true)) {
            redirect(action:"viewOpportunity", id:invoice.opportunity.id)
        } else {
            render(view:"editInvoice", model:[actionFlag:params.actionFlag,
                    invoice:invoice,
                    opportunity:invoice.opportunity])
        }
    }
	
    def deleteInvoice() {
        def invoice = Invoice.load(params.id)
        if(invoice == null) {
            redirect(controller:"errorHandler", action:"showObjectNotFound")
        } else if(!customerService.checkAccessable(invoice.opportunity?.customer)) {
            redirect(controller:"errorHandler", action:"showNoAccessable")
        } else {
            def opportunity = invoice.opportunity
            invoice.delete(flush:true)
            render(view:"viewOpportunity", model:[opportunity:opportunity])
        }

    }
}
