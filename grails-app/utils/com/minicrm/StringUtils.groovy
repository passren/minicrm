/**
 * 
 */
package com.minicrm

import java.text.SimpleDateFormat

/**
 * @author PPQQ
 *
 */
class StringUtils {
    
    static def getDate = {Date date, String format ->
        if(date == null) return ""
        return new java.text.SimpleDateFormat(format).format(date)
    }
    
    static def string2Date = {String date, String format ->
        if(date==null || date.isEmpty()) return null
        def sdf = new SimpleDateFormat(format)
        return sdf.parse(date)
    }

    static def escapeHtml = {String src ->
        if(!src) {
                return ""
        }

        def builder = new StringBuilder();
        src.toCharArray().each(){ c ->
            switch(c) {
                case ' ': builder.append("&nbsp;")
                                        break
                case '<': builder.append("&lt;")
                                        break
                case '>': builder.append("&gt;")
                                        break
                case '&': builder.append("&amp;")
                                        break
                case '"': builder.append("&quot;")
                                        break
                case '\n': builder.append("<br>")
                                        break
                // We need Tab support here, because we print StackTraces as HTML
                case '\t': builder.append("&nbsp; &nbsp; &nbsp;")
                                        break
                default:
                if( c < 128 ) {
                        builder.append(c)
                } else {
                        builder.append("&#").append((int)c).append(";")
                }
            }
        }
        return builder.toString()
    }
	
	static def null2Blank = {String str ->
		return str==null ? "" : null2Blank
	}
}
