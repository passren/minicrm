package com.minicrm

class Province {
	
	String name
	Integer sort
	String remark

	static hasMany = [city:City]
	
	static mapping = {
		sort "sort"
		order "asc"
		version false
		cache true
	}
	
    static constraints = {
		name blank: false, maxSize: 30, unique: true
		remark nullable: true
    }
	
}
