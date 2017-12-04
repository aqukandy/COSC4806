drop schema COSC4806;

drop schema if exists cosc4806;
create schema cosc4806;
use cosc4806;

drop table if exists tbl_province;
create table tbl_province(
    province_name varchar(150) primary key
)engine=InnoDB default charset=utf8;

drop table if exists tbl_city;
create table tbl_city(
	id int primary key auto_increment,
    `name` varchar(150) not null,
    province_name varchar(15) not null,
    constraint fk_province foreign key (province_name) 
		references tbl_province(province_name) 
		on delete cascade
		on update cascade
)engine=InnoDB default charset=utf8;

drop table if exists tbl_user;
create table tbl_user(
    username varchar(150) primary key,
    `password` varchar(150) not null,
    role varchar(150) not null,
    managedBy varchar(150)
)engine=InnoDB default charset=utf8;

drop table if exists tbl_client;
create table tbl_client(
    id int primary key auto_increment,
    `name` varchar(150) not null,
    dob date not null,
    email varchar(150) not null,
    phone varchar(150) not null,
    city int not null,
    createdBy varchar(150) not null,
    updatedBy varchar(150) not null,
    createdDate datetime not null,
    updatedDate datetime not null,
    note text,
    constraint fk_city foreign key (city) references tbl_city(id),
    constraint fk_createdBy foreign key (createdBy) references tbl_user(username),
    constraint fk_updatedBy foreign key (updatedBy) references tbl_user(username)
)engine=InnoDB default charset=utf8;

insert into tbl_user values('admin', 'admin', 'admin', '');
insert into tbl_user values('staff1', 'staff1', 'staff', 'manager1');
insert into tbl_user values('staff2', 'staff2', 'staff', 'manager2');
insert into tbl_user values('manager1', 'manager1', 'manager', '');
insert into tbl_user values('manager2', 'manager2', 'manager', '');


# Province and city
insert into tbl_province values ('Ontario');
insert into tbl_city values(null, 'Toronto', 'Ontario');
insert into tbl_city values(null, 'Belleville','Ontario');
insert into tbl_city values(null, 'Brant','Ontario');

insert into tbl_province values ('Alberta');
insert into tbl_city values(null, 'Airdrie', 'Alberta');
insert into tbl_city values(null, 'Brooks','Alberta');
insert into tbl_city values(null, 'Calgary','Alberta');

insert into tbl_province values ('Manitoba');
insert into tbl_city values(null, 'Brandon', 'Manitoba');
insert into tbl_city values(null, 'Dauphin','Manitoba');
insert into tbl_city values(null, 'Winkler','Manitoba');

# -------
select * from tbl_city where province_name = 'ontario';
select * from tbl_client;