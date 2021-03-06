package com.minicrm

import java.util.Date;

class Contact {

    String name
    String department
    String position
    String deskphone
    String cellphone
    String qq
    String email
    String remark
    ValueSet status
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
        name blank:false, maxSize:50
        department nullable:true, maxSize:30
        position nullable:true, maxSize:30
        deskphone nullable:true, maxSize:20
        cellphone nullable:true, maxSize:20
        qq nullable:true, maxSize:20
        email nullable:true, email:true
        remark nullable:true
        status nullable: false
        customer nullable:false
        createdDate nullable: false
        createUser nullable: false
        lastUpdatedDate nullable: false
        lastUpdateUser nullable: false
    }
}
