FROM openfoamplus/of_v1606plus_centos66:latest
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
RUN yum install -y sudo epel-release
RUN yum install -y python-pip numpy mercurial python-devel
RUN pip install PyFoam
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r ca9c39ba2e5e
WORKDIR /opt/swak4Foam
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./maintainanceScripts/compileRequirements.sh"
RUN cp swakConfiguration.centos6 swakConfiguration
RUN sed -e"s/)().fvcD2dt2(vf);/).ref().fvcD2dt2(vf);/" -e "s/)().fvcD2dt2(rho, vf);/).ref().fvcD2dt2(rho, vf);/" /opt/OpenFOAM/OpenFOAM-v1606+/src/finiteVolume/finiteVolume/fvc/fvcD2dt2.C -i.bak
RUN sed -e "/    Field<Type>& res = tres();/c\    Field<Type>& res = tres.ref();" /opt/OpenFOAM/OpenFOAM-v1606+/src/finiteVolume/fvMatrices/fvMatrix/fvMatrixSolve.C -i.bak
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./Allwmake"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./maintainanceScripts/copySwakFilesToSite.sh"
