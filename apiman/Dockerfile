FROM jboss/wildfly:10.0.0.Final

MAINTAINER webalexx <webalexx@gmail.com>


 ENV APIMAN_VERSION 1.2.9.Final


# Load and deploy apiman
 RUN cd $JBOSS_HOME \
  && curl http://downloads.jboss.org/overlord/apiman/$APIMAN_VERSION/apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip -o apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip \
  && bsdtar -xf apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip \
  && rm apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip


#RUN cd $JBOSS_HOME \
# && curl http://downloads.jboss.org/apiman/$APIMAN_VERSION/apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip | bsdtar -xvf-
 
 
# Add default user
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent



# Apiman properties
ADD files/apiman.properties $JBOSS_HOME/standalone/configuration/
RUN  sed -i -e 's/H2Dialect/PostgreSQLDialect/g' $JBOSS_HOME/standalone/configuration/standalone-apiman.xml


# SSL
ADD apiman.jks $JBOSS_HOME/standalone/configuration/


# Postgres
ADD files/postgresql-9.4-1201-jdbc41.jar $JBOSS_HOME/standalone/deployments


# Add apiman-ds.xml.xml
ADD files/apiman-ds.xml $JBOSS_HOME/standalone/deployments


# Add standalone-apiman.xml
ADD files/standalone-apiman.xml $JBOSS_HOME/standalone/configuration/

# Disable builtin Elasticsearch
RUN rm -f $JBOSS_HOME/standalone/deployments/apiman-es*


# Default wildfly debug port  
EXPOSE 8787


ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apiman.xml"]
#CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apiman.xml", "--debug"]

