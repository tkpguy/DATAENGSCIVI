create table modeling.ivl_dim_machine_tbl(
    "country_cd" char(3) not null,
    "plant_cd" varchar(250) not null,
    "mold_cd" varchar(250) not null,
    "mold_wt_grm" decimal(15,2) not null,
    "mold_cavities" int not null,
    "mold_cycle_time" decimal(15,2) not null,
    "mold_name" as concat(mold_cd, '/', mold_wt_grm, '/', mold_cavities,'/' ,mold_cycle_time) PERSISTED,
    "mmold_descr" as concat(country_cd,'/' ,plant_cd,'/', mold_cd, '/', mold_wt_grm,'/', mold_cavities, '/', mold_cycle_time) PERSISTED,
    "mold_sku" as concat(mold_cd, '/', mold_wt_grm, '/', mold_cavities) PERSISTED,
    
) ;