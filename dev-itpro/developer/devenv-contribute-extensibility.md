---
title: Contribute your extensibility scenarios
description: Learn about how to contribute to the different repositories that contain the business application.
author: 
ms.topic: conceptual
ms.author: 
ms.date: 18/02/2025
ms.reviewer: 
---

# Contribute your extensibility scenarios

Our AL codebase contains many scenarios that you can extend that cover a diverse set of needs for several kinds of businesses. However, if you have found a scenario that is not covered in our extensibility offerings, either by missing events or interfaces, you can contribute yourself to our codebase.

Our business application is open source, and the code can be accessed in three different places:
- [BCApps](https://github.com/microsoft/BCapps) This repository contains modules for the System Application and the Business Foundation.
- [ALAppExtensions](https://github.com/microsoft/ALAppExtensions) This repository contains the rest of the 1st party applications.
- [BaseApp](https://askjesperTODO) This repository 

## Contribute to BCApps
 
BCApps is being used directly in our builds. Read the guidelines to contribute in https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.


## Contribute to ALAppExtensions

ALAppExtensions is not being used directly in our builds, but we have a process to accept pull requests made to the master branch of this repository.


## Extensibility requests

If the extensibility scenario you are missing is for an app in BCApps, the only supported way of requesting changes is through direct contributions in the GitHub repository. If your extensibility scenario is targeting AL applications in ALAppExtensions or BaseApp, we can help with your extensibility scenario by creating a extensibility request. Be aware that these requests will take longer to process.

Extensibility requests are tracked as issues in the [ALAppExtensions](https://github.com/microsoft/ALAppExtensions/issues) repository. Please follow the [guidelines](developer/devenv-guidelines-extensibility.md) to create an extensibility request that we can process.
