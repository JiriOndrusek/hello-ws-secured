FROM quay.io/wildfly/wildfly-runtime-jdk11
COPY --chown=jboss:root target/server $JBOSS_HOME
COPY --chown=jboss:root  example-roles.properties /opt/server/standalone/configuration/example-roles.properties
COPY --chown=jboss:root  example-users.properties /opt/server/standalone/configuration/example-users.properties
COPY --chown=jboss:root  config.cli /opt/server/bin/config.cli
RUN /opt/server/bin/jboss-cli.sh --file="/opt/server/bin/config.cli"
RUN chmod -R ug+rwX $JBOSS_HOME
