package com.minicrm

class AdminController {

    def index() {
		//redirect(action:"listUsers")
	}
	
	def listUsers() {
		def users = User.list(params)
		render(view:"listUsers", model:[users:users])
	}
}
