FROM ruby:2.6

RUN apt-get update -qqy && apt-get install -y --no-install-recommends --no-install-suggests \
  curl locales vim && \
  echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen  && \
  locale-gen ru_RU.UTF-8 && \
  dpkg-reconfigure -f noninteractive locales && \
  update-locale LC_ALL="ru_RU.utf8" LANG="ru_RU.utf8" LANGUAGE="ru_RU" && \
  echo "Europe/Moscow" > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
  curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update -qqy && apt-get install -y --no-install-recommends --no-install-suggests \
  build-essential libpq-dev postgresql-client nodejs imagemagick && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN bundle install

EXPOSE 80

CMD ["bash", "/app/scripts/run_puma.sh"]
