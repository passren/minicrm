package com.minicrm

class Invoice {
    
    ValueSet invoiceType
    BigDecimal invoiceAmount
    String invoiceNumber
    String invoiceTrack
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
        invoiceAmount nullable:false
        invoiceNumber nullable:true
        invoiceTrack nullable:true
        remark nullable:true
        opportunity nullable:false
        createdDate nullable: false
        createUser nullable: false
        lastUpdatedDate nullable: false
        lastUpdateUser nullable: false
    }
}
