FROM node:8.16.1-alpine
ENV CHOKIDAR_USEPOLLING=true
EXPOSE 3000   

# copy binaries
COPY . /webapp 

# env
ENV PATH /webapp/node_modules/.bin:$PATH

WORKDIR /webapp
RUN npm install --silent

# starts web server
CMD ["npm", "start"]