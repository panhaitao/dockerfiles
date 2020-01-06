FROM python:3.7-alpine

COPY requirements.txt /requirements.txt

RUN apk --no-cache add --virtual .build-deps build-base \
    && pip install -r /requirements.txt \
    && rm -rf .cache/pip \
    && apk del .build-deps

EXPOSE 8000

CMD ["sh"]
