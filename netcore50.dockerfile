# escape=`

# installer Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/7683a95e-1336-4f8b-a3a0-21f6dab44138/9248f166869d1906a6e37a80e81b7b16/aspnetcore-runtime-5.0.0-preview.3.20215.14-win-x64.zip" -OutFile "C:\aspnetcore-runtime.zip"; `
    Expand-Archive "C:\aspnetcore-runtime.zip" -DestinationPath "C:\dotnet"; `
    Remove-Item -Force "C:\aspnetcore-runtime.zip";

# final Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS final

COPY --from=installer ["C:\\dotnet", "C:\\Program Files\\dotnet"]

# In order to set system PATH, ContainerAdministrator must be used
USER ContainerAdministrator
RUN setx PATH "%PATH%;C:\Program Files\dotnet" /m
USER ContainerUser

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
