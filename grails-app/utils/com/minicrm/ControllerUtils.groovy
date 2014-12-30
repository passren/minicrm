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

	static def buildSearchCriteria(GrailsParameterMap paramsMap) {
		def searchCriteria = [:]
		paramsMap.each {
			if(it.key.startsWith("search_")) {
				searchCriteria.put(it.key, it.value)
			}
			if(it.key in ["sort", "order"]) {
				searchCriteria.put(it.key, it.value)
			}
		}
		
		return searchCriteria
	}
}
