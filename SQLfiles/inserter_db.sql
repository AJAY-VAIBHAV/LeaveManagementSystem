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
        'S Bharath',
        101,
        'vbharath472@gmail.com',
        10,
        10,
        9,
        1,
        96.66,
        'bharath1302'
    );
insert into
    EMPLOYEE
values(
        1002,
        'Ajay Krisshan N K',
        102,
        'nkajay99@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'ajay3110'
    );
insert into
    EMPLOYEE
values(
        1003,
        'Sreeramji K S',
        102,
        'timberlogzap@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'sreeramji0411'
    );
insert into
    EMPLOYEE
values(
        1004,
        'Jayanth Srihaas K',
        102,
        'jamji1729@gmail.com',
        15,
        10,
        10,
        0,
        100.00,
        'jayanth2305'
    );
insert into
    EMPLOYEE
values(
        1005,
        'Sri Sharadha R S',
        103,
        'srisharadhars@gmail.com',
        20,
        20,
        9,
        1,
        98.00,
        'sharadha0910'
    );
insert into
    EMP_PN
values(1001, 9790249556);
insert into
    EMP_PN
values(1002, 8754453481);
insert into
    EMP_PN
values(1003, 9677069065);
insert into
    EMP_PN
values(1004, 9505920856);
insert into
    EMP_PN
values(1005, 9789571591);
insert into LEAVE_LOG
values
(10001,'16-10-2019','26-10-2019','Fever','SL','Pending','05-10-2019',NULL);
insert into EMP_LEAVE
values
(1001,10001);
insert into LEAVE_LOG
values
(10002,'17-10-2019','27-10-2019','Family tour','CL','Pending','05-10-2019',NULL);
insert into EMP_LEAVE
values
(1002,10002);
insert into LEAVE_LOG
values
(10003,'16-10-2019','22-10-2019','Attending a workshop','PL','Pending','05-10-2019',NULL);
insert into EMP_LEAVE
values
(1003,10003);
insert into LEAVE_LOG
values
(10004,'18-10-2019','19-10-2019','Medical Emergency','SL','Pending','05-10-2019',NULL);
insert into EMP_LEAVE
values
(1003,10004);
insert into LEAVE_LOG
values
(10005,'18-10-2019','20-10-2019','Childs School admission','CL','Pending','05-10-2019',NULL);
insert into EMP_LEAVE
values
(1004,10005);