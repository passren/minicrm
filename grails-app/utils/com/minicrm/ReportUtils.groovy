package com.minicrm

/**
 * @author PPQQ
 *
 */
class ReportUtils {
	
    static def getMessageCode = {String reportCode ->
        return "com.minicrm.report.name."+reportCode
    }
	
	static def getDrawFileName = {String reportCode ->
		return reportCode + StringUtils.getDate(new Date(), ConstUtils.DATE_TIME_FROMAT1) + ".png"
	}
}
