package com.minicrm

class ErrorHandlerController {

    def showObjectNotFound() {
		flash.message = "无法找到对应的对象,请重试!"
		render(view:"showErrors")
	}
}
