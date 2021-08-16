create database A3;

use a3;
select * from bed_fact;
select * from bed_type;
select * from business;

#4a1

select business_name as hospital_name, sum(license_beds) as total_license_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
order by total_license_beds desc
limit 10;

#4a2

select business_name as hospital_name, sum(census_beds) as total_census_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
order by total_census_beds desc
limit 10;

#4a3

select business_name as hospital_name, sum(staffed_beds) as total_staffed_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
order by total_staffed_beds desc
limit 10;

#5a1

select business_name as hospital_name, sum(license_beds) as total_license_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
having count(hospital_name) > 1 
order by total_license_beds desc
limit 10;

#5a2

select business_name as hospital_name, sum(census_beds) as total_census_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
having count(hospital_name) > 1 
order by total_census_beds desc
limit 10;

#5a3

select business_name as hospital_name, sum(staffed_beds) as total_staffed_beds
from bed_fact bf 
inner join business b on bf.ims_org_id = b.ims_org_id
where bed_id = 4 or bed_id = 15
group by hospital_name
having count(hospital_name) > 1 
order by total_staffed_beds desc
limit 10;
