
# Welcome to Blandbook! 

## A lightweight social media platform using React and Ruby on Rails

## Find the main README [here](https://github.com/0HuanyuLi0/blandbook-frontend)  and visit the site on [HEROKU HERE](https://github.com/hwlei888) 

**Authors**:

- Huanyu Daniel Li [Github](https://github.com/0HuanyuLi0)
- Lei Huawen [Github](https://github.com/hwlei888)
- Brendan Tuckerman [Github](https://github.com/MrMaverick79)

A project as part of the General Assembly Software Intensive

**Overview**:

Blandbook (named for Author **B**rendan, **L**ei **an**d **D**aniel), is a social media platfotm that lets people add posts, follow friends and use a simple chat function. It allows users to set up an account, log in and see posts made by themselves and other members of the platform. There is also a map component where you can see details of other users.

It is a full-stack web project that uses web-sockets to support chat messaging, alongside axios HTTP requests.


**Tech Stack**:

Front-end: React, CSS

Back-End: Ruby on Rails, PostgreSQL, ActiveRecord


# Backend: 

This project uses **Ruby on Rails** to support the CRUD application.

The structure for the tables and associations can be found [here](https://www.canva.com/design/DAFMU6f9cGo/BB_iRekLYiRgK_jFtqQrcw/edit) in our original planning.


## Features

- `ChatRoomChannel` uses ActionCable to control the WebSocket Connection with the front end. 


- Use of `Knock` gem to handle authentication in the front end. Many thanks to Chris Stevenson for the easy to follow [tutorial](https://github.com/Chris-Stevenson-Git/Knock-Example-Rails)

- Use of `rack-cors` gem to avoid CORS errors.

- Administration login for access to the backend

- Complex associations for Followers / Following. Here we were about to use `through` associations:

>  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id'
>    has_many :followed_relationships,  class_name: 'Follow', foreign_key: 'followed_id'

 >   has_many :following, through: :following_relationships, source: :followed
  >  has_many :followers, through: :followed_relationships,  source: :follower

## Future:

- Decoding of JWT token connection needs to be refined.

- Build out admin panel on the back end










