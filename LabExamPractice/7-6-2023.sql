--7-6-2023
CREATE TABLE employee
(
    employee_id INT,
    first_name VARCHAR(20),
    last_name  VARCHAR(25) CONSTRAINT emp_last_name_nn NOT NULL,
    email VARCHAR(25) CONSTRAINT emp_email_nn NOT NULL,
    phone_number VARCHAR(25),
    hire_date DATE CONSTRAINT emp_hire_date_nn NOT NULL,
    job_id VARCHAR(10) CONSTRAINT emp_job_nn NOT NULL,
    salary DECIMAL(8,2),
    commission_pet DECIMAL(2,2),
    manager_id INT,
    department_id INT, 
    CONSTRAINT Temp_salary_min CHECK (salary>0),
    CONSTRAINT Temp_email_uk UNIQUE(email),
    CONSTRAINT Temp_dept_fk FOREIGN KEY (department_id) REFERENCES departments,
    CONSTRAINT Temp_job_fk FOREIGN KEY (job_id) REFERENCES jobs,
    CONSTRAINT Temp_manager_fk FOREIGN KEY (manager_id) REFERENCES employees   
);

CREATE TABLE job_history
(
    employee_id INT CONSTRAINT jhist_employee_nn NOT NULL,
    start_date DATE CONSTRAINT jhist_start_date_nn NOT NULL,
    end_date DATE CONSTRAINT jhist_end_date_nn NOT NULL,
    job_id VARCHAR(10) CONSTRAINT jhist_job_nn NOT NULL,
    department_id CONSTRAINT jhist_date_interval CHECK (end_date>start_date) ADD CONSTRAINT jhist_emp_id_st_date_pk PRIMARY KEY (employee_id,start_date),
    CONSTRAINT jhist_job_fk FOREIGN KEY (job_id) REFERENCES jobs,
    CONSTRAINT jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES employees,
    CONSTRAINT jhist_dept_fk FOREIGN KEY (department_id) REFERENCES departments,
);