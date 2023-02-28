FROM elixir:1.14.3-alpine

WORKDIR /app

RUN apk add --update --no-cache \
    curl curl-dev make g++ postgresql-client bash openssh git \
    openssl libgcc inotify-tools

# Install Hex package manager.
RUN mix local.hex --force
RUN mix local.rebar --force

# Create app directory and copy the Elixir projects into it.
RUN mkdir /app
COPY . app
WORKDIR /app

RUN mix deps.get
