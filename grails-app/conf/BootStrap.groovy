class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        environments {
            development {
                def admin = new com.minicrm.Role(authority:"ROLE_ADMIN", description:"管理员").save(flush:true)
                def sales = new com.minicrm.Role(authority:"ROLE_SALES", description:"销售人员").save(flush:true)
                def manager = new com.minicrm.Role(authority:"ROLE_SALES_MANAGER", description:"销售经理").save(flush:true)

                String password = "123"
                def adminUser = new com.minicrm.User(username:"admin", 
														realname:"管理员", 
														enabled: true, 
														password:password,
														createdDate:new Date(),
														lastUpdatedDate:new Date()).save(flush: true)
                com.minicrm.UserRole.create(adminUser, admin)
            }
        }
    }
    def destroy = {
    }
}
