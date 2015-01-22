#
# Haproxy-Confd Dockerfile
#
# https://github.com/treehau5/haproxy-confd
# 
# Dimitrios Arethas
#
# relies on https://github.com/dockerfile/haproxy

# Pull base image.
FROM dockerfile/haproxy

# Install Confd to bin directory (hopefully it's in the path)
RUN wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 && \
  mv confd /usr/local/bin/ && \
  chmod +x /usr/local/bin/confd

RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

# Add files.
ADD start.bash /haproxy-confd-start
ADD haproxy.tmpl /etc/confd/templates/haproxy.tmpl
ADD haproxy.toml /etc/confd/conf.d/haproxy.tmpl

# Define mountable directories.
VOLUME ["/haproxy-override"]
VOLUME ["/confd-override"]

# Define working directory.
WORKDIR /etc/haproxy

# Define default command.
CMD ["bash", "/haproxy-confd-start"]

# Expose ports.
EXPOSE 80
EXPOSE 443
