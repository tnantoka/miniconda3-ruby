FROM continuumio/miniconda3


# Python

RUN conda install scikit-learn


# Ruby

RUN apt-get update
RUN apt-get -y install build-essential libssl-dev zlib1g-dev

RUN wget https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.3.tar.gz
RUN tar xf ruby-2.5.3.tar.gz
WORKDIR ruby-2.5.3

RUN ./configure
RUN make
RUN make install

RUN echo -e "install: --no-document\nupdate: --no-document" >> /.gemrc
RUN gem install bundler

WORKDIR /
RUN rm -rf ruby-2.5.3*
