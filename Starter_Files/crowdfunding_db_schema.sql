--Create contacts table.  
--contact_id is Primary Key
DROP TABLE IF EXISTS contacts CASCADE;

CREATE TABLE contacts (
    contact_id int   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    email varchar(255)   NOT NULL,
    CONSTRAINT pk_contacts PRIMARY KEY(contact_id));

--Create category table.  
--category_id is Primary Key
DROP TABLE IF EXISTS category CASCADE;

CREATE TABLE category (
    category_id varchar(5)   NOT NULL,
    category varchar(255)   NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY(category_id));


--Create subcategory table.  
--subcategory_id is Primary Key
DROP TABLE IF EXISTS subcategory CASCADE;

CREATE TABLE subcategory (
    subcategory_id varchar(8)   NOT NULL,
    subcategory varchar(255)   NOT NULL,
    CONSTRAINT pk_subcategory PRIMARY KEY(subcategory_id));


--Create campaign table. 
--cf_id is Primary Key
--Foreign Key contact_id references contact table
--Foreign Key category_id references category table
--Foreign Key subcategory_id references subcategory table
DROP TABLE IF EXISTS campaign CASCADE;

CREATE TABLE campaign (
    cf_id int   NOT NULL,
    contact_id int   NOT NULL,
    company_name varchar(255)   NOT NULL,
    description varchar(255)   NOT NULL,
    goal numeric   NOT NULL,
    pledged numeric   NOT NULL,
    outcome varchar(10)   NOT NULL,
    backers_count int   NOT NULL,
    country varchar(2)   NOT NULL,
    currency varchar(3)   NOT NULL,
    launch_date timestamp   NOT NULL,
    end_date timestamp   NOT NULL,
    staff_pick boolean   NOT NULL,
    spotlight boolean   NOT NULL,
    category_id varchar(5)   NOT NULL,
    subcategory_id varchar(8)   NOT NULL,
    CONSTRAINT pk_campaign PRIMARY KEY(cf_id),
	CONSTRAINT fk_contact_id
		FOREIGN	KEY(contact_id)
		REFERENCES contacts(contact_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_category_id
		FOREIGN KEY(category_id)
		REFERENCES category(category_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_subcategory_id
		FOREIGN KEY(subcategory_id)
		REFERENCES subcategory(subcategory_id)
		ON DELETE CASCADE);


--Verify data in contacts table
SELECT * FROM contacts;

--Verify data in category table
SELECT * FROM category;

--Verify data in subcategory table
SELECT * FROM subcategory;

--Verify data in campaign table
SELECT * FROM campaign;

