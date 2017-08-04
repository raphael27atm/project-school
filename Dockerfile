FROM ruby:2.4.1

# Install deps
ENV LANG C.UTF-8
ENV NODE_VERSION=6.9.1

RUN apt-get update && apt-get install -y \
    git-core \
    curl \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    python-software-properties \
    libffi-dev \
    pkg-config \
    cmake \
    postgresql-client --no-install-recommends \
    nodejs

RUN curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g

WORKDIR /home

# Instal bundle and Rails
ENV RAILS_VERSION 5.1.2
RUN echo "gem: --no-rdoc --no-ri" >> $HOME/.gemrc
RUN gem install bundler
RUN gem install rails --version "$RAILS_VERSION" --no-document

ENV APP_HOME /home/school
RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME
# Copy the Gemfile and Gemfile.lock into the image.
COPY Gemfile $APP_HOME
COPY Gemfile.lock $APP_HOME

RUN bundle install
# Install ruby gems.

COPY . $APP_HOME

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]