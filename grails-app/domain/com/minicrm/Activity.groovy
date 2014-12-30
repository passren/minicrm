package com.minicrm

import java.util.Date;

class Activity {
	
	String summary
	ValueSet type
	String issue
	String solution
	String remark
	Customer customer
	Date createdDate
	User createUser
	Date lastUpdatedDate
	User lastUpdateUser

	static mapping = {
		issue type:"text"
		solution type:"text"
		remark type:"text"
		sort "lastUpdatedDate"
		order "desc"
		cache true
	}
	
    static constraints = {
		summary blank:false, maxSize:500
		type nullable: false
		issue nullable:true
		solution nullable:true
		remark nullable:true
		customer nullable:false
		createdDate nullable: false
		createUser nullable: false
		lastUpdatedDate nullable: false
		lastUpdateUser nullable: false
    }
}
