#drop database if exists overwatch;
create database overwatch;

use overwatch;

CREATE TABLE heroes (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(5000),
    role VARCHAR(90),
    health INT,
    armour INT,
    shield INT,
    real_name VARCHAR(90),
    age INT,
    affiliaton VARCHAR(500),
    base_of_operations VARCHAR(500),
    difficulty INT(3)
);

CREATE TABLE abilities (
    id INT,
    name VARCHAR(100),
    description VARCHAR(5000),
    is_ultimate VARCHAR(10),
    CONSTRAINT ability_frn FOREIGN KEY (id)
        REFERENCES heroes (id)
);

CREATE TABLE game_mode (
    id INT primary key,
    name VARCHAR(90)
);

CREATE TABLE brawl (
    id INT PRIMARY KEY,
    start_date VARCHAR(90)
);

CREATE TABLE brawl_type (
    id INT,
    name VARCHAR(100),
    CONSTRAINT brawl_frn FOREIGN KEY (id)
        REFERENCES brawl (id)
);

CREATE TABLE maps (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    mode VARCHAR(50)
);

CREATE TABLE users (
    battletag VARCHAR(100) PRIMARY KEY
);

CREATE TABLE user_stats (
    battletag VARCHAR(100),
    time_played VARCHAR(50),
    SR INT,
    losses INT,
    wins INT,
    winrate VARCHAR(50),
    total_kills INT,
    total_deaths INT,
    level INT,
    CONSTRAINT userstats_frn FOREIGN KEY (battletag)
        REFERENCES users (battletag)
);

CREATE TABLE user_hero_stats (
    battletag VARCHAR(100),
    hero_id INT,
    wins INT,
    losses INT,
    winrate VARCHAR(50),
    accuracy VARCHAR(50),
    time_played VARCHAR(50),
    CONSTRAINT userherostats_users_frn FOREIGN KEY (battletag)
        REFERENCES users (battletag),
    CONSTRAINT userherostats_heroes_frn FOREIGN KEY (hero_id)
        REFERENCES heroes (id)
);

