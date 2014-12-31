package com.minicrm

class Invoice {
    
    ValueSet invoiceType
    BigDecimal invoiceAmount
	Date invoiceDate
    String invoiceNumber
    String remark
    Opportunity opportunity
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
        invoiceType nullable:false
        invoiceAmount nullable:false, blank:false
		invoiceDate nullable:false, blank:false
        invoiceNumber nullable:true
        remark nullable:true
        opportunity nullable:false
        createdDate nullable: false
        createUser nullable: false
        lastUpdatedDate nullable: false
        lastUpdateUser nullable: false
    }
}
