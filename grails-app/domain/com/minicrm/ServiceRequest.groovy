package com.minicrm

import java.util.Date;

class ServiceRequest {

	String name
	ValueSet classification
	ValueSet status
	Date completedDate
	String maintainer
	String owner
	String remark
	Customer customer
	Date createdDate
	User createUser
	Date lastUpdatedDate
	User lastUpdateUser
	
	static mapping = {
		remark type:"text"
		sort "lastUpdatedDate"
		order "desc"
		cache true
	}
	
    static constraints = {
		name blank:false
		classification nullable:false
		status nullable:false
		completedDate nullable:true
		maintainer nullable:true, blank:true
		owner nullable:true, blank:true
		remark nullable:true
		customer nullable:false
		createdDate nullable: false
		createUser nullable: false
		lastUpdatedDate nullable: false
		lastUpdateUser nullable: false
    }
}
