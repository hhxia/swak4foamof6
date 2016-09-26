FROM openfoamplus/of_v1606plus_centos66:latest
MAINTAINER Bernhard F.W. Gschaider <bgschaid@hfd-research.com>
RUN yum clean all && yum install -y epel-release
RUN yum clean all && yum install -y python-pip numpy mercurial python-devel
RUN pip install PyFoam
WORKDIR /opt
RUN hg clone http://hg.code.sf.net/p/openfoam-extend/swak4Foam -r compile_of4.0_v1606+
WORKDIR /opt/swak4Foam
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./maintainanceScripts/compileRequirements.sh"
RUN cp swakConfiguration.centos6 swakConfiguration
RUN sed -e"s/)().fvcD2dt2(vf);/).ref().fvcD2dt2(vf);/" -e "s/)().fvcD2dt2(rho, vf);/).ref().fvcD2dt2(rho, vf);/" /opt/OpenFOAM/OpenFOAM-v1606+/src/finiteVolume/finiteVolume/fvc/fvcD2dt2.C -i.bak
RUN sed -e "/    Field<Type>& res = tres();/c\    Field<Type>& res = tres.ref();" /opt/OpenFOAM/OpenFOAM-v1606+/src/finiteVolume/fvMatrices/fvMatrix/fvMatrixSolve.C -i.bak
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./Allwmake"
RUN /bin/bash -c "source /opt/OpenFOAM/setImage_v1606+ && ./maintainanceScripts/copySwakFilesToSite.sh"
