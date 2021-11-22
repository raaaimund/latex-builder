FROM alpine:3.12.1 AS olddocument

RUN apk update && apk add --no-cache git
ARG PAT
WORKDIR /latex
RUN git clone https://$PAT@github.com/raaaimund/latex-builder

FROM alpine:3.12.1

RUN apk update && apk add --no-cache texlive-full
WORKDIR /expose
COPY --from=olddocument /latex/latex-builder/latex/document/document.tex document.old.tex
COPY ./document .
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]