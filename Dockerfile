FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y ruby-full=1:2.3.0+1 ruby-dev=1:2.3.0+1 build-essential=12.1ubuntu2 git=1:2.7.4-0ubuntu1.6 mongodb=1:2.6.10-0ubuntu1 --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && gem install bundler:2.0.2 --no-ri --no-rdoc \
    && git clone -b monolith https://github.com/express42/reddit.git \
    && cd /reddit \
    && bundle install

WORKDIR /reddit
CMD service mongodb start && puma
