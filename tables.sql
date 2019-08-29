PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2019-05-20 08:28:16.409893');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2019-05-20 08:28:16.425536');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2019-05-20 08:28:16.463328');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2019-05-20 08:28:16.478937');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2019-05-20 08:28:16.494552');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2019-05-20 08:28:16.525798');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2019-05-20 08:28:16.547661');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2019-05-20 08:28:16.578941');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2019-05-20 08:28:16.594529');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2019-05-20 08:28:16.610180');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2019-05-20 08:28:16.625782');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2019-05-20 08:28:16.647957');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2019-05-20 08:28:16.663608');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2019-05-20 08:28:16.694857');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2019-05-20 08:28:16.710446');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2019-05-20 08:28:16.726067');
INSERT INTO django_migrations VALUES(17,'hue','0001_initial','2019-05-20 08:28:16.779180');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2019-05-20 08:28:16.794767');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
INSERT INTO django_admin_log VALUES(1,'2019-05-20 08:30:40.320109','1','참나무집','[{"added": {}}]',9,1,1);
INSERT INTO django_admin_log VALUES(2,'2019-05-20 08:30:53.976956','2','감나무집','[{"added": {}}]',9,1,1);
INSERT INTO django_admin_log VALUES(3,'2019-05-20 08:31:01.314316','2','감나무집','[{"changed": {"fields": ["room_num"]}}]',9,1,2);
INSERT INTO django_admin_log VALUES(4,'2019-05-20 08:31:51.482672','3','1 소나무집','[{"added": {}}]',9,1,1);
INSERT INTO django_admin_log VALUES(5,'2019-05-20 08:32:23.307747','1','room, 1, 비었음','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(6,'2019-05-20 08:32:33.855852','2','room, 2, 사용중','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(7,'2019-05-20 08:33:22.628637','3','device, 1, 미사용','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(8,'2019-05-20 08:33:33.795929','4','device, 2, 사용중','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(9,'2019-05-20 08:34:06.402579','5','navi, 1, 0도','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(10,'2019-05-20 08:34:37.366912','6','navi, 2, 우회전','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(11,'2019-05-20 08:34:43.923619','5','navi, 1, 직진','[{"changed": {"fields": ["state"]}}]',8,1,2);
INSERT INTO django_admin_log VALUES(12,'2019-05-20 08:35:08.089917','7','navi, 3, 좌회전','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(13,'2019-05-20 08:36:03.830046','3','3 소나무집','[{"changed": {"fields": ["room_num"]}}]',9,1,2);
INSERT INTO django_admin_log VALUES(14,'2019-05-20 08:36:15.014710','1','G10001','[{"added": {}}]',7,1,1);
INSERT INTO django_admin_log VALUES(15,'2019-05-20 08:36:23.467880','2','G10002','[{"added": {}}]',7,1,1);
INSERT INTO django_admin_log VALUES(16,'2019-05-20 08:36:29.948694','3','G10003','[{"added": {}}]',7,1,1);
INSERT INTO django_admin_log VALUES(17,'2019-05-20 08:37:14.501553','8','navi, 0, END','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES(18,'2019-05-20 08:37:34.769056','1','1 참나무집','[{"changed": {"fields": ["path1", "path2", "path3", "path4"]}}]',9,1,2);
INSERT INTO django_admin_log VALUES(19,'2019-05-20 08:37:54.140117','2','2 감나무집','[{"changed": {"fields": ["path1", "path2", "path3", "path4", "path5"]}}]',9,1,2);
INSERT INTO django_admin_log VALUES(20,'2019-05-20 08:38:11.489898','3','3 소나무집','[{"changed": {"fields": ["path1", "path2", "path3", "path4", "path5", "path6", "path7"]}}]',9,1,2);
INSERT INTO django_admin_log VALUES(21,'2019-05-20 08:38:38.219581','1','hue, 1 참나무집, , room, 1, 비었음, G10001','[{"added": {}}]',10,1,1);
INSERT INTO django_admin_log VALUES(22,'2019-05-20 08:38:49.683641','1','hue, 1 참나무집, 1234, room, 1, 비었음, G10001','[{"changed": {"fields": ["carno"]}}]',10,1,2);
INSERT INTO django_admin_log VALUES(23,'2019-05-20 08:39:00.690856','2','hue, 2 감나무집, , room, 1, 비었음, G10002','[{"added": {}}]',10,1,1);
INSERT INTO django_admin_log VALUES(24,'2019-05-20 08:39:11.855028','3','hue, 3 소나무집, , room, 1, 비었음, G10003','[{"added": {}}]',10,1,1);
INSERT INTO django_admin_log VALUES(25,'2019-05-20 08:39:19.734164','2','hue, 2 감나무집, 9999, room, 1, 비었음, G10002','[{"changed": {"fields": ["carno"]}}]',10,1,2);
INSERT INTO django_admin_log VALUES(26,'2019-05-20 08:39:25.734320','3','hue, 3 소나무집, 6789, room, 1, 비었음, G10003','[{"changed": {"fields": ["carno"]}}]',10,1,2);
INSERT INTO django_admin_log VALUES(27,'2019-05-20 09:03:23.267194','3','소나무집_5','[{"changed": {"fields": ["room_num"]}}]',9,1,2);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'hue','device');
INSERT INTO django_content_type VALUES(8,'hue','state');
INSERT INTO django_content_type VALUES(9,'hue','room');
INSERT INTO django_content_type VALUES(10,'hue','reserve');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_device','Can add device');
INSERT INTO auth_permission VALUES(26,7,'change_device','Can change device');
INSERT INTO auth_permission VALUES(27,7,'delete_device','Can delete device');
INSERT INTO auth_permission VALUES(28,7,'view_device','Can view device');
INSERT INTO auth_permission VALUES(29,8,'add_state','Can add state');
INSERT INTO auth_permission VALUES(30,8,'change_state','Can change state');
INSERT INTO auth_permission VALUES(31,8,'delete_state','Can delete state');
INSERT INTO auth_permission VALUES(32,8,'view_state','Can view state');
INSERT INTO auth_permission VALUES(33,9,'add_room','Can add room');
INSERT INTO auth_permission VALUES(34,9,'change_room','Can change room');
INSERT INTO auth_permission VALUES(35,9,'delete_room','Can delete room');
INSERT INTO auth_permission VALUES(36,9,'view_room','Can view room');
INSERT INTO auth_permission VALUES(37,10,'add_reserve','Can add reserve');
INSERT INTO auth_permission VALUES(38,10,'change_reserve','Can change reserve');
INSERT INTO auth_permission VALUES(39,10,'delete_reserve','Can delete reserve');
INSERT INTO auth_permission VALUES(40,10,'view_reserve','Can view reserve');
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$150000$Uns35nuVj0Wb$VJ+gkKcKDFUcqS7+PfXpBt9KOe+n8IfAhjxgN3ysfQ8=','2019-05-20 08:29:06.584211',1,'hue','','foombar@gmail.com',1,1,'2019-05-20 08:28:37.273217','');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "hue_state" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "target" varchar(10) NOT NULL, "code" varchar(1) NOT NULL, "state" varchar(20) NOT NULL);
INSERT INTO hue_state VALUES(1,'room','1','비었음');
INSERT INTO hue_state VALUES(2,'room','2','사용중');
INSERT INTO hue_state VALUES(3,'device','1','미사용');
INSERT INTO hue_state VALUES(4,'device','2','사용중');
INSERT INTO hue_state VALUES(5,'navi','1','직진');
INSERT INTO hue_state VALUES(6,'navi','2','우회전');
INSERT INTO hue_state VALUES(7,'navi','3','좌회전');
INSERT INTO hue_state VALUES(8,'navi','0','END');
CREATE TABLE IF NOT EXISTS "hue_room" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "room_num" integer NOT NULL, "room_name" varchar(20) NOT NULL, "path1_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path2_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path3_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path4_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path5_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path6_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path7_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path8_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "path9_id" integer NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO hue_room VALUES(1,1,'참나무집',5,6,5,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO hue_room VALUES(2,2,'감나무집',6,5,7,5,8,NULL,NULL,NULL,NULL);
INSERT INTO hue_room VALUES(3,5,'소나무집',7,6,5,7,5,5,8,NULL,NULL);
CREATE TABLE IF NOT EXISTS "hue_reserve" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "carno" varchar(20) NOT NULL, "device1_id" integer NOT NULL REFERENCES "hue_device" ("id") DEFERRABLE INITIALLY DEFERRED, "device2_id" integer NULL REFERENCES "hue_device" ("id") DEFERRABLE INITIALLY DEFERRED, "device3_id" integer NULL REFERENCES "hue_device" ("id") DEFERRABLE INITIALLY DEFERRED, "room_name_id" integer NOT NULL REFERENCES "hue_room" ("id") DEFERRABLE INITIALLY DEFERRED, "room_num_id" integer NOT NULL REFERENCES "hue_room" ("id") DEFERRABLE INITIALLY DEFERRED, "state_id" integer NOT NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO hue_reserve VALUES(1,'1234',1,NULL,NULL,1,1,1,1);
INSERT INTO hue_reserve VALUES(2,'9999',2,NULL,NULL,2,2,1,1);
INSERT INTO hue_reserve VALUES(3,'6789',3,NULL,NULL,3,3,1,1);
CREATE TABLE IF NOT EXISTS "hue_device" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "device" varchar(20) NOT NULL, "user_name" varchar(20) NOT NULL, "phone" varchar(20) NOT NULL, "room_name_id" integer NOT NULL REFERENCES "hue_room" ("id") DEFERRABLE INITIALLY DEFERRED, "state_id" integer NOT NULL REFERENCES "hue_state" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO hue_device VALUES(1,'G10001','','',1,3);
INSERT INTO hue_device VALUES(2,'G10002','','',2,3);
INSERT INTO hue_device VALUES(3,'G10003','','',3,3);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('15tgnmembseo00gjyoir6r51l2voadtv','YzU5ZmU0MDg0ZjJhMGIxNTU1YmFiMmExZjQ1M2NiN2RjYzQyMTc5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjFiZGNlZTQyNGEyNWI0YmNhNmMzNWViM2Q4ZjRmZDdhODc5NmE3In0=','2019-06-03 08:29:06.597472');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',18);
INSERT INTO sqlite_sequence VALUES('django_admin_log',27);
INSERT INTO sqlite_sequence VALUES('django_content_type',10);
INSERT INTO sqlite_sequence VALUES('auth_permission',40);
INSERT INTO sqlite_sequence VALUES('auth_user',1);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('hue_device',3);
INSERT INTO sqlite_sequence VALUES('hue_room',3);
INSERT INTO sqlite_sequence VALUES('hue_state',8);
INSERT INTO sqlite_sequence VALUES('hue_reserve',3);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "hue_room_path1_id_e764f871" ON "hue_room" ("path1_id");
CREATE INDEX "hue_room_path2_id_0b633251" ON "hue_room" ("path2_id");
CREATE INDEX "hue_room_path3_id_b7c4e91c" ON "hue_room" ("path3_id");
CREATE INDEX "hue_room_path4_id_7944db90" ON "hue_room" ("path4_id");
CREATE INDEX "hue_room_path5_id_f19c0af4" ON "hue_room" ("path5_id");
CREATE INDEX "hue_room_path6_id_05fe1a38" ON "hue_room" ("path6_id");
CREATE INDEX "hue_room_path7_id_10f08817" ON "hue_room" ("path7_id");
CREATE INDEX "hue_room_path8_id_95538f13" ON "hue_room" ("path8_id");
CREATE INDEX "hue_room_path9_id_5e27e628" ON "hue_room" ("path9_id");
CREATE INDEX "hue_reserve_device1_id_5d1b8fe7" ON "hue_reserve" ("device1_id");
CREATE INDEX "hue_reserve_device2_id_c5e64cbb" ON "hue_reserve" ("device2_id");
CREATE INDEX "hue_reserve_device3_id_c2f4198f" ON "hue_reserve" ("device3_id");
CREATE INDEX "hue_reserve_room_name_id_a80e89ff" ON "hue_reserve" ("room_name_id");
CREATE INDEX "hue_reserve_room_num_id_e6e587e4" ON "hue_reserve" ("room_num_id");
CREATE INDEX "hue_reserve_state_id_bad3e100" ON "hue_reserve" ("state_id");
CREATE INDEX "hue_reserve_user_id_e552e6de" ON "hue_reserve" ("user_id");
CREATE INDEX "hue_device_room_name_id_63f525fd" ON "hue_device" ("room_name_id");
CREATE INDEX "hue_device_state_id_31530558" ON "hue_device" ("state_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;