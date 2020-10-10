FROM alpine:3.12.0

LABEL maintainer=vikas@reachvikas.com

ARG OCTANT_VERSION=0.16.1

RUN wget -O /tmp/octant.tar.gz "https://github.com/vmware-tanzu/octant/releases/download/v${OCTANT_VERSION}/octant_${OCTANT_VERSION}_Linux-64bit.tar.gz" && \
    tar xf /tmp/octant.tar.gz -C /tmp && \
    mv -v /tmp/octant_${OCTANT_VERSION}_Linux-64bit/octant /usr/local/bin/ && \
    rm -rf /tmp/* /var/cache/apk/*

CMD OCTANT_LISTENER_ADDR=0.0.0.0:80 /usr/local/bin/octant --kubeconfig ./.kube/config --disable-open-browser
