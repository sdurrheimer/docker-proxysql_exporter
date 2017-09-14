FROM  quay.io/prometheus/busybox:latest
LABEL maintainer "Steve Durrheimer <s.durrheimer@gmail.com>"

ENV PROXYSQL_EXPORTER_VERSION=1.1.0
RUN set -x \
    && wget -qO- https://github.com/percona/proxysql_exporter/releases/download/v${PROXYSQL_EXPORTER_VERSION}/proxysql_exporter-${PROXYSQL_EXPORTER_VERSION}.linux-amd64.tar.gz | tar xvz --strip-components=1 -C /bin proxysql_exporter-${PROXYSQL_EXPORTER_VERSION}.linux-amd64/proxysql_exporter

EXPOSE      42004
ENTRYPOINT  [ "/bin/proxysql_exporter" ]
