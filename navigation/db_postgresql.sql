/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - mall
*********************************************************************
*/




-- USE "mall";

/*Table structure for table "auth_group" */

DROP TABLE IF EXISTS "auth_group";

CREATE TABLE "auth_group" (
  "id" int NOT NULL AUTO_INCREMENT,
  "name" varchar(150) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "name" ("name")

/*Data for the table "auth_group" */

/*Table structure for table "auth_group_permissions" */

DROP TABLE IF EXISTS "auth_group_permissions";

CREATE TABLE "auth_group_permissions" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "group_id" int NOT NULL,
  "permission_id" int NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ("group_id","permission_id"),
  KEY "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" ("permission_id"),
  CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")

/*Data for the table "auth_group_permissions" */

/*Table structure for table "auth_permission" */

DROP TABLE IF EXISTS "auth_permission";

CREATE TABLE "auth_permission" (
  "id" int NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL,
  "content_type_id" int NOT NULL,
  "codename" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_permission_content_type_id_codename_01ab375a_uniq" ("content_type_id","codename"),
  CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id")

/*Data for the table "auth_permission" */

insert  into "auth_permission"("id","name","content_type_id","codename") values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add order_table',8,'add_order_table'),
(30,'Can change order_table',8,'change_order_table'),
(31,'Can delete order_table',8,'delete_order_table'),
(32,'Can view order_table',8,'view_order_table'),
(33,'Can add room_table',9,'add_room_table'),
(34,'Can change room_table',9,'change_room_table'),
(35,'Can delete room_table',9,'delete_room_table'),
(36,'Can view room_table',9,'view_room_table'),
(37,'Can add route_table',10,'add_route_table'),
(38,'Can change route_table',10,'change_route_table'),
(39,'Can delete route_table',10,'delete_route_table'),
(40,'Can view route_table',10,'view_route_table'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add shop_table',12,'add_shop_table'),
(46,'Can change shop_table',12,'change_shop_table'),
(47,'Can delete shop_table',12,'delete_shop_table'),
(48,'Can view shop_table',12,'view_shop_table'),
(49,'Can add rating_table',13,'add_rating_table'),
(50,'Can change rating_table',13,'change_rating_table'),
(51,'Can delete rating_table',13,'delete_rating_table'),
(52,'Can view rating_table',13,'view_rating_table'),
(53,'Can add product_table',14,'add_product_table'),
(54,'Can change product_table',14,'change_product_table'),
(55,'Can delete product_table',14,'delete_product_table'),
(56,'Can view product_table',14,'view_product_table'),
(57,'Can add payment_table',15,'add_payment_table'),
(58,'Can change payment_table',15,'change_payment_table'),
(59,'Can delete payment_table',15,'delete_payment_table'),
(60,'Can view payment_table',15,'view_payment_table'),
(61,'Can add order_details_table',16,'add_order_details_table'),
(62,'Can change order_details_table',16,'change_order_details_table'),
(63,'Can delete order_details_table',16,'delete_order_details_table'),
(64,'Can view order_details_table',16,'view_order_details_table'),
(65,'Can add offer_table',17,'add_offer_table'),
(66,'Can change offer_table',17,'change_offer_table'),
(67,'Can delete offer_table',17,'delete_offer_table'),
(68,'Can view offer_table',17,'view_offer_table'),
(69,'Can add feadback_table',18,'add_feadback_table'),
(70,'Can change feadback_table',18,'change_feadback_table'),
(71,'Can delete feadback_table',18,'delete_feadback_table'),
(72,'Can view feadback_table',18,'view_feadback_table'),
(73,'Can add complaint_table',19,'add_complaint_table'),
(74,'Can change complaint_table',19,'change_complaint_table'),
(75,'Can delete complaint_table',19,'delete_complaint_table'),
(76,'Can view complaint_table',19,'view_complaint_table'),
(77,'Can add feedback_table',20,'add_feedback_table'),
(78,'Can change feedback_table',20,'change_feedback_table'),
(79,'Can delete feedback_table',20,'delete_feedback_table'),
(80,'Can view feedback_table',20,'view_feedback_table');

/*Table structure for table "auth_user" */

DROP TABLE IF EXISTS "auth_user";

CREATE TABLE "auth_user" (
  "id" int NOT NULL AUTO_INCREMENT,
  "password" varchar(128) NOT NULL,
  "last_login" datetime(6) DEFAULT NULL,
  "is_superuser" tinyint(1) NOT NULL,
  "username" varchar(150) NOT NULL,
  "first_name" varchar(150) NOT NULL,
  "last_name" varchar(150) NOT NULL,
  "email" varchar(254) NOT NULL,
  "is_staff" tinyint(1) NOT NULL,
  "is_active" tinyint(1) NOT NULL,
  "date_joined" datetime(6) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "username" ("username")

/*Data for the table "auth_user" */

/*Table structure for table "auth_user_groups" */

DROP TABLE IF EXISTS "auth_user_groups";

CREATE TABLE "auth_user_groups" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "user_id" int NOT NULL,
  "group_id" int NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_user_groups_user_id_group_id_94350c0c_uniq" ("user_id","group_id"),
  KEY "auth_user_groups_group_id_97559544_fk_auth_group_id" ("group_id"),
  CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
  CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")

/*Data for the table "auth_user_groups" */

/*Table structure for table "auth_user_user_permissions" */

DROP TABLE IF EXISTS "auth_user_user_permissions";

CREATE TABLE "auth_user_user_permissions" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "user_id" int NOT NULL,
  "permission_id" int NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ("user_id","permission_id"),
  KEY "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" ("permission_id"),
  CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")

/*Data for the table "auth_user_user_permissions" */

/*Table structure for table "django_admin_log" */

DROP TABLE IF EXISTS "django_admin_log";

CREATE TABLE "django_admin_log" (
  "id" int NOT NULL AUTO_INCREMENT,
  "action_time" datetime(6) NOT NULL,
  "object_id" longtext,
  "object_repr" varchar(200) NOT NULL,
  "action_flag" smallint unsigned NOT NULL,
  "change_message" longtext NOT NULL,
  "content_type_id" int DEFAULT NULL,
  "user_id" int NOT NULL,
  PRIMARY KEY ("id"),
  KEY "django_admin_log_content_type_id_c4bce8eb_fk_django_co" ("content_type_id"),
  KEY "django_admin_log_user_id_c564eba6_fk_auth_user_id" ("user_id"),
  CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
  CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
  CONSTRAINT "django_admin_log_chk_1" CHECK (("action_flag" >= 0))

/*Data for the table "django_admin_log" */

/*Table structure for table "django_content_type" */

DROP TABLE IF EXISTS "django_content_type";

CREATE TABLE "django_content_type" (
  "id" int NOT NULL AUTO_INCREMENT,
  "app_label" varchar(100) NOT NULL,
  "model" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "django_content_type_app_label_model_76bd3d3b_uniq" ("app_label","model")

/*Data for the table "django_content_type" */

insert  into "django_content_type"("id","app_label","model") values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(19,'navigation_app','complaint_table'),
(18,'navigation_app','feadback_table'),
(20,'navigation_app','feedback_table'),
(7,'navigation_app','login_table'),
(17,'navigation_app','offer_table'),
(16,'navigation_app','order_details_table'),
(8,'navigation_app','order_table'),
(15,'navigation_app','payment_table'),
(14,'navigation_app','product_table'),
(13,'navigation_app','rating_table'),
(9,'navigation_app','room_table'),
(10,'navigation_app','route_table'),
(12,'navigation_app','shop_table'),
(11,'navigation_app','user_table'),
(6,'sessions','session');

/*Table structure for table "django_migrations" */

DROP TABLE IF EXISTS "django_migrations";

CREATE TABLE "django_migrations" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "app" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "applied" datetime(6) NOT NULL,
  PRIMARY KEY ("id")

/*Data for the table "django_migrations" */

insert  into "django_migrations"("id","app","name","applied") values 
(1,'contenttypes','0001_initial','2023-12-20 08:42:58.206790'),
(2,'auth','0001_initial','2023-12-20 08:42:58.600007'),
(3,'admin','0001_initial','2023-12-20 08:42:58.690258'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-20 08:42:58.705245'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-20 08:42:58.707750'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-20 08:42:58.765282'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-20 08:42:58.795277'),
(8,'auth','0003_alter_user_email_max_length','2023-12-20 08:42:58.825349'),
(9,'auth','0004_alter_user_username_opts','2023-12-20 08:42:58.825349'),
(10,'auth','0005_alter_user_last_login_null','2023-12-20 08:42:58.870341'),
(11,'auth','0006_require_contenttypes_0002','2023-12-20 08:42:58.870341'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-20 08:42:58.885338'),
(13,'auth','0008_alter_user_username_max_length','2023-12-20 08:42:58.915498'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-20 08:42:58.960494'),
(15,'auth','0010_alter_group_name_max_length','2023-12-20 08:42:58.975525'),
(16,'auth','0011_update_proxy_permissions','2023-12-20 08:42:58.990489'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-20 08:42:59.035563'),
(18,'navigation_app','0001_initial','2023-12-20 08:42:59.619908'),
(19,'sessions','0001_initial','2023-12-20 08:42:59.649906'),
(20,'navigation_app','0002_auto_20231221_1039','2023-12-21 05:10:02.663412'),
(21,'navigation_app','0003_delete_route_table','2023-12-23 09:18:09.929918'),
(22,'navigation_app','0004_route_table','2023-12-23 09:21:32.232286');

/*Table structure for table "django_session" */

DROP TABLE IF EXISTS "django_session";

CREATE TABLE "django_session" (
  "session_key" varchar(40) NOT NULL,
  "session_data" longtext NOT NULL,
  "expire_date" datetime(6) NOT NULL,
  PRIMARY KEY ("session_key"),
  KEY "django_session_expire_date_a5c62663" ("expire_date")

/*Data for the table "django_session" */

insert  into "django_session"("session_key","session_data","expire_date") values 
('ldn0ec8k2te9wtneqhv94comez41o6ju','.eJyrVkrOz43PTFGystBRKsqHsk11lIoz8gvic0AcQwMdJRBtXAsATO0N6Q:1rLgpz:g1RySnQjCOrfKTu1_e-qBtaOenSgUadooz6YkFJT5cU','2024-01-19 09:49:59.379652');

/*Table structure for table "navigation_app_complaint_table" */

DROP TABLE IF EXISTS "navigation_app_complaint_table";

CREATE TABLE "navigation_app_complaint_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "complaint" varchar(100) NOT NULL,
  "date" date NOT NULL,
  "reply" varchar(100) NOT NULL,
  "User_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_compl_User_id_68c3a165_fk_navigatio" ("User_id"),
  CONSTRAINT "navigation_app_compl_User_id_68c3a165_fk_navigatio" FOREIGN KEY ("User_id") REFERENCES "navigation_app_user_table" ("id")

/*Data for the table "navigation_app_complaint_table" */

insert  into "navigation_app_complaint_table"("id","complaint","date","reply","User_id") values 
(1,'bad','2023-12-13','rrr',1),
(4,'good','2023-12-16','yyyy',1),
(5,'ggg','2023-12-24','aaaa',1),
(7,'fff','2024-01-01','',1),
(8,'ee','2024-01-30','',1);

/*Table structure for table "navigation_app_feedback_table" */

DROP TABLE IF EXISTS "navigation_app_feedback_table";

CREATE TABLE "navigation_app_feedback_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "feedback" varchar(100) NOT NULL,
  "rating" double NOT NULL,
  "date" date NOT NULL,
  "User_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_feedb_User_id_09564108_fk_navigatio" ("User_id"),
  CONSTRAINT "navigation_app_feedb_User_id_09564108_fk_navigatio" FOREIGN KEY ("User_id") REFERENCES "navigation_app_user_table" ("id")

/*Data for the table "navigation_app_feedback_table" */

insert  into "navigation_app_feedback_table"("id","feedback","rating","date","User_id") values 
(1,'sobad',5,'2023-12-08',1),
(2,'sogood',3,'2023-12-02',1);

/*Table structure for table "navigation_app_login_table" */

DROP TABLE IF EXISTS "navigation_app_login_table";

CREATE TABLE "navigation_app_login_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "username" varchar(100) NOT NULL,
  "password" varchar(100) NOT NULL,
  "type" varchar(100) NOT NULL,
  PRIMARY KEY ("id")

/*Data for the table "navigation_app_login_table" */

insert  into "navigation_app_login_table"("id","username","password","type") values 
(1,'admin','123','admin'),
(7,'abc','88','user'),
(10,'cr7','777','shop'),
(11,'sh','123','shop'),
(12,'hamood','123','reject');

/*Table structure for table "navigation_app_offer_table" */

DROP TABLE IF EXISTS "navigation_app_offer_table";

CREATE TABLE "navigation_app_offer_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "offer_price" double NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "product_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_offer_product_id_a68aa185_fk_navigatio" ("product_id"),
  CONSTRAINT "navigation_app_offer_product_id_a68aa185_fk_navigatio" FOREIGN KEY ("product_id") REFERENCES "navigation_app_product_table" ("id")

/*Data for the table "navigation_app_offer_table" */

insert  into "navigation_app_offer_table"("id","offer_price","start_date","end_date","product_id") values 
(1,7777,'2023-12-14','2023-12-14',6);

/*Table structure for table "navigation_app_order_details_table" */

DROP TABLE IF EXISTS "navigation_app_order_details_table";

CREATE TABLE "navigation_app_order_details_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "quantity" double NOT NULL,
  "amount" double NOT NULL,
  "status" varchar(100) NOT NULL,
  "date" date NOT NULL,
  "order_id" bigint NOT NULL,
  "product_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_order_order_id_200ce0c3_fk_navigatio" ("order_id"),
  KEY "navigation_app_order_product_id_ec3b4e56_fk_navigatio" ("product_id"),
  CONSTRAINT "navigation_app_order_order_id_200ce0c3_fk_navigatio" FOREIGN KEY ("order_id") REFERENCES "navigation_app_order_table" ("id"),
  CONSTRAINT "navigation_app_order_product_id_ec3b4e56_fk_navigatio" FOREIGN KEY ("product_id") REFERENCES "navigation_app_product_table" ("id")

/*Data for the table "navigation_app_order_details_table" */

insert  into "navigation_app_order_details_table"("id","quantity","amount","status","date","order_id","product_id") values 
(2,50,30,'pending','2024-01-17',1,2),
(3,45,67,'pending','2024-01-05',2,6);

/*Table structure for table "navigation_app_order_table" */

DROP TABLE IF EXISTS "navigation_app_order_table";

CREATE TABLE "navigation_app_order_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "date" date NOT NULL,
  "quantity" double NOT NULL,
  "amount" double NOT NULL,
  "status" varchar(100) NOT NULL,
  "User_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_order_User_id_c5f7a4b4_fk_navigatio" ("User_id"),
  CONSTRAINT "navigation_app_order_User_id_c5f7a4b4_fk_navigatio" FOREIGN KEY ("User_id") REFERENCES "navigation_app_user_table" ("id")

/*Data for the table "navigation_app_order_table" */

insert  into "navigation_app_order_table"("id","date","quantity","amount","status","User_id") values 
(1,'2024-01-10',50,100,'pending',1),
(2,'2024-01-01',40,300,'pending',1);

/*Table structure for table "navigation_app_payment_table" */

DROP TABLE IF EXISTS "navigation_app_payment_table";

CREATE TABLE "navigation_app_payment_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "amount" double NOT NULL,
  "date" date NOT NULL,
  "User_id" bigint NOT NULL,
  "order_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_payme_User_id_6cff23fa_fk_navigatio" ("User_id"),
  KEY "navigation_app_payme_order_id_372af994_fk_navigatio" ("order_id"),
  CONSTRAINT "navigation_app_payme_order_id_372af994_fk_navigatio" FOREIGN KEY ("order_id") REFERENCES "navigation_app_order_table" ("id"),
  CONSTRAINT "navigation_app_payme_User_id_6cff23fa_fk_navigatio" FOREIGN KEY ("User_id") REFERENCES "navigation_app_user_table" ("id")

/*Data for the table "navigation_app_payment_table" */

/*Table structure for table "navigation_app_product_table" */

DROP TABLE IF EXISTS "navigation_app_product_table";

CREATE TABLE "navigation_app_product_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "product" varchar(100) NOT NULL,
  "price" double NOT NULL,
  "stock" int NOT NULL,
  "image" varchar(100) NOT NULL,
  "shop_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_produ_shop_id_a3fc7530_fk_navigatio" ("shop_id"),
  CONSTRAINT "navigation_app_produ_shop_id_a3fc7530_fk_navigatio" FOREIGN KEY ("shop_id") REFERENCES "navigation_app_shop_table" ("id")

/*Data for the table "navigation_app_product_table" */

insert  into "navigation_app_product_table"("id","product","price","stock","image","shop_id") values 
(2,'aa',6,8,'aaaaa_8338SL0.jpg',7),
(3,'bb',66,78,'Screenshot (536)_US48lnm.png',7),
(6,'ooo',988,80,'Screenshot (537)_mhjLMcW.png',6);

/*Table structure for table "navigation_app_rating_table" */

DROP TABLE IF EXISTS "navigation_app_rating_table";

CREATE TABLE "navigation_app_rating_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "rating" double NOT NULL,
  "date" date NOT NULL,
  "User_id" bigint NOT NULL,
  "shop_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_ratin_User_id_522f5f3c_fk_navigatio" ("User_id"),
  KEY "navigation_app_ratin_shop_id_240d9495_fk_navigatio" ("shop_id"),
  CONSTRAINT "navigation_app_ratin_shop_id_240d9495_fk_navigatio" FOREIGN KEY ("shop_id") REFERENCES "navigation_app_shop_table" ("id"),
  CONSTRAINT "navigation_app_ratin_User_id_522f5f3c_fk_navigatio" FOREIGN KEY ("User_id") REFERENCES "navigation_app_user_table" ("id")

/*Data for the table "navigation_app_rating_table" */

insert  into "navigation_app_rating_table"("id","rating","date","User_id","shop_id") values 
(3,3,'2023-12-01',1,6),
(4,5,'2024-01-17',1,7);

/*Table structure for table "navigation_app_room_table" */

DROP TABLE IF EXISTS "navigation_app_room_table";

CREATE TABLE "navigation_app_room_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "room_no" int NOT NULL,
  "floor" int NOT NULL,
  "Dimention" varchar(100) NOT NULL,
  "Wifi" varchar(100) NOT NULL,
  "status" varchar(100) NOT NULL,
  PRIMARY KEY ("id")

/*Data for the table "navigation_app_room_table" */

insert  into "navigation_app_room_table"("id","room_no","floor","Dimention","Wifi","status") values 
(5,10,1,'6.9','fgujh','available'),
(6,11,1,'34','abcd','available'),
(7,12,1,'563','ietd','available'),
(8,13,2,'653','fgef','available'),
(9,65,3,'67','dcs','available');

/*Table structure for table "navigation_app_route_table" */

DROP TABLE IF EXISTS "navigation_app_route_table";

CREATE TABLE "navigation_app_route_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "route" varchar(100) NOT NULL,
  "from_id_id" bigint NOT NULL,
  "to_id_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_route_from_id_id_a2506197_fk_navigatio" ("from_id_id"),
  KEY "navigation_app_route_to_id_id_efd2b0b8_fk_navigatio" ("to_id_id"),
  CONSTRAINT "navigation_app_route_from_id_id_a2506197_fk_navigatio" FOREIGN KEY ("from_id_id") REFERENCES "navigation_app_room_table" ("id"),
  CONSTRAINT "navigation_app_route_to_id_id_efd2b0b8_fk_navigatio" FOREIGN KEY ("to_id_id") REFERENCES "navigation_app_room_table" ("id")

/*Data for the table "navigation_app_route_table" */

insert  into "navigation_app_route_table"("id","route","from_id_id","to_id_id") values 
(3,'turn back,then left',7,8),
(4,'go stright',8,9);

/*Table structure for table "navigation_app_shop_table" */

DROP TABLE IF EXISTS "navigation_app_shop_table";

CREATE TABLE "navigation_app_shop_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "owner" varchar(100) NOT NULL,
  "Name" varchar(100) NOT NULL,
  "Photo" varchar(100) NOT NULL,
  "Details" varchar(100) NOT NULL,
  "Phone" bigint NOT NULL,
  "Email" varchar(100) NOT NULL,
  "login_id" bigint NOT NULL,
  "room_id_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_shop__login_id_edd0672b_fk_navigatio" ("login_id"),
  KEY "navigation_app_shop__room_id_id_07866b60_fk_navigatio" ("room_id_id"),
  CONSTRAINT "navigation_app_shop__login_id_edd0672b_fk_navigatio" FOREIGN KEY ("login_id") REFERENCES "navigation_app_login_table" ("id"),
  CONSTRAINT "navigation_app_shop__room_id_id_07866b60_fk_navigatio" FOREIGN KEY ("room_id_id") REFERENCES "navigation_app_room_table" ("id")

/*Data for the table "navigation_app_shop_table" */

insert  into "navigation_app_shop_table"("id","owner","Name","Photo","Details","Phone","Email","login_id","room_id_id") values 
(6,'cr','cr7','aaaaa_FE45wKl.jpg','cr7',777,'cr7',10,5),
(7,'sh','sh','aaaaa_8ad3Dbp.jpg','123',7766,'fguuyuy',11,5);

/*Table structure for table "navigation_app_user_table" */

DROP TABLE IF EXISTS "navigation_app_user_table";

CREATE TABLE "navigation_app_user_table" (
  "id" bigint NOT NULL AUTO_INCREMENT,
  "Name" varchar(100) NOT NULL,
  "place" varchar(100) NOT NULL,
  "post" varchar(100) NOT NULL,
  "pin" int NOT NULL,
  "phone" bigint NOT NULL,
  "Email" varchar(100) NOT NULL,
  "Photo" varchar(100) NOT NULL,
  "login_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  KEY "navigation_app_user__login_id_4488ba90_fk_navigatio" ("login_id"),
  CONSTRAINT "navigation_app_user__login_id_4488ba90_fk_navigatio" FOREIGN KEY ("login_id") REFERENCES "navigation_app_login_table" ("id")

/*Data for the table "navigation_app_user_table" */

insert  into "navigation_app_user_table"("id","Name","place","post","pin","phone","Email","Photo","login_id") values 
(1,'abcd','vga','vga',444,666,'qweer','retfgr',7);

