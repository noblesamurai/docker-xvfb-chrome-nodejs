FROM phusion/baseimage:latest

# Use closest ubuntu mirrors
ADD ubuntu-mirrors /tmp/ubuntu-mirrors
RUN cat /tmp/ubuntu-mirrors > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
  curl \
  git \
  nodejs \
  npm \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-cyrillic \
  xfonts-scalable \
  xvfb

# Symlink node to nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Google chrome (needs curl, so not batched with above)
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y google-chrome-stable

# vim: set et sw=2:
