/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2014/3/4 11:07:22                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_USER')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_TIME')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_TIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_AREA')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_AREA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_EDU')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_EDU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_TYPE')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_TYPE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_GOOD')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_GOOD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tbl_order') and o.name = 'FK_TBL_ORDE_REFERENCE_TBL_AGE')
alter table tbl_order
   drop constraint FK_TBL_ORDE_REFERENCE_TBL_AGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_age')
            and   type = 'U')
   drop table tbl_age
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_area')
            and   type = 'U')
   drop table tbl_area
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_edu')
            and   type = 'U')
   drop table tbl_edu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_goods')
            and   type = 'U')
   drop table tbl_goods
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_order')
            and   type = 'U')
   drop table tbl_order
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_time')
            and   type = 'U')
   drop table tbl_time
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_type')
            and   type = 'U')
   drop table tbl_type
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tbl_user')
            and   type = 'U')
   drop table tbl_user
go

/*==============================================================*/
/* Table: tbl_age                                               */
/*==============================================================*/
create table tbl_age (
   age_id               char(11)             not null,
   age_area             varchar(100)         null,
   constraint PK_TBL_AGE primary key (age_id)
)
go

/*==============================================================*/
/* Table: tbl_area                                              */
/*==============================================================*/
create table tbl_area (
   area_id              char(5)             not null,
   country              varchar(100)         null,
   province             varchar(100)         null,
   city                 varchar(100)         null,
   constraint PK_TBL_AREA primary key (area_id)
)
go

/*==============================================================*/
/* Table: tbl_edu                                               */
/*==============================================================*/
create table tbl_edu (
   edu_id               char(13)             not null,
   edu_class            varchar(100)         null,
   constraint PK_TBL_EDU primary key (edu_id)
)
go

/*==============================================================*/
/* Table: tbl_goods                                             */
/*==============================================================*/
create table tbl_goods (
   goods_id             char(10)             not null,
   g_name               character varying(30) null,
   g_price              character varying(10) null,
   type_pid             character varying(10) null,
   type_ppid            character varying(10) null,
   constraint PK_TBL_GOODS primary key (goods_id)
)
go

/*==============================================================*/
/* Table: tbl_order                                             */
/*==============================================================*/
create table tbl_order (
   user_id              char(10)             not null,
   goods_id             char(10)             not null,
   type_pid             char(10)             not null,
   edu_id               char(10)             not null,
   area_id              char(10)             not null,
   age_id               char(10)             not null,
   time_id              char(10)             not null,
   order_num            int                  null,
   order_money          numeric(10)          null,
   constraint PK_TBL_ORDER primary key (user_id, goods_id, type_pid, edu_id, age_id, area_id, time_id)
)
go

/*==============================================================*/
/* Table: tbl_time                                              */
/*==============================================================*/
create table tbl_time (
   time_id              char(10)             not null,
   year                 int                  null,
   quarter              int                  null,
   month                int                  null,
   day                  int                  null,
   constraint PK_TBL_TIME primary key (time_id)
)
go

/*==============================================================*/
/* Table: tbl_type                                              */
/*==============================================================*/
create table tbl_type (
   type_pid             char(10)             not null,
   type_ppid            char(10)             null,
   t_name               varchar(100)         null,
   constraint PK_TBL_TYPE primary key (type_pid)
)
go

/*==============================================================*/
/* Table: tbl_user                                              */
/*==============================================================*/
create table tbl_user (
   user_id              char(10)             not null,
   user_name            varchar(30)          null,
   birth                datetime             null,
   constraint PK_TBL_USER primary key (user_id)
)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_USER foreign key (user_id)
      references tbl_user (user_id)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_TIME foreign key (time_id)
      references tbl_time (time_id)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_AREA foreign key (area_id)
      references tbl_area (area_id)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_EDU foreign key (edu_id)
      references tbl_edu (edu_id)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_TYPE foreign key (type_pid)
      references tbl_type (type_pid)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_GOOD foreign key (goods_id)
      references tbl_goods (goods_id)
go

alter table tbl_order
   add constraint FK_TBL_ORDE_REFERENCE_TBL_AGE foreign key (age_id)
      references tbl_age (age_id)
go

