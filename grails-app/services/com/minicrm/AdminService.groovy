package com.minicrm

import grails.transaction.Transactional

@Transactional
class AdminService {

    def springSecurityService
	
    def saveUser(User user, Set<String> roles) {
        def success = false
		
        if (user.save(flush:true)) {
            UserRole.removeAll(user)
            roles.each {
                UserRole.create user, Role.findByAuthority(it), true
            }
			
            success = true
        }
		
        success
    }
	
    def deleteUser(User user) {
        if(user==null) return
		
        UserRole.removeAll(user)
        def u = User.load(user.id)
        u.delete(flush:true)
    }
	
    def deletePerson(Person person) {
        if(person==null) return
		
        def u = User.findByPerson(person)
        u.person = null
		
        if(u.save()) {
            def p = Person.load(person.id)
            p.delete(flush:true)
        }
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

    def isSalesManagerRole(User user) {
        boolean managerRole = false
        user?.authorities.each {
            if(it.authority == ConstUtils.ROLE_SALES_MANAGER) {
                managerRole = true
            }
        }
        managerRole
    }
    
    def isSalesManagerRole() {
        isSalesManagerRole(springSecurityService.currentUser)
    }
    
    def isSalesRole(User user) {
        boolean salesRole = false
        user?.authorities.each {
            if(it.authority == ConstUtils.ROLE_SALES) {
                salesRole = true
            }
        }
        salesRole
    }
    
    def isSalesRole() {
        isSalesRole(springSecurityService.currentUser)
    }
}
