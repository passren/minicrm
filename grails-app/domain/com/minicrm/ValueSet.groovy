package com.minicrm

import java.util.Set;

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
        category blank: false, maxSize: 20
        code blank: false, maxSize: 30
        code1 nullable: true, maxSize: 50
        code2 nullable: true, maxSize: 50
    }
}
