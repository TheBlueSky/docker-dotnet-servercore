# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/68dbbf28-d2e1-4c08-b7ac-d990145da30d/d7ecd369a082efeff6eeb13b18c64c51/aspnetcore-runtime-2.1.17-win-x64.exe" -OutFile "C:\aspnetcore-runtime.exe"; `
    Start-Process -FilePath "C:\aspnetcore-runtime.exe" -ArgumentList "/quiet", "/norestart" -Wait; `
    Remove-Item -Force "C:\aspnetcore-runtime.exe";

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
