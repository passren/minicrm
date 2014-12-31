class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        environments {
            development {
//                def admin = new com.minicrm.Role(authority:"ADMIN").save(flush:true)
//                def sales = new com.minicrm.Role(authority:"SALES").save(flush:true)
//                def manager = new com.minicrm.Role(authority:"MANAGER").save(flush:true)
//
//                String password = springSecurityService.encodePassword("123")
//                def adminUser = new com.minicrm.User(username:"admin", realname:"administrator", enabled: true, password:password).save(flush: true)
//                def saleUser = new com.minicrm.User(username:"zs", realname:"zhang shan", enabled:true, password:password).save(flush:true)
//                com.minicrm.UserRole.create(adminUser, admin)
//                com.minicrm.UserRole.create(saleUser, sales)
//
//                new com.minicrm.Requestmap(url: "/*", configAttribute: "IS_AUTHENTICATED_ANONYMOUSLY").save()
//                new com.minicrm.Requestmap(url: "/customer/**", configAttribute: "SALES").save()
//                new com.minicrm.Requestmap(url: "/admin/**", configAttribute: "ADMIN").save()
            }
        }
    }
    def destroy = {
    }
}
