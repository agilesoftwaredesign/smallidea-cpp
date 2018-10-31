# SmallIdea of a project
Take a look at the code and the scripts:

* ```build-run-spec.sh```
* ```build-run-acceptance-spec.sh```
* ```build-run-coveragereport.sh```
* ```start-fitnesse.sh```

[CMake](https://cmake.org/) is used as a build process tool.
As the code is getting recompiled - in this setup via the scripts -
quite frequently, you may interested in to tool such
as [CCache](https://ccache.samba.org/).

## Using Docker
By using a minimal docker container, you fix and provide a minimal viable environment for building.

    FROM ubuntu:18.04
    RUN apt-get update && \
        apt-get install -y --no-install-recommends git=1:2.17.1-1ubuntu0.3 ca-certificates=20180409 unzip=6.0-21ubuntu1 && \
        apt-get install -y --no-install-recommends gcc=4:7.3.0-3ubuntu2.1 g++=4:7.3.0-3ubuntu2.1 cmake=3.10.2-1ubuntu2 make=4.1-9.1ubuntu1 && \
        apt-get install -y --no-install-recommends libboost-system-dev=1.65.1.0ubuntu1
