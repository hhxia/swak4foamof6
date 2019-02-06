FROM openfoam/openfoam6-paraview54:6
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
LABEL pyFoamVersion="0.6.10" swak4FoamVersion="0.4.2" pythonVersion="2.7" Version="0.7"
USER root
RUN whoami
RUN apt-get update
RUN apt-get --yes install python-pip mercurial python-numpy ipython python-ipdb python-pandas python-xlsxwriter python-xlwt python-xlrd
RUN pip install PyFoam==0.6.10
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r v0.4.2
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
RUN apt-get --yes install tmux
USER openfoam
RUN bash -c "source /opt/openfoam6/etc/bashrc &&  ./maintainanceScripts/copySwakFilesToSite.sh"
WORKDIR /home/openfoam
ENTRYPOINT /usr/bin/tmux set-option -gs default-command "/bin/sh -c /entry.sh" \; new-session -A -s main
