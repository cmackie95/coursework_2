# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "connormackie@yahoo.co.uk"

# set a health check
HEALTHCHECK --interval=5s \
			--timeout=5s \
			CMD curl -f http://52.255.226.151:8080 || exit 1

# tell docker what port to expose
EXPOSE 8080

#copy server.js file
COPY server.js ./

#build/run server.js file
CMD node server.js