class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        environments {
            development {
                def admin = new com.minicrm.Role(authority:"ROLE_ADMIN").save(flush:true)
                def sales = new com.minicrm.Role(authority:"ROLE_SALES").save(flush:true)
                def manager = new com.minicrm.Role(authority:"ROLE_SALES_MANAGER").save(flush:true)

                String password = "123"
                def adminUser = new com.minicrm.User(username:"admin", realname:"管理员", enabled: true, password:password).save(flush: true)
                def saleUser = new com.minicrm.User(username:"zhangs", realname:"Zhang Shan", enabled:true, password:password).save(flush:true)
				def saleUser2 = new com.minicrm.User(username:"renp", realname:"Ren Peng", enabled:true, password:password).save(flush:true)
                com.minicrm.UserRole.create(adminUser, admin)
                com.minicrm.UserRole.create(saleUser, sales)
				com.minicrm.UserRole.create(saleUser2, sales)
            }
        }
    }
    def destroy = {
    }
}
