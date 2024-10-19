FROM node:14
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi

COPY . .
ENV PORT 3000
EXPOSE $PORT
CMD ["npm", "run", "start-dev"]

#FROM node:14
#WORKDIR /app
#COPY package.json .
#RUN npm install
#COPY . .
#EXPOSE 4000
#CMD ["npm", "run", "start-dev"]
#CMD ["npm", "start"]