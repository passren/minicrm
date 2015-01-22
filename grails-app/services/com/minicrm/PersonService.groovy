package com.minicrm

import grails.transaction.Transactional

@Transactional
class PersonService {
	def springSecurityService
	def adminService
	
    def getStaffofManager(User manager, params) {
		if (manager!=null && manager.person!=null) {
			if (adminService.isGeneralManagerRole()) {
				return Person.list(params)
			} else {
				def criteria = Person.createCriteria()
				return criteria.list(params) {
					eq("supervisor", manager.person)
				}
			}
		}
    }
	
	def getPersonsWithoutSelf(Person person) {		
		if(person!=null) {
			return Person.findAll() {
				id != person.id
			}
		}
	}
}
