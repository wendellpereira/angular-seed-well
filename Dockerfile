FROM node

EXPOSE 8000

#RUN apt-get update
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
#RUN ln -s /usr/bin/nodejs  /usr/bin/node

RUN npm install -g http-server

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install

# add app
COPY . /app

# start app
CMD npm start
