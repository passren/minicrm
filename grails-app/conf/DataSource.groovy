dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    //    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            //            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            //            url = "jdbc:h2:file:database/minicrmDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            
            dbCreate = "update"
            pooled = true
            url = "jdbc:mysql://127.0.0.1:3306/minicrm-dev"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "minicrm-dev"
            password = "minicrm-dev"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
            }
        }
    }
    test {
        dataSource {
            dbCreate = "validate"
            pooled = true
            url = "jdbc:mysql://127.0.0.1:3306/minicrm-test"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "minicrm-test"
            password = "minicrm-test"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
            }
        }
    }
    production {
        dataSource {
            dbCreate = "validate"
            pooled = true
            url = "jdbc:mysql://127.0.0.1:3306/minicrm"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "minicrm"
            password = "fdiur873"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
            }
        }
    }
}
