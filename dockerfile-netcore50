# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/fbe8e0a5-7d9b-4cc4-bb16-7166ac5c8caa/3dde80bb4d0e312a418d20ba459b2a88/aspnetcore-runtime-5.0.0-preview.2.20167.3-win-x64.exe" -OutFile "C:\dotnet-hosting-win.exe"; `
    Start-Process -FilePath "C:\dotnet-hosting-win.exe" -ArgumentList "/quiet", "/norestart" -Wait; `
    Remove-Item -Force "C:\dotnet-hosting-win.exe";

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
