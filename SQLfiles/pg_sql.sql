create table MANAGER(
    man_id numeric(10),
    man_password varchar(30),
    name varchar(30),
    primary key (man_id)
);
create table DEPARTMENT(
    dept_id numeric(10),
    dept_name varchar(30),
    man_id numeric(10),
    allowed_cl numeric(10),
    allowed_pl numeric(10),
    allowed_sl numeric(10),
    total_work_days numeric(10),
    primary key (dept_id),
    foreign key (man_id) references MANAGER
);
create table EMPLOYEE(
    emp_id numeric(10),
    name varchar(30),
    dept_id numeric(10),
    email_id varchar(30),
    rem_cl numeric(10),
    rem_pl numeric(10),
    rem_sl numeric(10),
    leave_cnt numeric(10),
    att_perc numeric(10, 2),
    password varchar(30),
    primary key(emp_id),
    foreign key(dept_id) references DEPARTMENT
);
create table EMP_PN(
    emp_id numeric(10),
    ph_no numeric(13),
    primary key(emp_id, ph_no),
    foreign key(emp_id) references EMPLOYEE
);
create table LEAVE_LOG(
    leave_id numeric(10),
    start_date date,
    end_date date,
    reason varchar(200),
    type varchar(30),
    status varchar(30),
    apply_date date,
    approved_date date,
    primary key (leave_id)
);
create table EMP_LEAVE(
    emp_id numeric(10),
    leave_id numeric(10),
    primary key(emp_id, leave_id),
    foreign key(emp_id) references EMPLOYEE,
    foreign key(leave_id) references LEAVE_LOG
);
insert into
    MANAGER
values(2001, 'suresh123', 'Suresh');
insert into
    MANAGER
values(2002, 'ramesh123', 'Ramesh');
insert into
    MANAGER
values(2003, 'jyothish123', 'Jyothish');
insert into
    DEPARTMENT
values(101, 'AI', 2003, 10, 10, 10, 230);
insert into
    DEPARTMENT
values(102, 'HR', 2002, 15, 10, 10, 210);
insert into
    DEPARTMENT
values(103, 'BUSINESS', 2001, 20, 20, 10, 200);
insert into
    EMPLOYEE
values(
        1001,
        'John Cena',
        101,
        'ucantseeme@gmail.com',
        10,
        10,
        9,
        1,
        96.66,
        'americaspride'
    );
insert into
    EMPLOYEE
values(
        1002,
        'Maari Muthu',
        102,
        'muthu@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'tamilanda'
    );
insert into
    EMPLOYEE
values(
        1003,
        'Karpagavinayagam',
        102,
        'karpvin@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'vinayaga123'
    );
insert into
    EMPLOYEE
values(
        1004,
        'Kannan',
        102,
        'kannan1975@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'kannan123'
    );
insert into
    EMPLOYEE
values(
        1005,
        'Mahadev',
        103,
        'mahadev@gmail.com',
        20,
        20,
        9,
        1,
        98.00,
        'bunking100'
    );
select
    *
from
    emp_leave;
insert into
    EMP_PN
values(1002, 9789571951);
insert into
    EMP_PN
values(1003, 9789575119);
insert into
    EMP_PN
values(1005, 9598771951);
insert into
    EMP_PN
values(1002, 9789175951);
insert into
    EMP_PN
values(1001, 9876543211);
insert into
    EMP_PN
values(1004, 9234567891);
insert into
    LEAVE_LOG
values(
        70001,
        '11-05-2019',
        '14-05-2019',
        'Medical Emergency',
        'SL',
        'Approved',
        '10-05-2019',
        '10-05-2019'
    );
insert into
    LEAVE_LOG
values(
        70002,
        '11-05-2019',
        '14-05-2019',
        'Out of station',
        'CL',
        'Not Approved',
        '10-05-2019',
        NULL
    );
insert into
    LEAVE_LOG
values(
        70003,
        '11-05-2019',
        '14-05-2019',
        'Touring',
        'PL',
        'Pending',
        '10-05-2019',
        NULL
    );
insert into
    LEAVE_LOG
values(
        70004,
        '17-05-2019',
        '20-05-2019',
        'Doctor Appointment',
        'SL',
        'Approved',
        '10-05-2019',
        '10-05-2019'
    );
insert into
    LEAVE_LOG
values(
        70005,
        '21-05-2019',
        '23-05-2019',
        'Out of station',
        'CL',
        'Not Approved',
        '10-05-2019',
        NULL
    );
insert into
    LEAVE_LOG
values(
        70006,
        '30-05-2019',
        '05-06-2019',
        'Maldives visit',
        'PL',
        'Pending',
        '31-05-2019',
        NULL
    );
insert into
    LEAVE_LOG
values(
        70007,
        '31-05-2019',
        '03-06-2019',
        'Europe tour',
        'PL',
        'Pending',
        '31-05-2019',
        NULL
    );
insert into
    EMP_LEAVE
values(1001, 70001);
insert into
    EMP_LEAVE
values(1001, 70002);
insert into
    EMP_LEAVE
values(1001, 70003);
insert into
    EMP_LEAVE
values(1001, 70007);
insert into
    EMP_LEAVE
values(1002, 70005);
insert into
    EMP_LEAVE
values(1003, 70006);
insert into
    EMP_LEAVE
values(1005, 70004);
drop table emp_pn;
drop table emp_leave;
drop table leave_log;
drop table employee;
drop table department;
drop table manager;