package com.minicrm

import grails.transaction.Transactional

@Transactional
class CustomerService {
	
    def springSecurityService
    def adminService

    def Set<Customer> findCustomerByCriteria(Map criteriaMap, boolean restricted=true) {
        def criteria = Customer.createCriteria()
        def user = springSecurityService.currentUser
        restricted = !adminService.isSalesManagerRole()
		
        return criteria {
            if(restricted) {
                if(user!=null && user.person != null 
                    && user.person.customers.size()>0 ) {
                    inList("id", user.person.customers.collect{ it.id })
                } else {
                    inList("id", ["-1".toLong()])
                }
            }
            if(criteriaMap.search_customer_name!=null &&
                !criteriaMap.search_customer_name.isEmpty()) {
                like("name", "%${criteriaMap.search_customer_name?.trim()}%")
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_category.isNumber()){
                category {
                    eq("id", criteriaMap.search_customer_category.toLong())
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_province.isNumber()){
                city {
                    province {
                        eq("id", criteriaMap.search_customer_province.toLong())
                    }
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_classification.isNumber()){
                classification {
                    eq("id", criteriaMap.search_customer_classification.toLong())
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_source.isNumber()){
                source {
                    eq("id", criteriaMap.search_customer_source.toLong())
                }
            }
            if(criteriaMap.order && criteriaMap.sort){
                order(criteriaMap.sort, criteriaMap.order)
            } else {
                order("lastUpdatedDate", "desc") 
            }
        }
    }
    
    def saveCustomer(Customer customer) {
        def success = false
        
        if(customer.save(flush:true)) {
            def u = springSecurityService.currentUser
            if(u != null && u.person != null) {
                PersonCustomer.create(customer, u.person)
            }
            success = true
        }
        
        success
    }
    
    def checkAccessable(Customer customer, User user) {
        def accessable = false

        def c = customer?.read(customer.id)
        if (adminService.isSalesManagerRole(user)) {
            accessable = true
        } else {
            c?.assignedUsers.each {
                if(it == user) {
                    accessable = true
                }
            }
        }
        
        accessable
    }
    
    def checkAccessable(Customer customer) {
        checkAccessable(customer, springSecurityService.currentUser)
    }
    
    def saveCustomerAssignement(Person person, Set<Integer> customerIds) {
        PersonCustomer.removeAll(person)
        customerIds.each {
            def c = Customer.load(it)
            def p = Person.load(person.id)
            PersonCustomer.create(c, p)
        }
        PersonCustomer.withSession { it.flush() }
    }
}
