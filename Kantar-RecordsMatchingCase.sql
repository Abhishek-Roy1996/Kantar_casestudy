Create database records_matching_case;

Use records_matching_case;

alter table data1
rename column `order id` to `orderid`;

alter table data2
rename column `order id` to `orderid`;

alter table data2
rename column `product id` to `productid`;

alter table data1
rename column `product id` to `productid`;

-- 1) How to identify the Records (Order ID + Product ID combination) 
-- present in data1 but missing in data2 (Specify the number of records missing in your answer)

select count(*) as NumberOfRecords
from data1 d1 left join data2 d2 
on d1.orderid=d2.orderid and d1.productid=d2.productid
where d2.orderid is null and d2.productid is null;

select d1.orderid,d1.productid
from data1 d1 left join data2 d2 
on d1.orderid=d2.orderid and d1.productid=d2.productid
where d2.orderid is null and d2.productid is null;

-- 2) How to identify the Records (Order ID + Product ID combination)
--  missing in data1 but present in data2 (Specify the number of records missing in your answer)

select d2.orderid,d2.productid
from data2 d2 left join data1 d1 
on d2.orderid=d1.orderid and d2.productid=d1.productid
where d1.orderid is null and d1.productid is null;

select d2.orderid,d2.productid
from data1 d1 right join data2 d2
on d1.orderid=d2.orderid and d1.productid=d2.productid
where d1.orderid is null and d1.productid is null;

select count(*)
from data1 d1 right join data2 d2
on d1.orderid=d2.orderid and d1.productid=d2.productid
where d1.orderid is null and d1.productid is null;

select count(*)
from data2 d2 left join data1 d1 
on d2.orderid=d1.orderid and d2.productid=d1.productid
where d1.orderid is null and d1.productid is null;

-- 3) Find the Sum of the total Qty of Records missing in data1 but present in data2

select sum(d2.qty) as TotalQtyOfRecords
from data2 d2 left join data1 d1
on d2.orderid=d1.orderid and d2.productid=d1.productid
where d1.orderid is null and d1.productid is null;

-- 4) Find the total number of unique records (Order ID + Product ID combination) 
-- present in the combined dataset of data1 and data2

select count(*)
from (
	select orderID, ProductID
	from data1 
	Union
	select orderID, ProductID
	from data2) as TempTable; 

select orderid, productid
from data1
union
select orderid,productid
from data2;


