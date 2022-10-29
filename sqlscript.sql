REM   Script: Session 03
REM   ds

create table nationality 
( 
 nationality_id int generated always as identity not null 
, name varchar2(50) 
, constraint nationality_pk primary key 
 ( 
nationality_id 
 ) 
 enable 
);

create table type 
( 
 type_id int generated always as identity not null 
, name varchar2(50) 
, constraint type_pk primary key 
 ( 
type_id 
 ) 
 enable 
);

create table penalty_type 
( 
 penalty_type_id int generated always as identity not null 
, description varchar2(50) 
, max_penalty_time int 
, constraint penalty_type_pk primary key 
 ( 
penalty_type_id 
 ) 
 enable 
);

create table section_type 
( 
section_type_id int generated always as identity not null 
, name varchar2(50) 
, constraint section_type_pk primary key 
 ( 
section_type_id 
 ) 
 enable 
);

create table race 
( 
year int  
, constraint race_pk primary key 
 ( 
year 
 ) 
 enable 
);

create table vehicle 
( 
vehicle_id int generated always as identity not null 
, make varchar2(50) 
, model varchar2(50) 
, motor_displacement int 
, fuel int 
, constraint vehicle_pk primary key 
 ( 
vehicle_id 
 ) 
 enable 
);

create table person 
( 
person_id int generated always as identity not null 
, nationality_id int 
, name varchar2(50) 
, telephone varchar2(13) 
, email varchar2(30) 
, constraint person_pk primary key 
 ( 
person_id 
 ) 
 enable 
);

alter table person 
add constraint person_fk1 foreign key 
( 
 nationality_id 
) 
references nationality 
( 
 nationality_id 
) 
enable;

create table stage 
( 
stage_id int generated always as identity not null 
, race_id int 
, date_of date 
, start_locatoin varchar(50) 
, end_location varchar2(50) 
, stage_number int 
, constraint stage_pk primary key 
 ( 
stage_id 
 ) 
 enable 
);

alter table stage 
add constraint stage_fk1 foreign key 
( 
 race_id 
) 
references race 
( 
 year 
) 
enable;

create table truck 
( 
vehicle_id int 
, tare int 
, volume int 
, constraint truck_pk primary key 
 ( 
vehicle_id 
 ) 
 enable 
);

alter table truck 
add constraint truck_fk1 foreign key 
( 
 vehicle_id 
) 
references vehicle 
( 
 vehicle_id 
) 
enable;

create table car 
( 
vehicle_id int 
, num_of_cylinders int 
, constraint car_pk primary key 
 ( 
vehicle_id 
 ) 
 enable 
);

alter table car 
add constraint car_fk1 foreign key 
( 
 vehicle_id 
) 
references vehicle 
( 
 vehicle_id 
) 
enable;

create table motorcycle 
( 
vehicle_id int 
, constraint motorcycle_pk primary key 
 ( 
vehicle_id 
 ) 
 enable 
);

alter table motorcycle 
add constraint motorcycle_fk1 foreign key 
( 
 vehicle_id 
) 
references vehicle 
( 
 vehicle_id 
) 
enable;

create table section 
( 
section_id int generated always as identity not null 
, stage_id int 
, section_type_id int 
, length int 
, order_of varchar2(50) 
, start_location varchar2(50) 
, end_location varchar2(50) 
, constraint section_pk primary key 
 ( 
section_id 
 ) 
 enable 
);

alter table section 
add constraint section_fk1 foreign key 
( 
 stage_id 
) 
references stage 
( 
 stage_id 
) 
enable;

alter table section 
add constraint section_fk2 foreign key 
( 
 section_type_id 
) 
references section_type 
( 
 section_type_id 
) 
enable;

create table team
( 
identification_code varchar2(9)
, type_id int 
, nationality_id int 
, vehicle_id int 
, pilot_id int
, name varchar2(50) 
, constraint team_pk primary key 
 ( 
identification_code 
 ) 
 enable 
);

alter table team 
add constraint team_fk1 foreign key 
( 
 type_id 
) 
references type
( 
 type_id 
) 
enable;

alter table team 
add constraint team_fk2 foreign key 
( 
 nationality_id 
) 
references nationality 
( 
 nationality_id 
) 
enable;

alter table team 
add constraint team_fk3 foreign key 
( 
 vehicle_id 
) 
references vehicle 
( 
 vehicle_id 
) 
enable;

alter table team 
add constraint team_fk4 foreign key 
( 
 pilot_id 
) 
references person 
( 
 person_id 
) 
enable;

create table is_co_driver  
(  
person_id int  
, team_id varchar2(9)  
, primary key (person_id, team_id)  
);

alter table is_co_driver 
add constraint is_co_driver_fk2 foreign key 
( 
 team_id 
) 
references team 
( 
 identification_code 
) 
enable;

alter table is_co_driver 
add constraint is_co_driver_fk1 foreign key 
( 
 person_id 
) 
references person 
( 
 person_id 
) 
enable;

create table penalty 
( 
penalty_id int generated always as identity not null 
, penalty_type_id int 
, participates_id int 
, duration int 
, constraint penalty_pk primary key 
 ( 
penalty_id 
 ) 
 enable 
);

create table participates 
( 
participates_id int generated always as identity not null 
, team_id varchar2(9) 
, section_id int 
, time varchar2(15) 
, constraint participates_pk primary key 
 ( 
participates_id 
 ) 
 enable 
);

alter table participates  
add constraint participates_fk1 foreign key  
(  
 team_id  
)  
references team  
(  
 identification_code  
)  
enable;

alter table participates  
add constraint participates_fk2 foreign key  
(  
 section_id  
)  
references section  
(  
 section_id  
)  
enable;

alter table penalty  
add constraint penalty_fk1 foreign key  
(  
 penalty_type_id  
)  
references penalty_type  
(  
 penalty_type_id  
)  
enable;

alter table penalty  
add constraint penalty_fk2 foreign key  
(  
 participates_id  
)  
references participates 
(  
 participates_id  
)  
enable;

