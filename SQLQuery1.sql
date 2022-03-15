--create DB
create database tire
--Delete DB
drop database tire

--select & where & order by & Group by & Delete & Update & alter & add & function
select * from product
select sum(price) from product
select size,sum(price) from product Group by size
select product,avg(cost) from product Group by product
select * from product where price > 600 
select * from product where price > 550 and product='atlas'
select count(*) from product
select * from product order by price asc
select count(IDproduct),size from product Group by size
select size,price from product where size like '175%'
update product set product = 'F.s' where product = 'FS'
delete from product where product = 'BR'
insert into product values(11,'BR','205/55/16',1400,1460,2,3)
alter table product drop column size 
alter table product add profit int 

-- create table
create table empolye (ID_empolyee int primary key not null ,
name_empolyee nvarchar(10) not null unique ,
salary int not null )

--select & function & Top & DISTINCT
select sqrt(90)
select len(product) from product
select upper(product) from product
select lower(product) from product
select left(product,2) from product
select right(product,3),size from product
select replace(product,'G','X') from product

select 5 + 3
select top 3 * from product
select top 75 percent price from product
select top 2 price from product
select DISTINCT size from product

--join
select product.product,product.size,country.country,city.city ,emoplyee.empolyee
from product join country 
on product.IDcountry = country.IDcountry
join city on city.IDcountry = city.IDcity 
join emoplyee on product.IDempolyee = emoplyee.IDempolyee

--create valiable & if 
declare @x int
declare @y int 
declare @c int
set @y = 10
set @x = 5
set @c = @x*@y
print @c
if @c > 50 
print('greater than 50')
else 
print('less than 50')

-- view 
select count(size),sum(cost),sum(price),size from [dbo].[View_7] Group by size 
select * from [dbo].[View_7] where empolyee = 'mohamed'
select product,price from [dbo].[View_7]


-- procedure & variable & if
CREATE PROCEDURE ifproduct
	@product nvarchar(10)
AS
BEGIN
	declare @x int 
	select @x=sum(price) from product where product=@product
	if @x > 3000
	print('greater than 30000')
	else
	print('less than 30000')
END
exec ifproduct 'Tringle'

------------------------------------------------
create procedure collect
	@product nvarchar(10) 
AS
begin
	select sum(price) from product where product=@product 
end
exec collect 'BR'
--
create procedure delet
	@product nvarchar(10)
AS
begin
	delete from product where product=@product
end
exec delet 'GT'

-------------------------------------------------------
alter PROCEDURE profit
	@IDproduct int
AS
BEGIN
	declare @c int 
	declare @v int 

	select size, @c=sum(price),@v=sum(cost) from product where IDproduct=@IDproduct 
	print @c - @v 
END

exec profit 1

-----------------------------------------------------
alter procedure profitt
AS
begin
	declare @x int 
	declare @y int
	select @x=sum(price),@y=sum(cost) from product
	print @x - @y

end
exec profitt

------------------------------
create procedure Delet_loop
AS
begin
	declare @x int 
	set @x = 1

	while @x < 10
	begin
	delete from product where @x=IDproduct
	set @x= @x+1
	end
end

exec Delet_loop 

--------------------------------------------
