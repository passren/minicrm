databaseChangeLog = {

	changeSet(author: "peng (generated)", id: "1420371564922-1") {
		createTable(tableName: "activity") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "activityPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "customer_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "issue", type: "longtext")

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "longtext")

			column(name: "solution", type: "longtext")

			column(name: "summary", type: "varchar(500)") {
				constraints(nullable: "false")
			}

			column(name: "type_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-2") {
		createTable(tableName: "city") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "cityPK")
			}

			column(name: "name", type: "varchar(40)") {
				constraints(nullable: "false")
			}

			column(name: "province_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "varchar(255)")

			column(name: "sort", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-3") {
		createTable(tableName: "contact") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "contactPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "cellphone", type: "varchar(20)")

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "customer_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "department", type: "varchar(30)")

			column(name: "deskphone", type: "varchar(20)")

			column(name: "email", type: "varchar(255)")

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(50)") {
				constraints(nullable: "false")
			}

			column(name: "position", type: "varchar(30)")

			column(name: "qq", type: "varchar(20)")

			column(name: "remark", type: "longtext")

			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-4") {
		createTable(tableName: "customer") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "customerPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "address", type: "varchar(255)")

			column(name: "category_id", type: "bigint")

			column(name: "city_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "classification_id", type: "bigint")

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(200)") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "longtext")

			column(name: "situation_id", type: "bigint")

			column(name: "source_id", type: "bigint")

			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-5") {
		createTable(tableName: "invoice") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "invoicePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "invoice_amount", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "invoice_date", type: "datetime")

			column(name: "invoice_number", type: "varchar(255)")

			column(name: "invoice_type_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "opportunity_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "longtext")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-6") {
		createTable(tableName: "opportunity") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "opportunityPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "certification_account", type: "varchar(255)")

			column(name: "certification_number", type: "varchar(255)")

			column(name: "contract_amount", type: "decimal(19,2)")

			column(name: "contract_number", type: "varchar(255)")

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "customer_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "imp_area", type: "varchar(255)")

			column(name: "imp_end_date", type: "datetime")

			column(name: "imp_others", type: "varchar(255)")

			column(name: "imp_start_date", type: "datetime")

			column(name: "imp_status_id", type: "bigint")

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "possibility", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "product_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "longtext")

			column(name: "signed_date", type: "datetime")

			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-7") {
		createTable(tableName: "person") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "personPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "jobnumber", type: "varchar(255)")

			column(name: "jobposition_id", type: "bigint")

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(50)") {
				constraints(nullable: "false")
			}

			column(name: "status_id", type: "bigint")

			column(name: "supervisor_id", type: "bigint")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-8") {
		createTable(tableName: "person_customer") {
			column(name: "person_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "customer_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-9") {
		createTable(tableName: "province") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "provincePK")
			}

			column(name: "name", type: "varchar(30)") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "varchar(255)")

			column(name: "sort", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-10") {
		createTable(tableName: "receivable") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "receivablePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "opportunity_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "receipt_amount", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "receipt_date", type: "datetime")

			column(name: "receipt_method_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "remark", type: "longtext")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-11") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-12") {
		createTable(tableName: "service_request") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "service_requePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "classification_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "completed_date", type: "datetime")

			column(name: "create_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "customer_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_update_user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "maintainer", type: "varchar(255)")

			column(name: "name", type: "varchar(500)") {
				constraints(nullable: "false")
			}

			column(name: "owner", type: "varchar(255)")

			column(name: "remark", type: "longtext")

			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-13") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "created_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "last_updated_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "person_id", type: "bigint")

			column(name: "realname", type: "varchar(50)") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(20)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-14") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-15") {
		createTable(tableName: "value_set") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "value_setPK")
			}

			column(name: "category", type: "varchar(50)") {
				constraints(nullable: "false")
			}

			column(name: "code", type: "varchar(50)") {
				constraints(nullable: "false")
			}

			column(name: "code1", type: "varchar(50)")

			column(name: "code2", type: "varchar(50)")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-16") {
		addPrimaryKey(columnNames: "person_id, customer_id", constraintName: "person_customPK", tableName: "person_customer")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-17") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-62") {
		createIndex(indexName: "FK_ete5tcw8rix1yel1bqabo6huf", tableName: "activity") {
			column(name: "customer_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-63") {
		createIndex(indexName: "FK_ix5u1avo5j6kbtha9oahn44ob", tableName: "activity") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-64") {
		createIndex(indexName: "FK_pqxm9f3ypyey3wrq7n44e2ya8", tableName: "activity") {
			column(name: "type_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-65") {
		createIndex(indexName: "FK_yolprg6gwxcp1b783v8q3w1h", tableName: "activity") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-66") {
		createIndex(indexName: "FK_d6wmr68dljice4y25ykax6rfs", tableName: "city") {
			column(name: "province_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-67") {
		createIndex(indexName: "FK_3hlsf5vnymigpcq5hsdy8cveg", tableName: "contact") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-68") {
		createIndex(indexName: "FK_3tg5xm2jws24fhptnehre5gtl", tableName: "contact") {
			column(name: "customer_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-69") {
		createIndex(indexName: "FK_fgqygeg0k5jr8sldq2wf0p7y9", tableName: "contact") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-70") {
		createIndex(indexName: "FK_fta0tx6x9r96nrmq231x9q4pu", tableName: "contact") {
			column(name: "status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-71") {
		createIndex(indexName: "FK_6m86ncy1c8dbskwgx3w3tiqsw", tableName: "customer") {
			column(name: "category_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-72") {
		createIndex(indexName: "FK_aagw3i5c7f21bo427ehqtexnf", tableName: "customer") {
			column(name: "situation_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-73") {
		createIndex(indexName: "FK_gvjkct7rr6nk8esinc7m5dfpf", tableName: "customer") {
			column(name: "source_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-74") {
		createIndex(indexName: "FK_jlc87hfhrhqpq4pc1my9447wf", tableName: "customer") {
			column(name: "city_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-75") {
		createIndex(indexName: "FK_mtcogn8yyp15euyrhtyxed2md", tableName: "customer") {
			column(name: "status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-76") {
		createIndex(indexName: "FK_qq0q6f6yd4vresx27nuf9frsa", tableName: "customer") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-77") {
		createIndex(indexName: "FK_r73wg8dlc23h1eigx0d3gd08f", tableName: "customer") {
			column(name: "classification_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-78") {
		createIndex(indexName: "FK_uknof74ai0rlyxyx03rxn7gl", tableName: "customer") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-79") {
		createIndex(indexName: "name_uniq_1420371564771", tableName: "customer", unique: "true") {
			column(name: "name")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-80") {
		createIndex(indexName: "FK_ctrr95ih7ewuw7s6phoas4dg7", tableName: "invoice") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-81") {
		createIndex(indexName: "FK_g1ef4k48xrwrxijf66wx1bf8p", tableName: "invoice") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-82") {
		createIndex(indexName: "FK_kk1s6lwwfkbdqosp3re1e8dhg", tableName: "invoice") {
			column(name: "invoice_type_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-83") {
		createIndex(indexName: "FK_r533u8nrfgcyp0b3qhrqtch6t", tableName: "invoice") {
			column(name: "opportunity_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-84") {
		createIndex(indexName: "FK_1nbi5i61r9iowowh6noiejxxg", tableName: "opportunity") {
			column(name: "imp_status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-85") {
		createIndex(indexName: "FK_7bbbnd15fe55xfr0rnqplcxyv", tableName: "opportunity") {
			column(name: "product_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-86") {
		createIndex(indexName: "FK_7s9o0jnjs4aus4ilrix32wg8d", tableName: "opportunity") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-87") {
		createIndex(indexName: "FK_840nhbtspjclr81hpuqnvpbik", tableName: "opportunity") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-88") {
		createIndex(indexName: "FK_qt22sgkju5bgw9pcqm88h0um", tableName: "opportunity") {
			column(name: "customer_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-89") {
		createIndex(indexName: "FK_s0scp1n9aji0tw9c1co9wa8ha", tableName: "opportunity") {
			column(name: "status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-90") {
		createIndex(indexName: "FK_6jig8jkahfsdt0y0kbep19mti", tableName: "person") {
			column(name: "status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-91") {
		createIndex(indexName: "FK_7n6h6bky4qp49e13hygbnfmx4", tableName: "person") {
			column(name: "jobposition_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-92") {
		createIndex(indexName: "FK_f5hhe53ncti5mbcgvr8eq73th", tableName: "person") {
			column(name: "supervisor_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-93") {
		createIndex(indexName: "FK_9opnsgxynmhxp80ctniladvar", tableName: "person_customer") {
			column(name: "customer_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-94") {
		createIndex(indexName: "FK_e2qijpbj7q0o9s5nm1hipxa5n", tableName: "person_customer") {
			column(name: "person_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-95") {
		createIndex(indexName: "name_uniq_1420371564792", tableName: "province", unique: "true") {
			column(name: "name")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-96") {
		createIndex(indexName: "FK_896bua4het7i6l7y545k09ml8", tableName: "receivable") {
			column(name: "opportunity_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-97") {
		createIndex(indexName: "FK_jmkbqpv2c7c58rwu2vhdsvs73", tableName: "receivable") {
			column(name: "receipt_method_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-98") {
		createIndex(indexName: "FK_klorjj08otefcia87kykot5a6", tableName: "receivable") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-99") {
		createIndex(indexName: "FK_syc33n9nbud5jeqni6oqwqacs", tableName: "receivable") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-100") {
		createIndex(indexName: "authority_uniq_1420371564797", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-101") {
		createIndex(indexName: "FK_6ev7f9kjswresw53hnvsou72u", tableName: "service_request") {
			column(name: "status_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-102") {
		createIndex(indexName: "FK_jotbiar2pijfs666wia58fis3", tableName: "service_request") {
			column(name: "create_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-103") {
		createIndex(indexName: "FK_manafca6lmhj34a9emfiwxnmf", tableName: "service_request") {
			column(name: "customer_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-104") {
		createIndex(indexName: "FK_qwsemubt3tjjtpmbwxdy0lh4n", tableName: "service_request") {
			column(name: "last_update_user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-105") {
		createIndex(indexName: "FK_syjhfeba1fupvgb3gvh0bs01r", tableName: "service_request") {
			column(name: "classification_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-106") {
		createIndex(indexName: "FK_skugu4aa786hx4o05wn6cs7q0", tableName: "user") {
			column(name: "person_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-107") {
		createIndex(indexName: "username_uniq_1420371564805", tableName: "user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-108") {
		createIndex(indexName: "FK_apcc8lxk2xnug8377fatvbn04", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-109") {
		createIndex(indexName: "FK_it77eq964jhfqtu54081ebtio", tableName: "user_role") {
			column(name: "role_id")
		}
	}

	changeSet(author: "peng (generated)", id: "1420371564922-18") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "activity", constraintName: "FK_yolprg6gwxcp1b783v8q3w1h", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-19") {
		addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "activity", constraintName: "FK_ete5tcw8rix1yel1bqabo6huf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "customer", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-20") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "activity", constraintName: "FK_ix5u1avo5j6kbtha9oahn44ob", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-21") {
		addForeignKeyConstraint(baseColumnNames: "type_id", baseTableName: "activity", constraintName: "FK_pqxm9f3ypyey3wrq7n44e2ya8", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-22") {
		addForeignKeyConstraint(baseColumnNames: "province_id", baseTableName: "city", constraintName: "FK_d6wmr68dljice4y25ykax6rfs", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "province", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-23") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "contact", constraintName: "FK_3hlsf5vnymigpcq5hsdy8cveg", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-24") {
		addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "contact", constraintName: "FK_3tg5xm2jws24fhptnehre5gtl", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "customer", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-25") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "contact", constraintName: "FK_fgqygeg0k5jr8sldq2wf0p7y9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-26") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "contact", constraintName: "FK_fta0tx6x9r96nrmq231x9q4pu", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-27") {
		addForeignKeyConstraint(baseColumnNames: "category_id", baseTableName: "customer", constraintName: "FK_6m86ncy1c8dbskwgx3w3tiqsw", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-28") {
		addForeignKeyConstraint(baseColumnNames: "city_id", baseTableName: "customer", constraintName: "FK_jlc87hfhrhqpq4pc1my9447wf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "city", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-29") {
		addForeignKeyConstraint(baseColumnNames: "classification_id", baseTableName: "customer", constraintName: "FK_r73wg8dlc23h1eigx0d3gd08f", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-30") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "customer", constraintName: "FK_uknof74ai0rlyxyx03rxn7gl", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-31") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "customer", constraintName: "FK_qq0q6f6yd4vresx27nuf9frsa", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-32") {
		addForeignKeyConstraint(baseColumnNames: "situation_id", baseTableName: "customer", constraintName: "FK_aagw3i5c7f21bo427ehqtexnf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-33") {
		addForeignKeyConstraint(baseColumnNames: "source_id", baseTableName: "customer", constraintName: "FK_gvjkct7rr6nk8esinc7m5dfpf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-34") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "customer", constraintName: "FK_mtcogn8yyp15euyrhtyxed2md", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-35") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "invoice", constraintName: "FK_g1ef4k48xrwrxijf66wx1bf8p", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-36") {
		addForeignKeyConstraint(baseColumnNames: "invoice_type_id", baseTableName: "invoice", constraintName: "FK_kk1s6lwwfkbdqosp3re1e8dhg", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-37") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "invoice", constraintName: "FK_ctrr95ih7ewuw7s6phoas4dg7", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-38") {
		addForeignKeyConstraint(baseColumnNames: "opportunity_id", baseTableName: "invoice", constraintName: "FK_r533u8nrfgcyp0b3qhrqtch6t", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "opportunity", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-39") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "opportunity", constraintName: "FK_7s9o0jnjs4aus4ilrix32wg8d", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-40") {
		addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "opportunity", constraintName: "FK_qt22sgkju5bgw9pcqm88h0um", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "customer", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-41") {
		addForeignKeyConstraint(baseColumnNames: "imp_status_id", baseTableName: "opportunity", constraintName: "FK_1nbi5i61r9iowowh6noiejxxg", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-42") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "opportunity", constraintName: "FK_840nhbtspjclr81hpuqnvpbik", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-43") {
		addForeignKeyConstraint(baseColumnNames: "product_id", baseTableName: "opportunity", constraintName: "FK_7bbbnd15fe55xfr0rnqplcxyv", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-44") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "opportunity", constraintName: "FK_s0scp1n9aji0tw9c1co9wa8ha", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-45") {
		addForeignKeyConstraint(baseColumnNames: "jobposition_id", baseTableName: "person", constraintName: "FK_7n6h6bky4qp49e13hygbnfmx4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-46") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "person", constraintName: "FK_6jig8jkahfsdt0y0kbep19mti", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-47") {
		addForeignKeyConstraint(baseColumnNames: "supervisor_id", baseTableName: "person", constraintName: "FK_f5hhe53ncti5mbcgvr8eq73th", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-48") {
		addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "person_customer", constraintName: "FK_9opnsgxynmhxp80ctniladvar", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "customer", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-49") {
		addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "person_customer", constraintName: "FK_e2qijpbj7q0o9s5nm1hipxa5n", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-50") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "receivable", constraintName: "FK_klorjj08otefcia87kykot5a6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-51") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "receivable", constraintName: "FK_syc33n9nbud5jeqni6oqwqacs", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-52") {
		addForeignKeyConstraint(baseColumnNames: "opportunity_id", baseTableName: "receivable", constraintName: "FK_896bua4het7i6l7y545k09ml8", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "opportunity", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-53") {
		addForeignKeyConstraint(baseColumnNames: "receipt_method_id", baseTableName: "receivable", constraintName: "FK_jmkbqpv2c7c58rwu2vhdsvs73", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-54") {
		addForeignKeyConstraint(baseColumnNames: "classification_id", baseTableName: "service_request", constraintName: "FK_syjhfeba1fupvgb3gvh0bs01r", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-55") {
		addForeignKeyConstraint(baseColumnNames: "create_user_id", baseTableName: "service_request", constraintName: "FK_jotbiar2pijfs666wia58fis3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-56") {
		addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "service_request", constraintName: "FK_manafca6lmhj34a9emfiwxnmf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "customer", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-57") {
		addForeignKeyConstraint(baseColumnNames: "last_update_user_id", baseTableName: "service_request", constraintName: "FK_qwsemubt3tjjtpmbwxdy0lh4n", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-58") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "service_request", constraintName: "FK_6ev7f9kjswresw53hnvsou72u", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "value_set", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-59") {
		addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "user", constraintName: "FK_skugu4aa786hx4o05wn6cs7q0", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-60") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK_it77eq964jhfqtu54081ebtio", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "peng (generated)", id: "1420371564922-61") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK_apcc8lxk2xnug8377fatvbn04", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
