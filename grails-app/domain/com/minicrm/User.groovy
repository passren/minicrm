package com.minicrm

import java.util.Date;

class User {

	transient springSecurityService

	String username
	String password
	String realname
	Person person
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	Date createdDate
	Date lastUpdatedDate
	
	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		realname blank: false
		person nullable: true
		createdDate nullable: false
		lastUpdatedDate nullable: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
