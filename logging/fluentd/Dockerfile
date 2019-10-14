FROM fluent/fluentd:v0.12
RUN gem install fluent-plugin-elasticsearch:1.9.5 --no-rdoc --no-ri
RUN gem install fluent-plugin-grok-parser:1.0.0 --no-rdoc --no-ri
COPY fluent.conf /fluentd/etc
