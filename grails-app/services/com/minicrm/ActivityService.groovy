package com.minicrm

import java.util.Map;
import java.util.Set;

import grails.transaction.Transactional

@Transactional
class ActivityService {
	
    def springSecurityService
    def adminService
	
    def Set<Activity> findActivityByCriteria(Map criteriaMap, boolean restricted=true) {
        def criteria = Activity.createCriteria()
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
            if(criteriaMap.search_activity_summary!=null &&
                !criteriaMap.search_activity_summary.isEmpty()) {
                like("summary", "%${criteriaMap.search_activity_summary?.trim()}%")
            }
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
