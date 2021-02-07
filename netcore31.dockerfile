# escape=`

# installer Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/6a85d2fd-8c7c-45d0-9058-e5c9fd7d8cf9/e017c13ab1fda23f2fa11b052c735871/aspnetcore-runtime-3.1.11-win-x64.zip" -OutFile "C:\aspnetcore-runtime.zip"; `
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
