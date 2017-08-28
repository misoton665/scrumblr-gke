FROM redis:3.2

RUN mkdir -p /usr/local/etc/redis
RUN mkdir -p /var/run/redis

ADD redis.conf /usr/local/etc/redis/redis.conf

VOLUME /home/ebihara/scrumblr-gke/run:/var/run/redis
EXPOSE 6379
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
