package com.minicrm

import grails.transaction.Transactional

@Transactional
class AdminService {

    def saveUser(User user, List<String> roles) {
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
}
