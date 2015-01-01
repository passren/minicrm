package com.minicrm

class AdminController {
	
	def adminService
	def springSecurityService
	
	def listUsers() {
		def users = User.list(params)
		render(view:"listUsers", model:[users:users])
	}
	
	def addUser() {
		render(view:"editUser", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
	}
	
	def updateUser() {
		def user = User.read(params.id)
		def roles = UserRole.findAllByUser(user).collect{ it.role.authority }
		render(view:"editUser", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
											user:user, roles:roles])
	}
	
	def saveUser() {
		def user
		if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
			user = new User(params)
			user.createdDate = new Date()
			user.lastUpdatedDate = new Date()
		} else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
			user = User.load(params.id)
			user.properties = params
			user.lastUpdatedDate = new Date()
		}
		
		def roles
		if(params.roles instanceof String) {
			roles = [params.roles]
		} else {
			roles = params.roles?.toList()
		}

		if (adminService.saveUser(user, roles)) {
			redirect(action:"listUsers")
		} else {
			render(view:"editUser", model:[actionFlag:params.actionFlag,
													user:user, roles:roles])
		}
	}
	
	def deleteUser() {
		def user = User.read(params.id)
		
		try {
			adminService.deleteUser(user)
		} catch(Exception e) {
			flash.message = e.message
		}
		
		redirect(action:"listUsers")
	}
	
	def listPersons() {
		def persons = Person.list(params)
		render(view:"listPersons", model:[persons:persons])
	}
	
	def addPerson() {
		render(view:"editPerson", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_ADD])
	}
	
	def updatePerson() {
		def person = Person.read(params.id)
		render(view:"editPerson", model:[actionFlag:ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE,
											person:person])
	}
	
	def savePerson() {
		def person
		if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_ADD) {
			person = new Person(params)
			person.createdDate = new Date()
            person.lastUpdatedDate = new Date()
		} else if (params.actionFlag == ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE) {
			person = Person.load(params.id)
			person.properties = params
			person.lastUpdatedDate = new Date()
		}

		if (person.save(flush:true)) {
			redirect(action:"listPersons")
		} else {
			render(view:"editPerson", model:[actionFlag:params.actionFlag,
													person:person])
		}
	}
	
	def deletePerson() {
		def person = Person.read(params.id)
		
		try {
			adminService.deletePerson(person)
		} catch(Exception e) {
			flash.message = e.message
		}
		
		redirect(action:"listPersons")
	}
}
