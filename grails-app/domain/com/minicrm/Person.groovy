package com.minicrm

import java.util.Date;

class Person {
	
	String name
	String jobnumber
	ValueSet jobposition
	Person supervisor
	ValueSet status
	Date createdDate
	Date lastUpdatedDate
	
	Set<Customer> getCustomers() {
		PersonCustomer.findAllByPerson(this).collect { it.customer }
	}

    static constraints = {
		name blank:false, maxSize:50
		jobnumber nullable: true
		jobposition nullable: true
		status nullable: true
		supervisor nullable: true
		createdDate nullable: false
		lastUpdatedDate nullable: false
    }
	
	static mapping = {
		sort "lastUpdatedDate"
		order "desc"
		cache true
	}
}
