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
				return Person.findAll(params) {
					supervisor == manager.person
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
