FROM ubuntu:cosmic

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    cmake \
    git


WORKDIR /home

RUN git clone https://github.com/acado/acado.git -b master
RUN mkdir -p /home/acado/build

WORKDIR /home/acado/build
RUN cmake ..
RUN make

RUN make install

RUN /bin/bash -c "source /home/acado/build/acado_env.sh"

CMD ["/bin/bash"]
