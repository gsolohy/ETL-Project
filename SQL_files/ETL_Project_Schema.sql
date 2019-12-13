create table country(
	country_id int primary key,
	country_name varchar(10));

create table video_stat(
	id serial primary key,
	video_id varchar,
	disklikes int,
	comment_count int,
	tags varchar,	
	thumbnail_link varchar,
	description varchar,
	country_id int references country(country_id));

create table channel(
	channel_id int primary key,
	channel_title varchar);

create table trend(
	trend_id int primary key,
	trending_date date);

create table category(
	category_id int primary key,
	category_name varchar);

create table publish(
	publish_id int primary key,
	publish_date date);

create table video_basic(
	id serial primary key references video_stat(id),
	trend_id int references trend(trend_id),
	title varchar,
	channel_id int references channel(channel_id),
	category_id int references category(category_id),
	publish_id int references publish(publish_id),
	views int,
	likes int)