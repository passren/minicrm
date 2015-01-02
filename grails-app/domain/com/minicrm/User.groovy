package com.minicrm

import java.util.Date;

import org.apache.commons.lang.builder.HashCodeBuilder

class User implements Serializable {

    private static final long serialVersionUID = 1
    
    transient springSecurityService

    String username
    String password
    String realname
    Person person
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false
    Date createdDate
    Date lastUpdatedDate
	
    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true, maxSize:20
        password blank: false
        realname blank: false, maxSize:50
        person nullable: true
        createdDate nullable: false
        lastUpdatedDate nullable: false
    }

    static mapping = {
        password column: '`password`'
    }

    boolean equals(other) {
        if (!(other instanceof User)) {
            return false
        }
        
        other.id == id
    }
    
    int hashCode() {
        def builder = new HashCodeBuilder().append(id)
        builder.toHashCode()
    }
    
    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}
