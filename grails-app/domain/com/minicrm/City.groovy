package com.minicrm

class City {
	
	String name
	Integer sort
	String remark
	
	Province province

	static mapping = {
		sort "sort"
		order "asc"
		version false
		cache true
	}
	
    static constraints = {
		name blank: false, maxSize: 40
		remark nullable: true
    }
}
