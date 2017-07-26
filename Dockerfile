FROM buildpack-deps:stretch-scm

ENV LEIN_ROOT 1

RUN   apt-get update \
   && apt-get install -y python3-pip libyaml-dev python3.5-dev zip libzmq-jni openjdk-8-jdk-headless \
   && pip3 install awscli pyminifier cython \
   && VER="17.06.0-ce" \
   && curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein && chmod a+x /usr/local/bin/lein && lein \
   && curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz \
   && tar -xz -C /tmp -f /tmp/docker-$VER.tgz \
   && mv /tmp/docker/* /usr/bin