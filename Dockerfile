FROM ubuntu:jammy as build

WORKDIR /root
COPY setup.sh .
RUN ./setup.sh

FROM scratch
# TODO: use --parents flag once it is in the stable syntax:
# https://docs.docker.com/reference/dockerfile/#copy---parents
COPY --from=build /usr/local/bin/nvim /usr/local/bin
COPY --from=build /usr/local/lib/nvim/ /usr/local/lib/nvim/
COPY --from=build /usr/local/share/nvim/ /usr/local/share/nvim/
