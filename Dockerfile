
FROM ruby:latest


RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    wget


RUN gem install fluentd fluent-plugin-elasticsearch fluent-plugin-test fluentd-ui


#RUN gem install fluent-plugin-diagtool


RUN wget https://raw.githubusercontent.com/fluent/fluentd/v1.12.3/bin/fluent-cat -O /usr/local/bin/fluent-cat && \
    chmod +x /usr/local/bin/fluent-cat


RUN mkdir /fluentd

# 
COPY fluent.conf /fluentd/
COPY fluent-ui.conf /fluentd/
COPY test.rb /fluentd/

# 
WORKDIR /fluentd

#  Fluentd-UI
EXPOSE 24224 24220

# 
CMD ["fluentd", "-c", "fluent.conf"]