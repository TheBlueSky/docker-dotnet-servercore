# escape=`

# installer Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/78e8f825-af52-4586-84c6-59f49c6d9f59/e5cd0846317d3afff9e695e33bb1408c/aspnetcore-runtime-3.1.12-win-x64.zip" -OutFile "C:\aspnetcore-runtime.zip"; `
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
