package com.minicrm

class SalesPerson {
	
	String name
	
	static hasMany = [customer:Customer]

    static constraints = {
		name(blank:false, maxSize:50)
    }
}
