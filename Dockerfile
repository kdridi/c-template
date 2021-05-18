FROM epitechcontent/epitest-docker
LABEL maintainer="Karim DRIDI <karim.dridi@gmail.com>"

RUN cargo install watchexec

ENTRYPOINT ["/root/.cargo/bin/watchexec", "--exts", "c,h"]