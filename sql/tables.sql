create table modeling.ivl_ref_mold_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "mold_cd" varchar(250) not null,
    "mold_cd_othr" varchar(250),
    "mold_wt_grm" decimal(15,2) not null,
    "mold_cavities" int not null,
    "mold_cycle_time" decimal(15,2) not null,
    "mold_name" as concat(mold_cd, '/', mold_wt_grm, '/', mold_cavities,'/' ,mold_cycle_time) PERSISTED,
    "mmold_descr" as concat(country_cd,'/' ,plant_cd,'/', mold_cd, '/', mold_wt_grm,'/', mold_cavities, '/', mold_cycle_time) PERSISTED,
    "mold_sku" as concat(mold_cd, '/', mold_wt_grm, '/', mold_cavities) PERSISTED,
    "mold_installed_capacity_hr" as CEILING(mold_cavities*3600/mold_cycle_time) PERSISTED,
    "mold_installed_capacity_day" as CEILING(mold_cavities*3600*24/mold_cycle_time) PERSISTED,
    "mold_installed_capacity_mt_day" as ROUND(((mold_cavities*mold_wt_grm*36*24)/(mold_cycle_time*10000)),2) PERSISTED,
    "mold_status" char(1) not null,
    "mold_status_dt" date not null,
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (country_cd, plant_cd, mold_cd, mold_wt_grm)
) ;

create table modeling.ivl_ref_machine_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "machine_cd" varchar(250) not null,
    "machine_name" varchar(250) not null,
    "machine_name_othr" varchar(250),
    "machine_status" char(1) not null,
    "machine_status_dt" date not null,
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (country_cd, plant_cd, machine_cd)
);

create table modeling.ivl_ref_plant_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "plant_name" varchar(250),
    "plant_name_oth" varchar(250),
    "plant_status" as char(1) not null,
    "plant_adrs_1" varchar(250),
    "plant_adrs_2" varchar(250),
    "plant_adrs_landmark" varchar(300),
    "plant_adrs_area" varchar(250),
    "plant_adrs_city" varchar(250),
    "plant_adrs_state" varchar(250),
    "plant_adrs_country" varchar(250),
    "plant_adrs_postalcode" varchar(25),
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (country_cd, plant_cd)
);

create table modeling.ivl_ref_country_tbl(
    "country_cd" char(3) not null,
    "country_cd_2char" char(2),
    "country_name" varchar(250) not null,
    "country_isd_cd" varchar(10) not null,
    "sub_region" varchar(250),
    "region" varchar(250),
    "time_zone" varchar(250),
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (country_cd)
);

create table modeling.ivl_ref_status_tbl(
    "status_cd" char(1) not null,
    "status_desc" varcahr(250) not null,
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (status_cd)
);

create table modeling.ivl_ref_unit_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "unit_cd" varchar(250) not null,
    "unit_name" varchar(250) not null,
    PRIMARY KEY (country_cd, plant_cd, unit_cd)
);

create table modeling.ivl_ref_power_meter_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "power_meter_cd" varchar(250) not null,
    "power_meter_name" varchar(250),
    "last_upd_dttm" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_upd_user" as varchar(250) DEFAULT CURRENT_USER,
    PRIMARY KEY (country_cd, plant_cd, power_meter_cd)
);