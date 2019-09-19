FROM nginx:alpine

# copy binaries
COPY . /webapp 

# build webapp
RUN cd /webapp && \
    apk add nodejs && \ 
    apk add npm && \ 
    npm install --silent && \ 
    npm run build && \ 
    apk del nodejs && \
    apk del npm

# copy final build to nginx 
COPY ./setup/nginxconfig /etc/nginx
RUN mkdir /etc/nginx/logs && \
    mv /webapp/build/* /usr/share/nginx/html && \
    rm -rf /webapp

# starts nginx
CMD ["nginx", "-g", "daemon off;"]