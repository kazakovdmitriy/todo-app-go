CREATE TABLE users
(
    id serial PRIMARY KEY,
    name varchar(255) not null,
    username varchar(255) not null unique,
    password_hash varchar(255) not null
);

create table todo_list
(
    id serial primary key,
    title varchar(255) not null,
    description varchar(255)
);

create table users_list
(
    id serial primary key,
    user_id int,
    list_id int,
    foreign key (user_id) references users on delete cascade,
    foreign key (list_id) references todo_list on delete cascade
);

create table todo_items
(
    id serial primary key,
    title varchar(255) not null,
    description varchar(255),
    done boolean not null default false
);

create table lists_items
(
    id serial primary key,
    item_id int,
    list_id int,
    foreign key (item_id) references todo_items on delete cascade,
    foreign key (list_id) references todo_list on delete cascade
)