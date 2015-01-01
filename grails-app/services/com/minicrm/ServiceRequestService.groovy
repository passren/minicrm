package com.minicrm

import java.util.Map;
import java.util.Set;

import grails.transaction.Transactional

@Transactional
class ServiceRequestService {

    def Set<ServiceRequest> findServiceRequestByCriteria(Map criteriaMap) {
		def criteria = ServiceRequest.createCriteria()
		return criteria {
			if(criteriaMap.search_sr_customer_name!=null &&
				!criteriaMap.search_sr_customer_name.isEmpty()){
				customer {
					like("name", "%${criteriaMap.search_sr_customer_name?.trim()}%")
				}
			}
			if(criteriaMap.search_sr_class!=null &&
				criteriaMap.search_sr_class.isNumber()){
				classification {
					eq("id", criteriaMap.search_sr_class.toLong())
				}
			}
			if(criteriaMap.search_sr_status!=null &&
				criteriaMap.search_sr_status.isNumber()){
				status {
					eq("id", criteriaMap.search_sr_status.toLong())
				}
			}
			if(criteriaMap.search_sr_maintainer!=null &&
				!criteriaMap.search_sr_maintainer.isEmpty()){
				like("maintainer", "%${criteriaMap.search_sr_maintainer?.trim()}%")
			}
			if(criteriaMap.search_sr_owner!=null &&
				!criteriaMap.search_sr_owner.isEmpty()){
				like("owner", "%${criteriaMap.search_sr_owner?.trim()}%")
			}
			if(criteriaMap.order && criteriaMap.sort){
				order(criteriaMap.sort, criteriaMap.order)
			} else {
				order("lastUpdatedDate", "desc")
			}
		}
    }
}
