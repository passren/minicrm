package com.minicrm

import java.util.Map;
import java.util.Set;

import grails.transaction.Transactional

@Transactional
class ActivityService {
	
    def springSecurityService
    def adminService
	
    def findActivityByCriteria(Map criteriaMap, boolean restricted=true) {
        def criteria = Activity.createCriteria()
        def user = springSecurityService.currentUser
		if(restricted) {
			restricted = !adminService.hasFullCustomerAccess(user)
		}
		
        return criteria.list(max: criteriaMap.max, offset: criteriaMap.offset) {
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
    
    def saveActivity(Activity activity) {
        if(activity==null) return false
        
        activity.lastUpdatedDate = new Date()
        activity.lastUpdateUser = springSecurityService.currentUser
        return activity.save(flush:true)
    }
    
    def saveActivity(Activity activity, Opportunity opportunity) {
        if(activity==null) return false
        
        def success = false
        activity.lastUpdatedDate = new Date()
        activity.lastUpdateUser = springSecurityService.currentUser
        
        if(activity.save() && opportunity!=null) {
            OpportunityActivity.create(opportunity, activity)
            Activity.withSession { it.flush() }
            success = true
        }
        
        success
    }
    
    def deleteActivity(Activity activity) {
        if(activity==null) return false
        
		OpportunityActivity.removeAll(activity)
		activity.delete()
        Activity.withSession { it.flush() }
        
        true
    }
}
