# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/068d05e8-a0cf-4584-9422-b77f34f1e98e/de70e92721a05c6148619993cbf1376b/aspnetcore-runtime-2.2.8-win-x64.exe" -OutFile "C:\aspnetcore-runtime.exe"; `
    Start-Process -FilePath "C:\aspnetcore-runtime.exe" -ArgumentList "/quiet", "/norestart" -Wait; `
    Remove-Item -Force "C:\aspnetcore-runtime.exe";

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
