# README #

Adds [swak4Foam](https://openfoamwiki.net/index.php/Contrib/swak4Foam)
and [PyFoam](https://openfoamwiki.net/index.php/Contrib/PyFoam) to
Standard OpenFOAM docker containers. Maintained by the creator of
those two packages.

The sources for these docker containers are
on
[Bitbucket](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile) and
the containers are
on
[Docker Hub](https://hub.docker.com/r/hfdresearch/swak4foamandpyfoam/)

Currently the latest supported version is OpenFOAM v1806+ and OpenFOAM
5.0

[![](https://images.microbadger.com/badges/image/hfdresearch/swak4foamandpyfoam.svg)](https://microbadger.com/images/hfdresearch/swak4foamandpyfoam
"Get your own image badge on microbadger.com")

## Installation / Testing ##

A requirement for using these containers is that you have [Docker](https://www.docker.com/) installed

Create a directory for your tests

    mkdir swakTest
    cd swakTest

Now download the files `installSwakPyFoam` and `startSwakPyFoam` from
the approptiate links below and copy them to `swakTest`. Then install
the container with

    ./installSwakPyFoam

and start the container with

    ./startSwakPyFoam

*Note:* For the OpenFOAM 4.1 container only one script is required
that automatically downloads the container and starts it

Check with

    funkySetFields
    pyFoamVersion.py

that the utilities are available. To check that everything works do
the following

    cd /tmp
    cp -r /opt/swak4Foam/Examples/groovyBC/pulsedPitzDaily .
    cd pulsedPitzDaily
    pyFoamPrepareCase.py .
    pyFoamPlotRunner.py --clear --progress pisoFoam

This should start a run and a number of windows with updating plots should open

## Downloading ##

To get a concrete container download the scripts below

The scripts are adaptations from the scripts supplied for the base
containers. For details look for the documentation there

### OpenFOAM v1806+ ###

Use the scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/c8760a496f56dc2d1f143a7492e83906415b5ec4/installSwakPyFoam)
to pull and install a container and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/c8760a496f56dc2d1f143a7492e83906415b5ec4/startSwakPyFoam)
to run it.

### OpenFOAM v1712+ ###

Use the scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/f44bb069e6b08111c2332ab9b018e154902bccd3/installSwakPyFoam)
to pull and install a container and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/f44bb069e6b08111c2332ab9b018e154902bccd3/startSwakPyFoam)
to run it.

### OpenFOAM v1706+ ###

Use the scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/7a1f96e605d216e920a865384524cb39dbd1a0b2/installSwakPyFoam)
to pull and install a container and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/7a1f96e605d216e920a865384524cb39dbd1a0b2/startSwakPyFoam)
to run it.

### OpenFOAM v1612+ ###

Use the
scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/89fd00f6a6e9bf12aed73a4de8c303852efacc7b/installSwakPyFoam) to
pull and install a container
and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/89fd00f6a6e9bf12aed73a4de8c303852efacc7b/startSwakPyFoam) to
run it.

It is based on [this container](https://hub.docker.com/r/openfoamplus/of_v1612plus_centos66/)

### OpenFOAM v1606+ ###

Use the
scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/installSwakPyFoam?at=v1606%2B&fileviewer=file-view-default) to
pull and install a container
and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/startSwakPyFoam?at=v1606%2B&fileviewer=file-view-default) to
run it. Inside the container start another bash-shell to get access to
the PyFoam-scripts

It is based on [this container](https://hub.docker.com/r/openfoamplus/of_v1606plus_centos66/)

### OpenFOAM 5.0 ###

The script to pull and start a container is
[swakPyFoam-of5.0-linux](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/72ea4ab8d3c950fd1cdfa1adc98e3e66666366cb/swakPyFoam-of5.0-linux)

It is based on [this container](https://hub.docker.com/r/openfoam/openfoam5-paraview54/)

### OpenFOAM 4.1 ###

The script to pull and start a container
is
[swakPyFoam-of4.1-linux](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/0e9ee387c001d3f87561b5973bb57a1169cde18c/swakPyFoam-of4.1-linux)

It is based on [this container](https://hub.docker.com/r/openfoam/openfoam4-paraview50/)

## General ##

**Alert:** On machines used by multiple users other users can access
the HOME of the user who started the container when attaching to
it. Modify installSwakPyFoam to attach to a different directory to
avoid this

This docker container is still in development
