FROM openfoam/openfoam6-paraview54:6
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
LABEL pyFoamVersion="0.6.9" swak4FoamVersion="0.4.2-dev" pythonVersion="2.7" Version="0.6"
USER root
RUN whoami
RUN apt-get update
RUN apt-get --yes install python-pip mercurial python-numpy ipython python-ipdb python-pandas python-xlsxwriter python-xlwt python-xlrd
RUN pip install PyFoam
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r develop
RUN chown -R openfoam:openfoam swak4Foam
RUN apt-get --yes install unzip python3.5-dev python3.5-numpy
USER openfoam
WORKDIR /opt/swak4Foam
RUN cp swakConfiguration.automatic  /opt/swak4Foam/swakConfiguration
RUN bash -c "source /opt/openfoam6/etc/bashrc &&  ./maintainanceScripts/compileRequirements.sh"
RUN bash -c "source /opt/openfoam6/etc/bashrc && ./Allwmake"
USER root
RUN mkdir -p /opt/site/6/platforms/linux64GccDPInt32Opt/bin
RUN mkdir /opt/site/6/platforms/linux64GccDPInt32Opt/lib
RUN chown openfoam:openfoam /opt/site/6/platforms/linux64GccDPInt32Opt/*
USER openfoam
RUN bash -c "source /opt/openfoam6/etc/bashrc &&  ./maintainanceScripts/copySwakFilesToSite.sh"
