package com.minicrm

import grails.converters.JSON

class CustomerController {
	
	def springSecurityService
    def customerService
	def areaService

    def index() {
        redirect(action:"listCustomers")
    }
	
    def listCustomers() {
        def searchCriteria = ControllerUtils.buildSearchCriteria(params)

        def customers
        if(searchCriteria.size() == 0) {
                customers = Customer.list(params)
        } else {
                customers = customerService.findCustomerByCriteria(searchCriteria)
        }

        render(view:"listCustomers", model:[customers:customers,
                                                searchCriteria:searchCriteria])
    }

    def getCustomersAsJson() {
            def searchCriteria = ControllerUtils.buildSearchCriteria(params)
            def customers = customerService.findCustomerByCriteria(searchCriteria)

            render(contentType: "application/json") {
                    customers.collect {
                            [id:it.id, name:it.name, address:it.address]
                    }
            }
    }

    def viewCustomer() {
            def customer = Customer.get(params.id)
            if(customer == null) {
                    redirect(controller:"errorHandler", action:"showObjectNotFound")
            } else {
                    def contacts = Contact.findAllByCustomer(customer, params)
                    render(view:"viewCustomer", model:[customer:customer, 
                                                            contacts:contacts])
            }
    }

    def viewContact() {
            def contact = Contact.get(params.id)
            if(contact == null) {
                    redirect(controller:"errorHandler", action:"showObjectNotFound")
            } else {
                    render(view:"viewContact", model:[contact:contact])
            }
    }

    def addCustomer() {
            render(view:"editCustomer", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
    }

    def updateCustomer() {
            def customer = Customer.get(params.id)
            render(view:"editCustomer", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE, 
                                                    customer:customer])
    }

    def getCitiesByProvince() {
            def cities = areaService.getCitiesByProvinceId(params.province_id.toInteger())
            render(contentType: "application/json") {
                    cities.collect {
                            [id:it.id, name:it.name]
                    }
            }
    }

    def saveCustomer() {
            def customer
            if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
                    customer = new Customer(params)
                    customer.createdDate = new Date()
                    customer.createUser = springSecurityService.currentUser
                    customer.lastUpdatedDate = new Date()
                    customer.lastUpdateUser = springSecurityService.currentUser
            } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
                    customer = Customer.get(params.id)
                    customer.properties = params
                    customer.lastUpdatedDate = new Date()
                    customer.lastUpdateUser = springSecurityService.currentUser
            }

            if (customer.save(flush:true)) {
                    redirect(action:"listCustomers")
            } else {
                    render(view:"editCustomer", model:[actionFlag:params.actionFlag, 
                                                        customer:customer])
            }
    }

    def addContact() {
            def customer = Customer.get(params.id)
            render(view:"editContact", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD,
                                                customer:customer])
    }

    def updateContact() {
            def contact = Contact.get(params.id)
            render(view:"editContact", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
                                                contact:contact,
                                                customer:contact.customer])
    }

    def saveContact() {
            def customer = Customer.get(params.customerId)

            def contact
            if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
                    contact = new Contact(params)
                    contact.customer = customer
                    contact.createdDate = new Date()
                    contact.createUser = springSecurityService.currentUser
                    contact.lastUpdatedDate = new Date()
                    contact.lastUpdateUser = springSecurityService.currentUser
            } else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
                    contact = Contact.get(params.id)
                    contact.properties = params
                    contact.lastUpdatedDate = new Date()
                    contact.lastUpdateUser = springSecurityService.currentUser
            }

            if (contact.save(flush:true)) {
                    redirect(action:"viewCustomer", id:customer.id)
            } else {
                    render(view:"editContact", model:[actionFlag:params.actionFlag,
                                                        customer:customer,
                                                        contact:contact])
            }
    }
}
