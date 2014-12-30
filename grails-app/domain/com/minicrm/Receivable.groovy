package com.minicrm

class Receivable {

    ValueSet receiptMethod
    BigDecimal receiptAmount
    Date receiptDate
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
        receiptMethod nullable:false
        receiptAmount nullable:false
        receiptDate nullable:true
        remark nullable:true
        opportunity nullable:false
        createdDate nullable: false
        createUser nullable: false
        lastUpdatedDate nullable: false
        lastUpdateUser nullable: false
    }
}
