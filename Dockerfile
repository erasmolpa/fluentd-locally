FROM ruby:latest

LABEL maintainer="erasmolpa@gmail.com"
LABEL description="fluentd DEV tool image"

RUN mkdir /fluentd

RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    wget

COPY Gemfile /fluentd/
COPY fluent.conf /fluentd/

WORKDIR /fluentd

RUN gem install bundler
RUN bundle install


EXPOSE 24224 24220 9292

CMD ["sh", "-c", "fluentd -c /fluentd/fluent.conf"]
ENTRYPOINT [ "fluentd-ui", "start" ]
