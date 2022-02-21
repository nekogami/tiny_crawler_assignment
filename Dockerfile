# syntax=docker/dockerfile:1
FROM ruby:3.1
WORKDIR /usr/src/app

COPY . .
