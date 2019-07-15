#!/bin/bash

wget https://www.openssl.org/source/openssl-0.9.8.tar.gz \
   && tar xf openssl-0.9.8.tar.gz \
   && cd openssl-0.9.8 \
   && ./config \
   && make \
   && make install \
   && cd .. \
   && rm -rf openssl-0.9.8*
