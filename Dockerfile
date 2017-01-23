FROM openfoamplus/of_v1612plus_centos66:latest
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
LABEL pyFoamVersion="0.6.6" swak4FoamVersion="0.4.1" pythonVersion="2.7" Version="0.3"
RUN yum clean all && yum install -y epel-release
RUN yum clean all && yum install -y centos-release-SCL
RUN yum clean all && yum install -y python27 python-devel python27-python-pip python27-numpy
# RUN yum clean all && yum install -y libpng-devel freetype-devel # Fails on DockerHub
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && scl enable python27 'pip install PyFoam xlsxwriter xlwt xlrd mercurial pandas jupyter matplotlib'"
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && scl enable python27 'pip install PyFoam xlsxwriter xlwt xlrd mercurial pandas jupyter'"
# RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && scl enable python27 'pip install PyFoam Cython xlsxwriter xlwt xlrd mercurial pandas jupyter'"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && scl enable python27 'pip install PyFoam mercurial'"
WORKDIR /opt
RUN scl enable python27 'hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r c9837ed062dc'
WORKDIR /opt/swak4Foam
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && ./maintainanceScripts/compileRequirements.sh"
COPY swakConfiguration.centos6python27  /opt/swak4Foam/swakConfiguration
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && (export WM_NCOMPPROCS=1 ; scl enable python27 './Allwmake')"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1612+ && ./maintainanceScripts/copySwakFilesToSite.sh"
RUN mkdir -p /etc/pyFoam/pyfoamrc.d
COPY pyFoamSearchPath.cfg /etc/pyFoam/pyfoamrc.d/
COPY enablePython27.sh /etc/profile.d/
