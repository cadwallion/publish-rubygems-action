FROM ruby:2.6.6

LABEL "name"="Publish to Rubygems"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Publish to Rubygems"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="red"
LABEL "com.github.actions.description"="Build and publish your gem to Rubygems"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
