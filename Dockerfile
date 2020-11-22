# syntax = docker/dockerfile:experimental

# 1. Load Ruby image
FROM ruby:2.7.2

# 2. Install required packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

# 3. Switch directory to /tmp
WORKDIR /tmp

# 4. Add an user stating the application

## 4-1. Add an user
RUN useradd -m rails

## 4-2. Make a directory and change its owner to the user
RUN mkdir /app && chown rails /app
USER rails

# 5. Install bundler
RUN gem install bundler

# 6. Switch directory to /app
WORKDIR /app

# 7. Transfer Gemfile beforehand and run bundle install to use Docker build step cache

## 7-1. Change the owner of some files related to gem
COPY --chown=rails Gemfile Gemfile.lock package.json yarn.lock /app/

## 7-2. Cache bundle
RUN bundle config set app_config .bundle
RUN bundle config set path .cache/bundle
RUN --mount=type=cache,uid=1000,target=/app/.cache/bundle bundle install && \
  mkdir -p vendor && \
  cp -ar .cache/bundle vendor/bundle
RUN bundle config set path vendor/bundle

# 8. Install yarn
RUN --mount=type=cache,uid=1000,target=/app/.cache/node_modules yarn install --modules-folder .cache/node_modules && \
  cp -ar .cache/node_modules node_modules

# 9. Change the owner of the current directory and copy it to /app
COPY --chown=rails . /app

# 10. Precompile assets
RUN --mount=type=cache,uid=1000,target=/app/tmp/cache bin/rails assets:precompile

# 11. Set root user
USER root

# 12. Remove cache in the host environment
RUN rm -r /app/tmp/cache

# 13. Set root user
USER rails

# 14. Mount the volume to /app/public
VOLUME /app/public

# 15. Define the commands when no command is assigned in execution
EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
