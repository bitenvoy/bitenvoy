#!/bin/bash
cd ..
#5432 is default postgres port, it must be exposed to function 
sudo docker run --name postgres -d -p 5432:5432 postgres
mix ecto.create && ecto.migrate
npm install


#create database
psql -h localhost -U postgres -c 'CREATE DATABASE bitenvoy_hub_dev;'

mix phoenix.server





