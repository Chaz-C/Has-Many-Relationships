DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id serial PRIMARY KEY NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) DEFAULT NULL,
  last_name varchar(90) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts (
  id serial PRIMARY KEY NOT NULL,
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  users integer REFERENCES users
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id serial PRIMARY KEY NOT NULL,
  body varchar(510) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  posts integer REFERENCES posts,
  users integer REFERENCES users
);