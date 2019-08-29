DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS company;

DROP SEQUENCE IF EXISTS employee_id_seq;
DROP SEQUENCE IF EXISTS department_id_seq;
DROP SEQUENCE IF EXISTS company_id_seq;

CREATE SEQUENCE employee_id_seq START WITH 100000;
CREATE SEQUENCE department_id_seq START WITH 100000;
CREATE SEQUENCE company_id_seq START WITH 100000;

CREATE TABLE company
(
    id BIGINT DEFAULT nextval('company_id_seq'),
    company_name VARCHAR(100) NOT NULL,

    CONSTRAINT company_pk PRIMARY KEY (id),
    CONSTRAINT company_name_index UNIQUE (company_name)
);

CREATE TABLE department
(
    id BIGINT DEFAULT nextval('department_id_seq'),
    dept_code VARCHAR(20) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    company_id BIGINT NOT NULL,

    CONSTRAINT dept_co_fk FOREIGN KEY (company_id) REFERENCES company(id),
    CONSTRAINT department_pk PRIMARY KEY (id),
    CONSTRAINT dept_code_co_index UNIQUE (dept_code, company_id),
    CONSTRAINT dept_name_co_index UNIQUE (dept_name, company_id)
);

CREATE TABLE employee
(
    id BIGINT DEFAULT nextval('employee_id_seq'),
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT FALSE,
    start_date DATE NOT NULL,
    title VARCHAR(40) NOT NULL,
    dept_id BIGINT NOT NULL,

    CONSTRAINT emp_dept_fk FOREIGN KEY (dept_id) REFERENCES department(id),
    CONSTRAINT employee_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS league;

DROP SEQUENCE IF EXISTS player_id_seq;
DROP SEQUENCE IF EXISTS team_id_seq;
DROP SEQUENCE IF EXISTS league_id_seq;

CREATE SEQUENCE player_id_seq START WITH 100000;
CREATE SEQUENCE team_id_seq START WITH 100000;
CREATE SEQUENCE league_id_seq START WITH 100000;

CREATE TABLE league
(
    id BIGINT DEFAULT nextval('league_id_seq'),
    league_name VARCHAR(100) NOT NULL,

    CONSTRAINT league_pk PRIMARY KEY (id),
    CONSTRAINT league_name_index UNIQUE (league_name)
);

CREATE TABLE team
(
    id BIGINT DEFAULT nextval('team_id_seq'),
    team_code VARCHAR(20) NOT NULL,
    team_name VARCHAR(30) NOT NULL,
    league_id BIGINT NOT NULL,

    CONSTRAINT team_co_fk FOREIGN KEY (league_id) REFERENCES league(id),
    CONSTRAINT team_pk PRIMARY KEY (id),
    CONSTRAINT team_code_co_index UNIQUE (team_code, league_id),
    CONSTRAINT team_name_co_index UNIQUE (team_name, league_id)
);

CREATE TABLE player
(
    id BIGINT DEFAULT nextval('player_id_seq'),
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(40) NOT NULL,
    team_id BIGINT NOT NULL,

    CONSTRAINT player_team_fk FOREIGN KEY (team_id) REFERENCES team(id),
    CONSTRAINT player_pk PRIMARY KEY (id)
);


insert into company (id,company_name) VALUES (1,'BPCS Services');
insert into company (id,company_name) VALUES (2,'Florida Road Biking');

insert into department (id,dept_code,dept_name,company_id) VALUES (1,'MIS','IT Services',1);
insert into department (id,dept_code,dept_name,company_id) VALUES (2,'ACCT','Accounting',1);
insert into department (id,dept_code,dept_name,company_id) VALUES (3,'HR','Human Resources',1);
insert into department (id,dept_code,dept_name,company_id) VALUES (4,'OPS','Operations',1);
insert into department (id,dept_code,dept_name,company_id) VALUES (5,'PROD','Product',1);

insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 1, 'Karen', 'Thomas', true, '2012-05-30', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 2, 'Tina', 'Henderson', true, '2005-02-08', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 3, 'Jeremy', 'Barris', true, '2013-08-12', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 4, 'Steven', 'Thomas', true, '2011-03-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 5, 'Liam', 'Richards', false, '1999-08-09', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 6, 'Liam', 'Smith', false, '2006-11-30', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 7, 'Rob', 'Gold', true, '2011-06-10', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 8, 'Tina', 'Silva', true, '2003-06-01', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 9, 'Chris', 'Pfeiffer', true, '2012-12-25', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 10, 'Tom', 'Broderick', true, '2006-07-12', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 11, 'Liam', 'Weir', true, '2008-02-01', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 12, 'Larry', 'Broderick', true, '2005-10-25', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 13, 'Adrianne', 'Grossman', true, '2015-10-05', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 14, 'Bill', 'Henderson', true, '2003-01-17', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 15, 'Jeremy', 'Grossman', true, '2014-08-06', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 16, 'Christine', 'Johnson', true, '2010-12-18', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 17, 'Brian', 'Alchin', true, '2009-10-09', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 18, 'Jeremy', 'Broderick', true, '2003-04-13', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 19, 'Tom', 'Smith', true, '2002-07-09', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 20, 'John', 'Silva', true, '2006-01-04', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 21, 'Jill', 'Smith', true, '2001-11-09', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 22, 'Chris', 'Broderick', true, '2008-03-16', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 23, 'Tom', 'Laware', true, '2010-09-20', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 24, 'Liam', 'Heller', true, '2001-04-02', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 25, 'Deanna', 'Naylor', true, '2014-05-09', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 26, 'Adrianne', 'Naylor', true, '2000-04-13', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 27, 'Mary', 'Henderson', true, '2000-12-17', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 28, 'Brian', 'Naylor', true, '2005-08-14', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 29, 'Tina', 'Alchin', true, '1998-04-06', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 30, 'Rob', 'Henderson', true, '1997-01-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 31, 'Lynn', 'McKenzie', true, '2009-05-09', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 32, 'Mary', 'Henderson', false, '2012-01-09', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 33, 'Karen', 'Silva', false, '2011-11-19', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 34, 'Lynn', 'Silva', false, '2009-07-31', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 35, 'Rob', 'Henderson', false, '1998-02-28', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 36, 'Chris', 'Pfeiffer', true, '2007-11-10', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 37, 'Rob', 'Smith', true, '2014-12-19', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 38, 'Adrianne', 'Silva', true, '1998-08-22', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 39, 'Adrianne', 'Laware', true, '2009-08-19', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 40, 'Christine', 'Smith', true, '1999-02-18', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 41, 'Christine', 'Henderson', false, '2014-08-28', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 42, 'John', 'Broderick', true, '2006-09-21', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 43, 'Tom', 'McKenzie', true, '2011-09-30', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 44, 'Christine', 'Pfeiffer', true, '2005-12-12', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 45, 'Mary', 'Henderson', true, '1997-11-10', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 46, 'Liam', 'Grossman', true, '2006-03-30', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 47, 'Tom', 'Barris', false, '2000-01-30', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 48, 'Christine', 'Grossman', false, '2005-05-14', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 49, 'Rob', 'Heller', true, '2013-09-24', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 50, 'Christine', 'Heller', false, '2013-08-03', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 51, 'John', 'Broderick', true, '2004-03-18', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 52, 'Tina', 'McKenzie', true, '2002-10-25', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 53, 'Larry', 'Johnson', false, '2008-05-28', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 54, 'Steven', 'Henderson', true, '2006-10-25', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 55, 'Christine', 'McKenzie', true, '2006-05-13', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 56, 'Mary', 'Kent', true, '2011-08-21', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 57, 'Bill', 'Broderick', true, '2011-04-04', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 58, 'Karen', 'Johnson', true, '2012-03-01', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 59, 'Ken', 'Naylor', true, '2003-02-20', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 60, 'Jill', 'Heller', false, '2006-05-24', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 61, 'Jill', 'McKenzie', true, '2007-03-16', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 62, 'Adrianne', 'Smith', false, '2010-09-18', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 63, 'Jack', 'Smith', true, '2010-08-16', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 64, 'Larry', 'Silva', true, '2013-01-06', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 65, 'Chris', 'Naylor', true, '2014-12-05', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 66, 'Chris', 'Barris', true, '2007-10-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 67, 'Karen', 'Alchin', false, '1999-03-16', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 68, 'Ken', 'McKenzie', true, '2015-12-24', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 69, 'Steven', 'Thomas', false, '1999-12-21', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 70, 'Brian', 'Barris', false, '2008-02-05', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 71, 'Karen', 'Johnson', true, '2003-10-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 72, 'Liam', 'Thomas', true, '2002-01-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 73, 'Karen', 'Weir', false, '2002-02-03', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 74, 'John', 'Weir', true, '2008-05-24', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 75, 'Deanna', 'Naylor', true, '2011-06-19', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 76, 'Mary', 'Barris', false, '2013-03-21', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 77, 'Lynn', 'Weir', false, '2002-05-20', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 78, 'Lynn', 'Henderson', true, '2000-07-16', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 79, 'Adrianne', 'Weir', true, '1998-06-22', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 80, 'Tom', 'Pfeiffer', true, '2005-12-25', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 81, 'Karen', 'Alchin', true, '2006-12-20', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 82, 'Mary', 'Thomas', false, '2001-01-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 83, 'Christine', 'Richards', false, '2001-05-23', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 84, 'Brian', 'Kent', true, '2015-02-02', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 85, 'Brian', 'Barris', true, '2005-05-03', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 86, 'Deanna', 'Smith', false, '2003-05-12', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 87, 'Bill', 'Thomas', false, '1999-09-25', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 88, 'Tina', 'Pfeiffer', true, '1997-03-30', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 89, 'Karen', 'Broderick', true, '1999-07-25', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 90, 'John', 'Gold', false, '2000-09-15', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 91, 'Adrianne', 'McKenzie', true, '1998-03-11', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 92, 'Tom', 'Weir', true, '2006-07-29', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 93, 'Tina', 'Kent', true, '2003-02-01', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 94, 'Bill', 'Gold', false, '2015-02-22', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 95, 'Mary', 'Silva', true, '2005-07-27', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 96, 'Lynn', 'Thomas', true, '2011-10-18', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 97, 'Ken', 'Richards', true, '2011-09-04', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 98, 'Ken', 'Weir', true, '2015-03-06', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 99, 'Tom', 'Richards', true, '2006-11-19', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 100, 'John', 'Weir', true, '2012-04-29', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 101, 'Rob', 'Laware', false, '2003-10-20', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 102, 'Ken', 'Silva', false, '2014-12-22', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 103, 'Ken', 'Silva', true, '2012-04-11', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 104, 'Ken', 'Broderick', true, '2010-10-29', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 105, 'Rob', 'Heller', true, '2007-08-05', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 106, 'Tom', 'Alchin', false, '2012-03-15', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 107, 'Deanna', 'Thomas', true, '2008-09-01', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 108, 'Adrianne', 'Kent', true, '1997-12-15', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 109, 'Jack', 'Kent', true, '2000-12-30', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 110, 'Brian', 'Henderson', false, '2002-11-22', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 111, 'Deanna', 'Naylor', true, '2014-05-16', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 112, 'John', 'Broderick', false, '2013-04-01', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 113, 'Chris', 'Naylor', true, '2004-11-28', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 114, 'Karen', 'Smith', false, '2000-12-05', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 115, 'Tina', 'Kent', true, '2010-01-09', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 116, 'Ken', 'Kent', true, '2014-05-30', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 117, 'Mary', 'Weir', true, '2001-05-10', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 118, 'Mary', 'Smith', true, '2007-01-12', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 119, 'Mary', 'Johnson', false, '2007-07-21', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 120, 'Larry', 'Johnson', false, '2012-07-13', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 121, 'Tom', 'Gold', true, '2009-12-24', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 122, 'John', 'Henderson', true, '1998-05-04', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 123, 'Karen', 'Smith', true, '1998-02-13', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 124, 'Tom', 'Weir', false, '2013-11-22', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 125, 'Lynn', 'McKenzie', true, '2007-06-17', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 126, 'Bill', 'Pfeiffer', false, '2007-12-20', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 127, 'Deanna', 'Kent', true, '2007-02-26', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 128, 'Lynn', 'Henderson', true, '2010-05-28', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 129, 'Bill', 'Smith', true, '1997-07-20', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 130, 'Jack', 'Johnson', true, '2001-02-26', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 131, 'Rob', 'Johnson', true, '2010-12-23', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 132, 'Steven', 'Heller', false, '2006-11-30', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 133, 'John', 'Alchin', true, '1999-12-01', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 134, 'Adrianne', 'Alchin', true, '2013-10-25', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 135, 'Mary', 'Gold', true, '2003-08-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 136, 'Lynn', 'Richards', true, '2003-11-02', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 137, 'Adrianne', 'Thomas', true, '2013-12-26', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 138, 'Brian', 'Johnson', true, '2001-09-14', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 139, 'Jill', 'Pfeiffer', false, '2013-11-23', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 140, 'John', 'Naylor', true, '2013-11-22', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 141, 'Adrianne', 'McKenzie', true, '2009-05-16', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 142, 'Chris', 'Laware', true, '1997-06-17', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 143, 'Brian', 'Broderick', false, '2003-08-01', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 144, 'Christine', 'Richards', true, '2012-11-21', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 145, 'Tom', 'Johnson', true, '2011-09-13', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 146, 'Liam', 'Gold', true, '2009-03-18', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 147, 'Liam', 'Smith', false, '2014-08-26', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 148, 'Christine', 'Gold', true, '2004-11-05', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 149, 'Tom', 'Heller', true, '2005-11-24', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 150, 'John', 'Kent', true, '2002-07-23', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 151, 'Ken', 'Johnson', true, '2008-09-23', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 152, 'Ken', 'Naylor', false, '2004-11-18', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 153, 'Brian', 'Weir', true, '2011-03-06', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 154, 'Larry', 'Heller', true, '1999-01-31', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 155, 'Deanna', 'Broderick', true, '2008-12-21', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 156, 'Tom', 'Silva', true, '2012-08-31', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 157, 'Christine', 'Naylor', false, '2014-05-04', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 158, 'Chris', 'Thomas', false, '1999-09-20', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 159, 'Jack', 'Richards', true, '2011-07-04', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 160, 'Christine', 'Broderick', true, '2008-05-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 161, 'Tom', 'Henderson', true, '2002-03-02', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 162, 'Christine', 'Broderick', true, '2014-08-18', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 163, 'Rob', 'Alchin', false, '2000-10-11', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 164, 'Ken', 'McKenzie', true, '2007-06-20', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 165, 'Brian', 'Smith', false, '2002-12-16', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 166, 'Christine', 'Henderson', false, '2010-05-26', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 167, 'Adrianne', 'Weir', true, '2012-08-06', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 168, 'Tina', 'Thomas', true, '2008-07-27', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 169, 'Steven', 'Grossman', false, '2010-07-07', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 170, 'Larry', 'Broderick', true, '2002-09-28', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 171, 'Mary', 'Henderson', true, '2001-09-10', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 172, 'Tom', 'Silva', true, '2006-07-18', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 173, 'Bill', 'Kent', false, '2008-01-30', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 174, 'Larry', 'Gold', false, '2003-12-27', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 175, 'Jill', 'Johnson', false, '2005-01-12', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 176, 'John', 'Richards', true, '2000-05-18', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 177, 'Tom', 'Johnson', false, '2003-02-24', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 178, 'Jeremy', 'Laware', true, '2009-01-16', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 179, 'Mary', 'McKenzie', true, '2006-04-24', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 180, 'Christine', 'Smith', true, '2008-05-15', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 181, 'Karen', 'McKenzie', true, '2006-01-16', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 182, 'Chris', 'Johnson', false, '2006-08-18', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 183, 'Bill', 'Richards', true, '2015-04-08', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 184, 'Jill', 'McKenzie', true, '2004-12-28', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 185, 'Jack', 'Alchin', true, '2004-09-10', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 186, 'Bill', 'Richards', true, '2013-12-20', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 187, 'Steven', 'Alchin', true, '2012-10-05', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 188, 'Jeremy', 'Weir', true, '2012-03-17', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 189, 'Rob', 'Silva', true, '2011-02-02', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 190, 'John', 'Pfeiffer', true, '2006-03-25', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 191, 'Jack', 'Barris', true, '2002-10-28', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 192, 'Chris', 'Henderson', true, '2003-03-16', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 193, 'Tom', 'Barris', false, '2012-03-27', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 194, 'Ken', 'Alchin', true, '2009-05-07', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 195, 'Lynn', 'McKenzie', true, '2008-01-11', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 196, 'Lynn', 'Grossman', true, '2008-10-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 197, 'Brian', 'Barris', true, '2010-08-27', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 198, 'Ken', 'Weir', false, '2014-03-03', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 199, 'Jeremy', 'Kent', true, '2014-12-07', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 200, 'Christine', 'McKenzie', false, '2006-01-15', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 201, 'Brian', 'Barris', true, '1998-09-28', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 202, 'Brian', 'Pfeiffer', true, '2012-11-17', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 203, 'Deanna', 'Smith', true, '2002-07-06', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 204, 'Ken', 'Johnson', true, '2001-08-16', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 205, 'Liam', 'Barris', true, '2010-07-09', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 206, 'Christine', 'Pfeiffer', true, '2013-03-30', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 207, 'Jeremy', 'Alchin', true, '1998-09-03', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 208, 'Mary', 'Thomas', true, '2013-04-14', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 209, 'Bill', 'Barris', true, '2009-08-08', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 210, 'Deanna', 'Weir', true, '2001-02-17', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 211, 'Bill', 'Heller', true, '2001-06-02', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 212, 'Karen', 'Thomas', false, '1999-03-30', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 213, 'Bill', 'Weir', false, '1998-05-24', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 214, 'Adrianne', 'Thomas', true, '2002-04-16', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 215, 'Brian', 'Alchin', true, '2007-03-05', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 216, 'Mary', 'Grossman', true, '1998-04-18', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 217, 'Ken', 'Silva', false, '2004-11-06', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 218, 'Jeremy', 'Pfeiffer', false, '2014-06-10', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 219, 'Adrianne', 'Naylor', true, '2007-05-15', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 220, 'Ken', 'Smith', true, '2006-03-30', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 221, 'John', 'Silva', true, '2003-05-10', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 222, 'Liam', 'Broderick', true, '2013-01-12', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 223, 'Lynn', 'Pfeiffer', true, '2009-04-19', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 224, 'Steven', 'Thomas', true, '1998-08-28', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 225, 'Jill', 'Smith', true, '2001-06-25', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 226, 'Tina', 'Richards', true, '2007-04-28', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 227, 'Adrianne', 'Gold', false, '2012-10-19', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 228, 'Adrianne', 'Heller', true, '2008-03-26', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 229, 'Tom', 'Laware', true, '2000-09-21', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 230, 'Chris', 'Barris', true, '2013-08-14', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 231, 'Liam', 'Silva', false, '2003-05-14', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 232, 'Jill', 'Broderick', true, '2009-03-09', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 233, 'Tina', 'Henderson', true, '2004-06-20', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 234, 'Jack', 'Alchin', true, '2005-10-13', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 235, 'Mary', 'Silva', true, '1998-08-17', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 236, 'Jill', 'Alchin', false, '2008-06-15', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 237, 'Jill', 'Barris', false, '1998-10-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 238, 'Jill', 'Heller', false, '1998-05-24', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 239, 'Chris', 'McKenzie', true, '2014-05-26', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 240, 'Deanna', 'Silva', true, '2001-09-23', 'Customer Service Rep', 4 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 241, 'Jill', 'Kent', true, '2013-11-16', 'Business Analyst', 5 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 242, 'Jill', 'Grossman', false, '1998-02-19', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 243, 'Jeremy', 'Gold', true, '2012-09-08', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 244, 'Tina', 'Grossman', true, '2013-06-11', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 245, 'Bill', 'Thomas', true, '2012-01-04', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 246, 'Bill', 'Weir', true, '2012-05-06', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 247, 'Jack', 'Pfeiffer', false, '2002-05-16', 'Benefits Coordinator', 3 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 248, 'Tom', 'Richards', true, '2007-05-07', 'Software Developer', 1 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 249, 'Tom', 'Kent', true, '2008-08-26', 'Accounts Receivable', 2 );
insert into employee (id,first_name,last_name,active,start_date,title,dept_id) values ( 250, 'Steven', 'Heller', true, '2014-09-28', 'Software Developer', 1 );

