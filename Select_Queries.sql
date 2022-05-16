use inventorymanagementappication;

select * from inventory_customer_tbl order by id desc;
select * from item order by id desc;
select * from purchase order by id desc;
select * from sales order by id desc;
select * from users order by id desc;

delete  from inventory_customer_tbl where id in (1);

select * from item where id=5;