-- شارز های واحد های بالای 100 متر

<?
SELECT U.id as unit_id , C.* FROM db_project.charges C
	join charge_ladger CL on C.id = CL.charge_id
    join units U on U.ladger_id = CL.ladger_id
    where area > 100;


-- شارژ های واحد 1
SELECT U.id as unit_id , C.* FROM db_project.charges C
	join charge_ladger CL on C.id = CL.charge_id
    join units U on U.ladger_id = CL.ladger_id
    where U.id = 1;
    
-- اعلانات واحد 1
select N.* from notifications N
	join notification_ladger NL on NL.notification_id = N.id
    join ladgers L on L.id = NL.ladger_id
    join units U on U.ladger_id = L.id
    where U.id = 1;
   
-- شارژ های آپارتمان 1
SELECT distinct C.* from charges C
	join charge_ladger CL on CL.charge_id = C.id
    join ladgers L on CL.ladger_id = L.id
	join units U on U.ladger_id = L.id
	where U.apartment_id = 1;
    
-- اعلانات آپارتمان 1
SELECT distinct N.* from notifications N
	join notification_ladger NL on N.id = NL.notification_id
    join ladgers L on L.id = NL.ladger_id
    join units U on U.ladger_id = L.id
    join apartments A on A.id = U.apartment_id
    where A.id = 1;
    
-- کل واحد های آپارتمان 1
SELECT U.* from units U
	join apartments A on A.id = U.apartment_id
    where apartment_id = 1;
    
-- مشخصات مدیر هر آپارتمان
select A.name as apartment_name , M.* from managers M
	join apartments A on A.manager_id = M.id;

-- مجموع شارژ های آپارتمان 1
select sum(C.cost) as Sum from charges C
	join charge_ladger CL on CL.charge_id = C.id
	join ladgers L on L.id = CL.ladger_id
    join units U on U.ladger_id = L.id
    join apartments A on U.apartment_id  = A.id
    where A.id = 1;
    
-- مجموع شارژهای واحد 1
select sum(C.cost) as Sum from charges C
	join charge_ladger CL on CL.charge_id = C.id
	join ladgers L on L.id = CL.ladger_id
    join units U on U.ladger_id = L.id
    where U.id = 1;
    
-- شارژهای مدیر 1

select C.* from charges C
	where manager_id = 1;
    
-- تعدلد واحد های آپارتمان 1

select A.name , count(U.id) from units U 
	join apartments A on U.apartment_id = A.id
    group by A.name;
    
-- مجموغ شارژهای هر واحد آپارتمان 1
select U.id as unit_id , sum(C.cost) as Sum from charges C
	join charge_ladger CL on CL.charge_id = C.id
	join ladgers L on L.id = CL.ladger_id
    join units U on U.ladger_id = L.id
    join apartments A on A.id = U.apartment_id
    where A.id = 1
    group by U.id;