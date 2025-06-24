FROM ruby:3.4.4

WORKDIR /app

COPY Gemfile .

RUN bundle install

COPY . .

EXPOSE 4567

CMD ["ruby", "app.rb"]

