FROM openfoamplus/of_v1906_centos73:latest
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
LABEL pyFoamVersion="0.6.10" swak4FoamVersion="0.4.2" pythonVersion="2.7" Version="0.5"
RUN yum clean all && yum install -y epel-release
RUN yum clean all && yum install -y python2-pip mercurial numpy
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1906.sh && pip install PyFoam==0.6.10"
RUN yum clean all && yum install -y python36-devel
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r compile/v1906
WORKDIR /opt/swak4Foam
RUN yum clean all && yum install -y readline-devel unzip
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1906.sh && ./maintainanceScripts/compileRequirements.sh"
RUN cp swakConfiguration.automatic swakConfiguration
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1906.sh && (export WM_NCOMPPROCS=1 ; ./Allwmake)"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1906.sh && ./maintainanceScripts/copySwakFilesToSite.sh"
RUN mkdir -p /etc/pyFoam/pyfoamrc.d
COPY pyFoamSearchPath.cfg /etc/pyFoam/pyfoamrc.d/
COPY setImage_v1906+swakPyFoam /opt/swak4Foam
