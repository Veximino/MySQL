create database pharmacy;

use pharmacy;

#1
ALTER TABLE `pharmacy`.`dim_drug_form` 
CHANGE COLUMN `drug_form_code` `drug_form_code` VARCHAR(20) NOT NULL ,
ADD PRIMARY KEY (`drug_form_code`),
ADD UNIQUE INDEX `drug_form_code_UNIQUE` (`drug_form_code` ASC) VISIBLE;

ALTER TABLE `pharmacy`.`dim_drug_ndc` 
CHANGE COLUMN `drug_ndc` `drug_ndc` INT NOT NULL ,
ADD UNIQUE INDEX `drug_ndc_UNIQUE` (`drug_ndc` ASC) VISIBLE,
ADD PRIMARY KEY (`drug_ndc`);

ALTER TABLE `pharmacy`.`dim_generic_drug` 
CHANGE COLUMN `drug_brand_generic_code` `drug_brand_generic_code` INT NOT NULL ,
ADD PRIMARY KEY (`drug_brand_generic_code`),
ADD UNIQUE INDEX `drug_brand_generic_code_UNIQUE` (`drug_brand_generic_code` ASC) VISIBLE;


ALTER TABLE `pharmacy`.`dim_member` 
CHANGE COLUMN `member_id` `member_id` VARCHAR(50) NOT NULL ,
ADD PRIMARY KEY (`member_id`),
ADD UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE;

ALTER TABLE `pharmacy`.`fact_drugs` 
CHANGE COLUMN `P_ID` `P_ID` INT NOT NULL ,
ADD PRIMARY KEY (`P_ID`),
ADD UNIQUE INDEX `P_ID_UNIQUE` (`P_ID` ASC) VISIBLE;

ALTER TABLE `pharmacy`.`fact_drugs` 
CHANGE COLUMN `P_ID` `P_ID` INT NOT NULL ,
ADD PRIMARY KEY (`P_ID`),
ADD UNIQUE INDEX `P_ID_UNIQUE` (`P_ID` ASC) VISIBLE;

ALTER TABLE `pharmacy`.`dim_drug_ndc` 
CHANGE COLUMN `drug_ndc` `drug_ndc` VARCHAR(20) NOT NULL ;

#Foreign keys
alter table fact_drugs
add foreign key fk_drug_form_code(drug_form_code)
references dim_drug_form(drug_form_code)
ON DELETE set null
ON UPDATE set null;

alter table fact_drugs
add foreign key fk_drug_ndc(drug_ndc)
references dim_drug_ndc(drug_ndc)
ON DELETE set null
ON UPDATE set null;

alter table fact_drugs
add foreign key fk_drug_brand_generic_code(drug_brand_generic_code)
references dim_generic_drug(drug_brand_generic_code)
ON DELETE set null
ON UPDATE set null;

alter table fact_drugs
add foreign key fk_member_id(member_id)
references dim_member(member_id)
ON DELETE set null
ON UPDATE set null;

#4

SELECT d.drug_name AS drug_name,COUNT(drug_form_code) AS NumberofPrescription
FROM fact_drugs f
JOIN dim_drug_ndc d
ON f.drug_ndc = d.drug_ndc
GROUP BY d.drug_name;

SELECT  member_id, member_first_name, member_last_name, drug_name ,fill_date , InsurancePaid 
FROM (SELECT f.member_id ,member_first_name,member_last_name,d.drug_name, fill_date, InsurancePaid,
ROW_NUMBER() OVER (PARTITION BY f.member_id ORDER BY fill_date DESC) AS rn
FROM fact_drugs f
JOIN dim_member m
ON f.member_id = m.member_id
JOIN dim_drug_ndc d
ON f.drug_ndc = d.drug_ndc ) AS dt
WHERE rn = 1;



