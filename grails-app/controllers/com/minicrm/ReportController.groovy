package com.minicrm

class ReportController {

    def reportService
    
    def customerDist() {
        def resultData = reportService.findCustomerDist()
        render(view:"reportMainLayout", model:[reportCode:"customerDist",
                                                resultData:resultData])
    }
    
    def customerDistChart() {
        def resultData = reportService.findCustomerDist()
        render(view:"reportMainLayout", model:[reportCode:"customerDistChart",
                                                resultData:resultData])
    }
}
