FROM rhinodavid/acado-docker:latest

RUN mkdir -p /home/generation/build

COPY generator.cpp /home/generation
COPY CMakeLists.txt /home/generation
COPY FindACADO.cmake /home/generation

SHELL ["/bin/bash", "-c"]

ENV ACADO_ENV_INCLUDE_DIRS="/home/acado;/home/acado/acado;/home/acado/external_packages;/home/acado/external_packages/qpOASES-3.2.0/include;/home/acado/build"
ENV ACADO_ENV_LIBRARY_DIRS="/home/acado/build/lib"
ENV ACADO_ENV_EXTERNAL_PACKAGES_DIR="/home/acado/external_packages"
ENV ACADO_ENV_CMAKE_DIR="/home/acado/cmake"
ENV ACADO_ENV_STATIC_LIBRARIES=""
ENV ACADO_ENV_SHARED_LIBRARIES="acado_toolkit_s"
ENV ACADO_ENV_QPOASES_EMBEDDED_SOURCES="/home/acado/external_packages/qpoases/SRC/Bounds.cpp;/home/acado/external_packages/qpoases/SRC/CyclingManager.cpp;/home/acado/external_packages/qpoases/SRC/MessageHandling.cpp;/home/acado/external_packages/qpoases/SRC/QProblem.cpp;/home/acado/external_packages/qpoases/SRC/Utils.cpp;/home/acado/external_packages/qpoases/SRC/Constraints.cpp;/home/acado/external_packages/qpoases/SRC/Indexlist.cpp;/home/acado/external_packages/qpoases/SRC/QProblemB.cpp;/home/acado/external_packages/qpoases/SRC/SubjectTo.cpp;/home/acado/external_packages/qpoases/SRC/EXTRAS/SolutionAnalysis.cpp"
ENV ACADO_ENV_QPOASES_EMBEDDED_INC_DIRS="/home/acado/external_packages/qpoases/;/home/acado/external_packages/qpoases/INCLUDE;/home/acado/external_packages/qpoases/SRC"

WORKDIR /home/generation/build
RUN cmake ..
RUN make

VOLUME ["/out"]
