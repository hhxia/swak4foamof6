# README #

Adds [swak4Foam](https://openfoamwiki.net/index.php/Contrib/swak4Foam) and [PyFoam](https://openfoamwiki.net/index.php/Contrib/PyFoam) to Standard OpenFOAM docker containers. Maintained by the creator of those two packages.

The sources for these docker containers are on [Bitbucket](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile) and the containers are on [Docker Hub](https://hub.docker.com/r/hfdresearch/swak4foamandpyfoam/)

Currently the latest supported version is OpenFOAM v1612+

[![](https://images.microbadger.com/badges/image/hfdresearch/swak4foamandpyfoam.svg)](https://microbadger.com/images/hfdresearch/swak4foamandpyfoam "Get your own image badge on microbadger.com")

## Installation / Testing ##

A requirement for using these containers is that you have [Docker](https://www.docker.com/) installed

Create a directory for your tests

    mkdir swakTest
    cd swakTest

Now download the files `installSwakPyFoam` and `startSwakPyFoam` from the approptiate links below and copy them to `swakTest`. Then install the container with 
    
    ./installSwakPyFoam

and start the container with

    ./startSwakPyFoam

Now the shell prompt is inside the container. Start a *new* shell with 

    bash

This ensures that the PyFoam-utilities are available. Check with

    funkySetFields
    pyFoamVersion.py

that the utilities are available. To check that everything works do the following

    cd /tmp
    cp -r /opt/swak4Foam/Examples/groovyBC/pulsedPitzDaily .
    cd pulsedPitzDaily
    pyFoamPrepareCase.py .
    pyFoamPlotRunner.py --clear --progress pisoFoam

This should start a run and a number of windows with updating plots should open

## Downloading ##

To get a concrete container download the scripts below

### OpenFOAM v1612+ ###

Use the scripts [installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/69c133458f9085248b649bc071cb41a6c8226651/installSwakPyFoam) to pull and install a container and [startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/raw/69c133458f9085248b649bc071cb41a6c8226651/startSwakPyFoam) to run it. Inside the container start another bash-shell to get access to the PyFoam-scripts


### OpenFOAM v1606+ ###

Use the scripts [installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/installSwakPyFoam?at=v1606%2B&fileviewer=file-view-default) to pull and install a container and [startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/startSwakPyFoam?at=v1606%2B&fileviewer=file-view-default) to run it. Inside the container start another bash-shell to get access to the PyFoam-scripts

## General ##

**Alert:** On machines used by multiple users other users can access the HOME of the user who started the container when attaching to it. Modify installSwakPyFoam to attach to a different directory to avoid this

This docker container is still in development