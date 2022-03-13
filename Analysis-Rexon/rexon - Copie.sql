drop table if exists appointments;

drop table if exists meetings;

drop table if exists payment;

drop table if exists progress;

drop table if exists progressmedia;

drop table if exists projectmedia;

drop table if exists projects;

drop table if exists users;

create table appointments
(
   idappointment        int primary key auto_increment,
   iduser               int not null,
   date                 varchar(254),
   description          varchar(254)
);

create table meetings
(
   idmeetings           int primary key auto_increment,
   iduser               int not null,
   code                 varchar(254),
   password             varchar(254),
   start                varchar(254),
   end                  varchar(254)
);

create table payment
(
   idpayment            int primary key auto_increment,
   iduser               int not null,
   amount               float,
   description          varchar(254),
   date                 timestamp default current_timestamp,
   projectid            int
);

create table progress
(
   idprogress           int primary key auto_increment,
   idproject            int not null,
   description          varchar(254),
   percentage           int,
   date                 timestamp default current_timestamp
);

create table progressmedia
(
   idprogressmedia      int primary key auto_increment,
   idprogress           int not null,
   name                 varchar(254),
   path                 varchar(254),
   size                 int,
   type                 varchar(254)
);

create table projectmedia
(
   idprojectmedia       int primary key auto_increment,
   idproject            int not null,
   name                 varchar(254),
   path                 varchar(254),
   size                 int,
   type                 varchar(254)
);

create table projects
(
   idproject            int primary key auto_increment,
   iduser               int not null,
   description          varchar(254),
   budget               float,
   startdate            date,
   enddate              date,
   type                 varchar(254)
);

create table users
(
   iduser               int primary key auto_increment,
   name                 varchar(254),
   username             varchar(254),
   email                varchar(254),
   password             varchar(254),
   city                 varchar(254),
   country              varchar(254),
   tel                  varchar(254),
   status               varchar(254),
   role                 varchar(254)
);

alter table appointments add constraint fk_association2 foreign key (iduser)
      references users (iduser) on delete restrict on update restrict;

alter table meetings add constraint fk_association1 foreign key (iduser)
      references users (iduser) on delete restrict on update restrict;

alter table payment add constraint fk_association7 foreign key (iduser)
      references users (iduser) on delete restrict on update restrict;

alter table progress add constraint fk_association5 foreign key (idproject)
      references projects (idproject) on delete restrict on update restrict;

alter table progressmedia add constraint fk_association6 foreign key (idprogress)
      references progress (idprogress) on delete restrict on update restrict;

alter table projectmedia add constraint fk_association4 foreign key (idproject)
      references projects (idproject) on delete restrict on update restrict;

alter table projects add constraint fk_association3 foreign key (iduser)
      references users (iduser) on delete restrict on update restrict;

