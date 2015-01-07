package com.minicrm

import java.io.Serializable;
import java.util.Date;
import org.apache.commons.lang.builder.HashCodeBuilder

class Person implements Serializable {
	
	private static final long serialVersionUID = 1
	
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
	
    User getUser() {
        User.findByPerson(this)
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
	
	boolean equals(other) {
		if (!(other instanceof Person)) {
			return false
		}
		
		other.id == id
	}
	
	int hashCode() {
		def builder = new HashCodeBuilder().append(id)
		builder.toHashCode()
	}
}
