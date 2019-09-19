FROM mcr.microsoft.com/dotnet/core/sdk:2.2
ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV CHOKIDAR_USEPOLLING=true
EXPOSE 80

WORKDIR /vsdbg

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://aka.ms/getvsdbgsh \
    | bash /dev/stdin -v latest -l /vsdbg \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \ 
    && apt-get install -y nodejs 

RUN mkdir -p /src
WORKDIR /src

COPY . .
RUN dotnet restore cwidojo.csproj
ENTRYPOINT dotnet run --urls=http://+:80