insert into league (id,league_name) VALUES (1,'Softball');
insert into league (id,league_name) VALUES (2,'Dodgeball');

insert into team (id,team_code,team_name,league_id) VALUES (1,'YKS', 'Yankees',1);
insert into team (id,team_code,team_name,league_id) VALUES (2,'DDG','Dodgers',1);
insert into team (id,team_code,team_name,league_id) VALUES (3,'MRL','Marlins',1);
insert into team (id,team_code,team_name,league_id) VALUES (4,'AVJ','Average Joes',2);
insert into team (id,team_code,team_name,league_id) VALUES (5,'GGPC','Globo Gym Purple Cobras',2);
insert into team (id,team_code,team_name,league_id) VALUES (6,'TBK','Team Blitzkrieg',2);

insert into player (id,full_name,position,team_id) values ( 1, 'Karen Thomas', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 2, 'Tina Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 3, 'Jeremy Barris', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 4, 'Steven Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 5, 'Liam Richards', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 6, 'Liam Smith', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 7, 'Rob Gold', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 8, 'Tina Silva', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 9, 'Chris Pfeiffer', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 10, 'Tom Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 11, 'Liam Weir', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 12, 'Larry Broderick', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 13, 'Adrianne Grossman', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 14, 'Bill Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 15, 'Jeremy Grossman', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 16, 'Christine Johnson', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 17, 'Brian Alchin', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 18, 'Jeremy Broderick', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 19, 'Tom Smith', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 20, 'John Silva', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 21, 'Jill Smith', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 22, 'Chris Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 23, 'Tom Laware', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 24, 'Liam Heller', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 25, 'Deanna Naylor', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 26, 'Adrianne Naylor', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 27, 'Mary Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 28, 'Brian Naylor', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 29, 'Tina Alchin', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 30, 'Rob Henderson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 31, 'Lynn McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 32, 'Mary Henderson', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 33, 'Karen Silva', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 34, 'Lynn Silva', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 35, 'Rob Henderson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 36, 'Chris Pfeiffer', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 37, 'Rob Smith', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 38, 'Adrianne Silva', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 39, 'Adrianne Laware', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 40, 'Christine Smith', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 41, 'Christine Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 42, 'John Broderick', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 43, 'Tom McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 44, 'Christine Pfeiffer', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 45, 'Mary Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 46, 'Liam Grossman', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 47, 'Tom Barris', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 48, 'Christine Grossman', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 49, 'Rob Heller', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 50, 'Christine Heller', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 51, 'John Broderick', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 52, 'Tina McKenzie', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 53, 'Larry Johnson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 54, 'Steven Henderson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 55, 'Christine McKenzie', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 56, 'Mary Kent', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 57, 'Bill Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 58, 'Karen Johnson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 59, 'Ken Naylor', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 60, 'Jill Heller', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 61, 'Jill McKenzie', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 62, 'Adrianne Smith', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 63, 'Jack Smith', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 64, 'Larry Silva', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 65, 'Chris Naylor', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 66, 'Chris Barris', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 67, 'Karen Alchin', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 68, 'Ken McKenzie', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 69, 'Steven Thomas', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 70, 'Brian Barris', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 71, 'Karen Johnson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 72, 'Liam Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 73, 'Karen Weir', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 74, 'John Weir', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 75, 'Deanna Naylor', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 76, 'Mary Barris', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 77, 'Lynn Weir', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 78, 'Lynn Henderson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 79, 'Adrianne Weir', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 80, 'Tom Pfeiffer', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 81, 'Karen Alchin', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 82, 'Mary Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 83, 'Christine Richards', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 84, 'Brian Kent', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 85, 'Brian Barris', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 86, 'Deanna Smith', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 87, 'Bill Thomas', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 88, 'Tina Pfeiffer', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 89, 'Karen Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 90, 'John Gold', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 91, 'Adrianne McKenzie', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 92, 'Tom Weir', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 93, 'Tina Kent', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 94, 'Bill Gold', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 95, 'Mary Silva', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 96, 'Lynn Thomas', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 97, 'Ken Richards', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 98, 'Ken Weir', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 99, 'Tom Richards', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 100, 'John Weir', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 101, 'Rob Laware', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 102, 'Ken Silva', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 103, 'Ken Silva', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 104, 'Ken Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 105, 'Rob Heller', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 106, 'Tom Alchin', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 107, 'Deanna Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 108, 'Adrianne Kent', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 109, 'Jack Kent', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 110, 'Brian Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 111, 'Deanna Naylor', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 112, 'John Broderick', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 113, 'Chris Naylor', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 114, 'Karen Smith', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 115, 'Tina Kent', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 116, 'Ken Kent', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 117, 'Mary Weir', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 118, 'Mary Smith', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 119, 'Mary Johnson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 120, 'Larry Johnson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 121, 'Tom Gold', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 122, 'John Henderson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 123, 'Karen Smith', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 124, 'Tom Weir', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 125, 'Lynn McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 126, 'Bill Pfeiffer', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 127, 'Deanna Kent', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 128, 'Lynn Henderson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 129, 'Bill Smith', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 130, 'Jack Johnson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 131, 'Rob Johnson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 132, 'Steven Heller', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 133, 'John Alchin', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 134, 'Adrianne Alchin', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 135, 'Mary Gold', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 136, 'Lynn Richards', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 137, 'Adrianne Thomas', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 138, 'Brian Johnson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 139, 'Jill Pfeiffer', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 140, 'John Naylor', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 141, 'Adrianne McKenzie', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 142, 'Chris Laware', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 143, 'Brian Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 144, 'Christine Richards', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 145, 'Tom Johnson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 146, 'Liam Gold', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 147, 'Liam Smith', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 148, 'Christine Gold', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 149, 'Tom Heller', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 150, 'John Kent', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 151, 'Ken Johnson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 152, 'Ken Naylor', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 153, 'Brian Weir', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 154, 'Larry Heller', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 155, 'Deanna Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 156, 'Tom Silva', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 157, 'Christine Naylor', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 158, 'Chris Thomas', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 159, 'Jack Richards', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 160, 'Christine Broderick', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 161, 'Tom Henderson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 162, 'Christine Broderick', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 163, 'Rob Alchin', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 164, 'Ken McKenzie', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 165, 'Brian Smith', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 166, 'Christine Henderson', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 167, 'Adrianne Weir', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 168, 'Tina Thomas', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 169, 'Steven Grossman', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 170, 'Larry Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 171, 'Mary Henderson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 172, 'Tom Silva', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 173, 'Bill Kent', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 174, 'Larry Gold', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 175, 'Jill Johnson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 176, 'John Richards', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 177, 'Tom Johnson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 178, 'Jeremy Laware', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 179, 'Mary McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 180, 'Christine Smith', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 181, 'Karen McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 182, 'Chris Johnson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 183, 'Bill Richards', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 184, 'Jill McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 185, 'Jack Alchin', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 186, 'Bill Richards', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 187, 'Steven Alchin', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 188, 'Jeremy Weir', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 189, 'Rob Silva', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 190, 'John Pfeiffer', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 191, 'Jack Barris', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 192, 'Chris Henderson', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 193, 'Tom Barris', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 194, 'Ken Alchin', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 195, 'Lynn McKenzie', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 196, 'Lynn Grossman', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 197, 'Brian Barris', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 198, 'Ken Weir', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 199, 'Jeremy Kent', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 200, 'Christine McKenzie', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 201, 'Brian Barris', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 202, 'Brian Pfeiffer', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 203, 'Deanna Smith', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 204, 'Ken Johnson', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 205, 'Liam Barris', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 206, 'Christine Pfeiffer', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 207, 'Jeremy Alchin', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 208, 'Mary Thomas', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 209, 'Bill Barris', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 210, 'Deanna Weir', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 211, 'Bill Heller', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 212, 'Karen Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 213, 'Bill Weir', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 214, 'Adrianne Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 215, 'Brian Alchin', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 216, 'Mary Grossman', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 217, 'Ken Silva', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 218, 'Jeremy Pfeiffer', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 219, 'Adrianne Naylor', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 220, 'Ken Smith', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 221, 'John Silva', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 222, 'Liam Broderick', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 223, 'Lynn Pfeiffer', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 224, 'Steven Thomas', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 225, 'Jill Smith', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 226, 'Tina Richards', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 227, 'Adrianne Gold', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 228, 'Adrianne Heller', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 229, 'Tom Laware', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 230, 'Chris Barris', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 231, 'Liam Silva', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 232, 'Jill Broderick', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 233, 'Tina Henderson', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 234, 'Jack Alchin', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 235, 'Mary Silva', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 236, 'Jill Alchin', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 237, 'Jill Barris', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 238, 'Jill Heller', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 239, 'Chris McKenzie', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 240, 'Deanna Silva', 'Back Field', 4 );
insert into player (id,full_name,position,team_id) values ( 241, 'Jill Kent', 'Front Field', 5 );
insert into player (id,full_name,position,team_id) values ( 242, 'Jill Grossman', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 243, 'Jeremy Gold', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 244, 'Tina Grossman', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 245, 'Bill Thomas', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 246, 'Bill Weir', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 247, 'Jack Pfeiffer', 'Catcher', 3 );
insert into player (id,full_name,position,team_id) values ( 248, 'Tom Richards', 'Outfield', 1 );
insert into player (id,full_name,position,team_id) values ( 249, 'Tom Kent', 'Pitcher', 2 );
insert into player (id,full_name,position,team_id) values ( 250, 'Steven Heller', 'Outfield', 1 );