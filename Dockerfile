FROM ruby:3.3.6-alpine

ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git libc6-compat"
ARG DEV_PACKAGES="build-base curl-dev"
ARG WORKDIR

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo   

WORKDIR ${HOME}

COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]

