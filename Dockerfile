FROM openfoamplus/of_v1706_centos73:latest
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
LABEL pyFoamVersion="0.6.8" swak4FoamVersion="0.4.2-dev" pythonVersion="2.7" Version="0.3"
RUN yum clean all && yum install -y epel-release
RUN yum clean all && yum install -y python2-pip mercurial numpy
# RUN yum clean all && yum install -y centos-release-SCL
# RUN yum clean all && yum install -y libpng-devel freetype-devel # Fails on DockerHub
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && scl enable python27 'pip install PyFoam xlsxwriter xlwt xlrd mercurial pandas jupyter matplotlib'"
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && scl enable python27 'pip install PyFoam xlsxwriter xlwt xlrd mercurial pandas jupyter'"
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && scl enable python27 'pip install PyFoam Cython xlsxwriter xlwt xlrd mercurial pandas jupyter'"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && pip install PyFoam"
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r compile_v17706+
WORKDIR /opt/swak4Foam
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && ./maintainanceScripts/compileRequirements.sh"
RUN cp swakConfiguration.automatic swakConfiguration
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && (export WM_NCOMPPROCS=1 ; ./Allwmake)"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1706.sh && ./maintainanceScripts/copySwakFilesToSite.sh"
RUN mkdir -p /etc/pyFoam/pyfoamrc.d
COPY pyFoamSearchPath.cfg /etc/pyFoam/pyfoamrc.d/
COPY setImage_v1706+swakPyFoam /opt/swak4Foam
