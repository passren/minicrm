package com.minicrm

import grails.transaction.Transactional

@Transactional
class OpportunityService {

    def Set<Customer> findOpportunityByCriteria(Map criteriaMap) {
        def criteria = Opportunity.createCriteria()
        return criteria {
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
