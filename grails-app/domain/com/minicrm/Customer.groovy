package com.minicrm

import java.util.Set;

class Customer {

	String name
	ValueSet category
	City city
	String address
	String remark
	ValueSet classification
	ValueSet source
	ValueSet status
	ValueSet situation
	Date createdDate
	User createUser
	Date lastUpdatedDate
	User lastUpdateUser
	
	static hasMany = [contact:Contact]

	static mapping = {
		remark type:"text"
		sort "lastUpdatedDate"
		order "desc"
		cache true
	}
	
    static constraints = {
		name blank: false, maxSize: 200, unique: true
		city nullable: false
		category nullable: true
		address nullable: true
		remark nullable: true
		classification nullable: true
		source nullable: true
		situation nullable: true
		status nullable: false
		createdDate nullable: false
		createUser nullable: false
		lastUpdatedDate nullable: false
		lastUpdateUser nullable: false
    }
	
	Set<Person> getAssignedPersons() {
		PersonCustomer.findAllByCustomer(this).collect { it.person }
	}
}
