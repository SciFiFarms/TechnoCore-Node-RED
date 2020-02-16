FROM nodered/node-red:1.0.3-2
RUN npm i node-red-dashboard node-red-contrib-contextbrowser node-red-contrib-home-assistant-websocket
RUN ln -s /usr/src/node-red/settings.js /data/settings.js

# For credentials that look like paths, set file contents as credential.
COPY 10-mqtt.js /usr/src/node-red/node_modules/node-red/nodes/core/io/10-mqtt.js
COPY data/ /data
COPY settings.js /usr/src/node-red/settings.js

# Make this a symlink so that I can update settings on volume mounted /data. 
VOLUME /data