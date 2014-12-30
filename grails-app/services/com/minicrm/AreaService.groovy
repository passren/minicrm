package com.minicrm

import java.util.Set;

import grails.transaction.Transactional

@Transactional
class AreaService {

    def Set<Province> getProvinces() {
		Province.list()
    }
	
	def Set<City> getCitiesByProvince(Province province) {
		City.findAllByProvince(province)
	}
	
	def Set<City> getCitiesByProvinceId(Integer id) {
		City.findAllByProvince(Province.get(id))
	}
}
