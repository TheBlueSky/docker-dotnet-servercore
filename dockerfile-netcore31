# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/4b970ea4-cae6-4e36-a0a1-86a7efa9958e/0633df1e7f959795278c0c55afc2daa3/aspnetcore-runtime-3.1.3-win-x64.exe" -OutFile "C:\aspnetcore-runtime.exe"; `
    Start-Process -FilePath "C:\aspnetcore-runtime.exe" -ArgumentList "/quiet", "/norestart" -Wait; `
    Remove-Item -Force "C:\aspnetcore-runtime.exe";

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 `
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true
