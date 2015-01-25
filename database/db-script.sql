SELECT * FROM `minicrm-dev`.customer;

SELECT * FROM `minicrm-dev`.contact;

SELECT * FROM `minicrm-dev`.value_set;

select b.name province_name, c.name city_name, count(a.id) customer_num from customer a, province b, city c
where a.city_id = c.id
and c.province_id = b.id
group by a.city_id