FROM alpine/python3:latest
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    libstdc++ cmake zeromq hdf5 iconv idn2 arrow && \
    pip install --no-cache-dir arkouda && \
    apk del .build-deps
CMD [ "bash" "-c" ]