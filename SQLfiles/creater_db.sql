create table MANAGER(
    man_id numeric(10),
    man_password varchar(30) not null,
    name varchar(30)not null,
    primary key (man_id)
);
create table DEPARTMENT(
    dept_id numeric(10),
    dept_name varchar(30)not null,unique(dept_name),
    man_id numeric(10) not null,
    allowed_cl numeric(10) not null,
    allowed_pl numeric(10) not null,
    allowed_sl numeric(10) not null,
    total_work_days numeric(10) not null,
    primary key (dept_id),
    foreign key (man_id) references MANAGER
);
create table EMPLOYEE(
    emp_id numeric(10),
    name varchar(30) not null,
    dept_id numeric(10) not null,
    email_id varchar(30) not null,unique (email_id),
    rem_cl numeric(10) not null,
    rem_pl numeric(10) not null,
    rem_sl numeric(10) not null,
    leave_cnt numeric(10) not null,
    att_perc numeric(10, 2) not null,
    password varchar(30) not null,
    primary key(emp_id),
    foreign key(dept_id) references DEPARTMENT
);
create table EMP_PN(
    emp_id numeric(10) not null,
    ph_no numeric(13),
    primary key( ph_no),
    foreign key(emp_id) references EMPLOYEE
);
create table LEAVE_LOG(
    leave_id numeric(10),
    start_date date not null,
    end_date date not null,
    reason varchar(200) not null,
    type varchar(30)not null,
    status varchar(30) not null,
    apply_date date not null,
    approved_date date ,
    primary key (leave_id)
);
create table EMP_LEAVE(
    emp_id numeric(10) not null,
    leave_id numeric(10),
    primary key(leave_id),
    foreign key(emp_id) references EMPLOYEE,
    foreign key(leave_id) references LEAVE_LOG
);