package com.minicrm

import org.apache.commons.lang.builder.HashCodeBuilder

class Role implements Serializable {

    private static final long serialVersionUID = 1
    
    String authority
    String description

    static mapping = {
            cache true
    }

    static constraints = {
            authority blank: false, unique: true
            description blank: false
    }
    
    boolean equals(other) {
        if (!(other instanceof Role)) {
            return false
        }
        
        other.id == id
    }
    
    int hashCode() {
        def builder = new HashCodeBuilder().append(id)
        builder.toHashCode()
    }
}
