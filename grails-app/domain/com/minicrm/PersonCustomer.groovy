package com.minicrm

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder
class PersonCustomer implements Serializable {
	
	private static final long serialVersionUID = 1
	
	Person person
	Customer customer
	
	boolean equals(other) {
		if (!(other instanceof PersonCustomer)) {
			return false
		}

		other.customer?.id == customer?.id &&
		other.person?.id == person?.id
	}
	
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (customer) builder.append(customer.id)
		if (person) builder.append(person.id)
		builder.toHashCode()
	}
	
	static PersonCustomer get(long customerId, long personId) {
		PersonCustomer.where {
			customer == Customer.load(customerId) &&
			person == Person.load(personId)
		}.get()
	}

	static boolean exists(long customerId, long personId) {
		PersonCustomer.where {
			customer == Customer.load(customerId) &&
			person == Person.load(personId)
		}.count() > 0
	}

	static PersonCustomer create(Customer customer, Person person, boolean flush = false) {
		def instance = new PersonCustomer(Customer: customer, person: person)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Customer c, Person p, boolean flush = false) {
		if (c == null || p == null) return false

		int rowCount = PersonCustomer.where {
			customer == Customer.load(c.id) &&
			person == Person.load(p.id)
		}.deleteAll()

		if (flush) { PersonCustomer.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(Customer c, boolean flush = false) {
		if (c == null) return

		PersonCustomer.where {
			customer == Customer.load(c.id)
		}.deleteAll()

		if (flush) { PersonCustomer.withSession { it.flush() } }
	}

	static void removeAll(Person p, boolean flush = false) {
		if (p == null) return

		PersonCustomer.where {
			person == Person.load(p.id)
		}.deleteAll()

		if (flush) { PersonCustomer.withSession { it.flush() } }
	}
	
	static constraints = {
		person validator: { Person p, PersonCustomer pc ->
			if (pc.customer == null) return
			boolean existing = false
			PersonCustomer.withNewSession {
				existing = PersonCustomer.exists(pc.customer.id, p.id)
			}
			if (existing) {
				return 'salesPersonCustomer.exists'
			}
		}
	}

	static mapping = {
		id composite: ['person', 'customer']
		version false
	}

}
