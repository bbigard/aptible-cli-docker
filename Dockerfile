FROM debian:8.11

# Found at: https://www.aptible.com/documentation/deploy/cli.html
ENV URL "https://omnibus-aptible-toolbelt.s3.amazonaws.com/aptible/omnibus-aptible-toolbelt/master/194/pkg/aptible-toolbelt_0.16.3%2B20191024181402~debian.8.10-1_amd64.deb"

RUN apt-get update \
    && apt-get install -y curl \
    && curl -o aptible-cli.deb "$URL" \
    && dpkg -i aptible-cli.deb \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f aptible-cli.deb

ENTRYPOINT ["aptible"]
CMD ["version"]
