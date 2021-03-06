package com.minicrm

class Opportunity {
    
    ValueSet status
    Integer possibility = 0
    ValueSet product
    Date signedDate
    String contractNumber
    BigDecimal contractAmount
    String remark
    
    ValueSet impStatus
    Date impStartDate
    Date impEndDate
    String impArea
    String certificationAccount
    String certificationNumber
    String impOthers
    
    Customer customer
    Date createdDate
    User createUser
    Date lastUpdatedDate
    User lastUpdateUser

    static hasMany = [receivables:Receivable, invoices:Invoice]
    
    static mapping = {
        remark type:"text"
        sort "lastUpdatedDate"
        order "desc"
        cache true
    }
    
    static constraints = {
        status nullable:false
        possibility nullable:false
        product nullable:false
        signedDate nullable:true
        contractNumber nullable:true
        contractAmount nullable:true
        impStatus nullable:true
        impStartDate nullable:true
        impEndDate nullable:true
        impArea nullable:true
        certificationNumber nullable:true
        impOthers nullable:true
        certificationAccount nullable:true
        remark nullable:true
        customer nullable:false
        createdDate nullable: false
        createUser nullable: false
        lastUpdatedDate nullable: false
        lastUpdateUser nullable: false
    }
}
