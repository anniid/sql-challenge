-- SCHEMA: public

-- DROP SCHEMA public ;

CREATE SCHEMA public
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;
-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(25) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    title_id character varying(25) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT titles_pkey PRIMARY KEY (title_id)
)

TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;
-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    emp_title character varying(25) COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    sex character varying(5) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT "title key" FOREIGN KEY (emp_title)
        REFERENCES public.titles (title_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;
-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL DEFAULT nextval('dept_emp_emp_no_seq'::regclass),
    dept_no character varying(25) COLLATE pg_catalog."default" NOT NULL,
    dept_emp_key integer NOT NULL DEFAULT nextval('dept_emp_dept_emp_key_seq'::regclass),
    CONSTRAINT dept_emp_pkey PRIMARY KEY (dept_emp_key)
)

TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;
	
-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character varying(25) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    dept_mng_key integer NOT NULL DEFAULT nextval('dept_manager_dept_mng_key_seq'::regclass),
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_mng_key),
    CONSTRAINT "the department ID" FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT "the employee ID" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)

TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;
-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL DEFAULT nextval('salaries_emp_no_seq'::regclass),
    salary integer NOT NULL,
    emp_sal_key integer NOT NULL DEFAULT nextval('salaries_emp_sal_key_seq'::regclass),
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_sal_key),
    CONSTRAINT "employee number" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;

	
