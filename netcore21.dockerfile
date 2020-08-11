# escape=`

# installer Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/2fa05cff-91bf-42a0-842e-54859202d23e/655ba086a521e40fc61d955f7ee85e06/aspnetcore-runtime-2.1.21-win-x64.zip" -OutFile "C:\aspnetcore-runtime.zip"; `
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
