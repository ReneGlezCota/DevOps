FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY DockerApplication/DockerApplication/*.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY DockerApplication/. .
RUN dotnet publish -c Release -o /publish

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /publish
COPY --from=build /publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "DockerApplication.dll"]
