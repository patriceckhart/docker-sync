FROM alpine:3.14
MAINTAINER Patric Eckhart <mail@patriceckhart.com>

# Alpine doesn't ship with Bash.
RUN apk add --no-cache bash

# Install Unison 
RUN apk add --no-cache shadow \
 && apk add unison

ENV HOME="/root" \
    UNISON_USER="root" \
    UNISON_GROUP="root" \
    UNISON_UID="0" \
    UNISON_GID="0"

RUN groupmod -g 9000 cdrw

# Copy the bg-sync script into the container.
COPY sync.sh /usr/local/bin/bg-sync
RUN chmod +x /usr/local/bin/bg-sync

CMD ["bg-sync"]