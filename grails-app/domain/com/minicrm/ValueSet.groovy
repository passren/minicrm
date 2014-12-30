package com.minicrm

class ValueSet {
	
	String category
	String code
	String code1
	String code2

	static mapping = {
		version false
		cache true
	}
	
    static constraints = {
		id composite: ['category', 'code']
		category blank: false
		code blank: false
		code1 nullable: true
		code2 nullable: true
    }
}
