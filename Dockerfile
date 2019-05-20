FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y ruby ruby-dev build-essential \
 && gem install bundler
RUN useradd --create-home jekyll
USER jekyll
RUN mkdir -p /home/jekyll/project
WORKDIR /home/jekyll/project
RUN bundle init && bundle install --path vendor/bundle && bundle add jekyll
USER jekyll
COPY . ./
