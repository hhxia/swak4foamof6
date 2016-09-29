# README #

Adds [swak4Foam](https://openfoamwiki.net/index.php/Contrib/swak4Foam)
and [PyFoam](https://openfoamwiki.net/index.php/Contrib/PyFoam) to
Standard OpenFOAM containers. Maintained by the creator of those two
packages.

Currently only supporting OpenFOAM v1606+

[![](https://images.microbadger.com/badges/image/hfdresearch/swak4foamandpyfoam.svg)](https://microbadger.com/images/hfdresearch/swak4foamandpyfoam "Get your own image badge on microbadger.com")

Use the scripts
[installSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/installSwakPyFoam?at=v1606%2B&fileviewer=file-view-default)
to pull and install a container and
[startSwakPyFoam](https://bitbucket.org/bgschaid/swak4foamandpyfoamdockerfile/src/67976d0d86c566e4fc735e0cbf994c48f78c0acf/startSwakPyFoam?at=v1606%2B&fileviewer=file-view-default) to
run it. Inside the container start another bash-shell to get access to
the PyFoam-scripts

**Alert:** On machines used by multiple users other users can access
the HOME of the user who started the container when attaching to
it. Modify installSwakPyFoam to attach to a different directory to
avoid this

This docker container is still in development
