package com.minicrm

import java.util.Map;
import java.util.Set;
import grails.transaction.Transactional

@Transactional
class OpportunityService {

    def springSecurityService
    def adminService
	
    def Set<Customer> findOpportunityByCriteria(Map criteriaMap, boolean restricted=true) {
        def criteria = Opportunity.createCriteria()
        def user = springSecurityService.currentUser
        restricted = !adminService.isSalesManagerRole()
		
        return criteria {
            if(restricted) {
                customer {
                    if(user!=null && user.person != null
                        && user.person.customers.size()>0 ) {
                        inList("id", user.person.customers.collect{ it.id })
                    } else {
                        inList("id", ["-1".toLong()])
                    }
                }
            }
            if(criteriaMap.search_opportunity_customer_name!=null &&
                !criteriaMap.search_opportunity_customer_name.isEmpty()){
                customer {
                    like("name", "%${criteriaMap.search_opportunity_customer_name?.trim()}%")
                }
            }
            if(criteriaMap.search_opportunity_status!=null &&
                criteriaMap.search_opportunity_status.isNumber()){
                status {
                    eq("id", criteriaMap.search_opportunity_status.toLong())
                }
            }
            if(criteriaMap.search_opportunity_product!=null &&
                criteriaMap.search_opportunity_product.isNumber()){
                product {
                    eq("id", criteriaMap.search_opportunity_product.toLong())
                }
            }
            if(criteriaMap.order && criteriaMap.sort){
                order(criteriaMap.sort, criteriaMap.order)
            } else {
                order("lastUpdatedDate", "desc") 
            }
        }
    }
}
