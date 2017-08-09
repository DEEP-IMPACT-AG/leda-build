FROM buildpack-deps:stretch-scm

ENV LEIN_ROOT 1

RUN   curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
   && apt-get update \
   && apt-get install -y python3-pip libyaml-dev python3.5-dev zip libzmq-jni openjdk-8-jdk-headless git-lfs \
   && git lfs install \
   && pip3 install awscli pyminifier cython \
   && VER="17.06.0-ce" \
   && curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein && chmod a+x /usr/local/bin/lein && lein \
   && curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz \
   && tar -xz -C /tmp -f /tmp/docker-$VER.tgz \
   && mv /tmp/docker/* /usr/bin \
   && rm -rf /var/lib/apt/lists/* \
   && rm -fr /tmp/*