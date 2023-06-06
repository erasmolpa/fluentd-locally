# This Dockerfile is based on the following:
# https://github.com/fluent/fluentd-docker-image#debian-version
# Debian is used instead of Alpine since the systemd plugin requires systemd as
# a dependency.
FROM fluent/fluentd:v1.15-debian-1

USER root

COPY Gemfile /Gemfile

RUN buildDeps="sudo make gcc g++ libc-dev" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps libjemalloc2 \
    && gem install --file Gemfile \
    && sudo gem sources --clear-all \
    && SUDO_FORCE_REMOVE=yes \
        apt-get purge -y --auto-remove \
            -o APT::AutoRemove::RecommendsImportant=false \
            $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem \
    && ulimit -n 65536

# This will override the version of jemalloc provided by the base image.
# The base image adds version 4.5.0, this makes FluentD use version 5.1.0 which
# reduces memory usage.
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

RUN chmod +x /bin/entrypoint.sh