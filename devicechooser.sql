Create database SmartPhones;
Use SmartPhones;
create table sim (
simtype char(15),
model varchar(15)
);
create table device (
brand varchar(15) not null,
model varchar(15) primary key,
resolution varchar(5),
score int(10),
cpumodel varchar(9),
ramsize int(1),
romsize int(1),
maxstor int(3),
osversion varchar(10),
camres varchar(5)
);
Create table cpus (
model VARCHAR(9) PRIMARY KEY,
cores INT(2),
frequence FLOAT,
architecture INT(2)
);
Create table RAM (
size int(1) not null primary key
);
Create table ROM (
size int(1) not null primary key
);
Create table maxstor (
size int(3) primary key
);
create table camera (
resolution varchar(5) primary key,
side set('front','back') not null
);
create table display (
resolution varchar(5) primary key,
size float
);
create table os (
osname varchar(10),
osversion varchar(10) primary key
);
alter table sim add constraint fk_sim_device foreign key (model) references device(model);
alter table device add constraint fk_cpu_device foreign key(cpumodel) references cpus(model);
alter table device add constraint fk_ram_device foreign key (ramsize) references RAM(size);
alter table device add constraint fk_rom_device foreign key (romsize) references ROM(size);
alter table device add constraint fk_maxstor_device foreign key (maxstor) references maxstor(size);
alter table device add constraint fk_cam_device foreign key (camres) references camera(resolution);
alter table device add constraint fk_display_device foreign key (resolution) references display(resolution);
alter table device add constraint fk_os_device foreign key (osversion) references os(osversion);