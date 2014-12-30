package com.minicrm

import java.util.Map;
import java.util.Set;

import grails.transaction.Transactional

@Transactional
class ActivityService {

    def Set<Activity> findActivityByCriteria(Map criteriaMap) {
        def criteria = Activity.createCriteria()
        return criteria {
            like("summary", "%${criteriaMap.search_activity_summary?.trim()}%")
            if(criteriaMap.search_activity_customer_name!=null &&
                !criteriaMap.search_activity_customer_name.isEmpty()){
                customer {
                    like("name", "%${criteriaMap.search_activity_customer_name?.trim()}%")
                }
            }
            if(criteriaMap.search_activity_type!=null && 
                criteriaMap.search_activity_type.isNumber()){
                type {
                    eq("id", criteriaMap.search_activity_type.toLong())
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
