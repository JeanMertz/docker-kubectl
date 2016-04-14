FROM scratch
MAINTAINER Jean Mertz <jean@mertz.fm>
COPY kubectl kubectl
ENTRYPOINT ["/kubectl"]
