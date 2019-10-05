FROM alpine:3.10.1
RUN apk --no-cache update && apk add --no-cache ruby-full ruby-dev build-base && gem install bundler:1.17.2 tzinfo-data:1.2019.3 --no-ri --no-rdoc

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle update --bundler && bundle install
COPY . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
