package com.minicrm

import grails.transaction.Transactional

@Transactional
class CustomerService {

    def Set<Customer> findCustomerByCriteria(Map criteriaMap) {
        def criteria = Customer.createCriteria()
        return criteria {
            like("name", "%${criteriaMap.search_customer_name?.trim()}%")
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_category.isNumber()){
                category {
                    eq("id", criteriaMap.search_customer_category.toLong())
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_province.isNumber()){
                city {
                    province {
                        eq("id", criteriaMap.search_customer_province.toLong())
                    }
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_classification.isNumber()){
                classification {
                    eq("id", criteriaMap.search_customer_classification.toLong())
                }
            }
            if(criteriaMap.search_customer_category!=null &&
                criteriaMap.search_customer_source.isNumber()){
                source {
                    eq("id", criteriaMap.search_customer_source.toLong())
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
