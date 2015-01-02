package com.minicrm

class ErrorHandlerController {

    def showObjectNotFound() {
        flash.message = "无法找到对应的对象,请重试!"
        render(view:"showErrors")
    }
    
    def showNoAccessable() {
        flash.message = "你没有此对象的访问权限，请联系管理员!"
        render(view:"showErrors")
    }
}
