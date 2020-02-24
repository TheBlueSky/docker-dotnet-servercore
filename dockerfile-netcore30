# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/207c4791-a366-4d35-96ed-0bbe10a683d3/1ca408df70ca668ea8e8ec36d2aedf48/aspnetcore-runtime-3.0.3-win-x64.exe" -OutFile "C:\dotnet-hosting-win.exe"; `
    Start-Process -FilePath "C:\dotnet-hosting-win.exe" -ArgumentList "/quiet", "/norestart" -Wait; `
    Remove-Item -Force "C:\dotnet-hosting-win.exe";

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
