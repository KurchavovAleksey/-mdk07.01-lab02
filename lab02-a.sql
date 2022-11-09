drop table if exists installs;
drop table if exists pcs;
drop table if exists rooms;
drop table if exists employees;
drop table if exists software;

create table software (
    id serial primary key,
    name text not null,
    version text,
    expires timestamp
);

create table rooms (
    id serial primary key,
    num integer not null
);

create table employees (
    id serial primary key,
    name text not null,
    surname text not null,
    middle_name text
);

create table pcs (
    id serial primary key,
    employee_id integer,
    room_id integer not null,
    note text,
    ip_addr inet not null,
    mac_addr macaddr not null,
    foreign key (employee_id) references employees(id),
    foreign key (room_id) references rooms(id)
);

create table installs (
    pc_id integer not null,
    soft_id integer not null,
    foreign key (pc_id) references pcs(id),
    foreign key (soft_id) references software(id)
);
