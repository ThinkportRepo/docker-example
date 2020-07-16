# FROM denotes base image
FROM node:10

# WORKDIR sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. 
# If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.
WORKDIR /usr/src/app

# COPY copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
# For example, the following copy package*.json to /usr/src/app
COPY package*.json ./

# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. 
# The resulting committed image will be used for the next step in the Dockerfile.
RUN npm install

COPY . .

# EXPOSE serves only as documentation. It does not expose port.
# You will have to map port by `docker run -p <localhost port>: <container port> <image>`
EXPOSE 8080

# ENV defines environment variables
# which can then be overrode by `docker run --env LOCATION=Germany <image>`
ENV LOCATION Frankfurt

# ENTRYPOINT you to configure a container that will run as an executable
ENTRYPOINT [ "node", "server.js" ]

# CMD let you to provide default parameters
# which will be overrode if you `docker run <image> <other parameters>`
CMD [ "Yinchi", "Luo" ]
