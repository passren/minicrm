package com.minicrm

import grails.transaction.Transactional

@Transactional
class ValueSetService {

    def Set<ValueSet> getByCategory(String category) {
		ValueSet.findAllByCategory(category)
    }
	
	def ValueSet getByCode(String category,String code) {
		ValueSet.findByCategoryAndCode(category, code)
	}
	
	def Set<ValueSet> getCustomerCategory() {
		getByCategory(ConstUtils.CUSTOMER_CATEGORY)
	}
	
	def Set<ValueSet> getCustomerClassification() {
		getByCategory(ConstUtils.CUSTOMER_CLASSIFICATION)
	}
	
	def Set<ValueSet> getCustomerSource() {
		getByCategory(ConstUtils.CUSTOMER_SOURCE)
	}
	
	def Set<ValueSet> getCustomerStatus() {
		getByCategory(ConstUtils.CUSTOMER_STATUS)
	}
	
	def Set<ValueSet> getActivityType() {
		getByCategory(ConstUtils.ACTIVITY_TYPE)
	}
}
