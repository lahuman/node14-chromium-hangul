FROM node:14.2.0-alpine3.11 as build
 
USER root
 
RUN apk add --no-cache udev ttf-freefont chromium
 
RUN mkdir /usr/share/fonts/nanumfont
RUN wget http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip
RUN unzip NanumFont_TTF_ALL.zip -d /usr/share/fonts/nanumfont
RUN fc-cache -f -v
 
 
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV CHROMIUM_PATH /usr/bin/chromium-browser
 
RUN apk --no-cache add tzdata && \
        cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
        echo "Asia/Seoul" > /etc/timezone
 
# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8
