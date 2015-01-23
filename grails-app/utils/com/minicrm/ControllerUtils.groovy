/**
 * 
 */
package com.minicrm

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

/**
 * @author peng
 *
 */
class ControllerUtils {

	static def buildSearchCriteria(GrailsParameterMap paramsMap, boolean pagination=false) {
		def searchCriteria = [:]
		paramsMap.each {
			if(it.key.startsWith("search_")) {
				searchCriteria.put(it.key, it.value)
			}
			if(it.key in ["sort", "order"]) {
				searchCriteria.put(it.key, it.value)
			}
		}
		
		if(pagination) {
			searchCriteria.put("offset", paramsMap.offset)
			paramsMap.max!=null?searchCriteria.put("max", paramsMap.max):searchCriteria.put("max", ConstUtils.PAGE_MAX_RECORDS)
		}
		
		return searchCriteria
	}
}
