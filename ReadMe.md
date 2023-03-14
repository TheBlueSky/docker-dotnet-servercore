# Docker Images for ASP.NET Core runtime on Windows Server Core 2019 LTSC

## Available tags

- `latest`: The latest ASP.NET Core runtime Current (the most recent stable) release on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `latest-lts`: The latest ASP.NET Core runtime LTS (Log-Term Support) release on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `lts`: The second latest ASP.NET Core runtime LTS (Log-Term Support) release on Windows Server Core 2019 LTSC (Long-Term Servicing Channel). If there is no second latest release, this will be the same as `latest-lts`.
- `sts`: The latest ASP.NET Core runtime STS (Standard Term Support) release on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `preview`: The latest ASP.NET Core runtime Preview release on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `2.1-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 2.1 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `2.2-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 2.2 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `3.0-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 3.0 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `3.1-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 3.1 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `5.0-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 5.0 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `6.0-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 6.0 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `7.0-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 7.0 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).
- `8.0-aspnetcore-runtime-ltsc2019`: The latest ASP.NET Core 8.0 runtime on Windows Server Core 2019 LTSC (Long-Term Servicing Channel).

## About the images

Microsoft provides plenty of images for .NET Core and ASP.NET Core, both runtime and SDK images. Those images, however, are built on top of Linux and Windows Nano Server base images only.

The images in this repo, however, are built on top of Windows Server Core base image to enable the scenario where the application requires some Windows component that is not available on Windows Nano Server.
