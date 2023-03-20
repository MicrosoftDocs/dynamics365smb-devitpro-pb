---
title: Generating help with the ALDoc tool
description: This article describes how to download, and use the ALDoc tool to generate reference help for first party apps for Business Central. 
author: 
ms.topic: conceptual
ms.reviewer: solsen
ms.date: 03/03/2023
ms.author: solsen
ms.custom: bap-template
---

# Generating help with the ALDoc tool

The ALDoc tool generates a help site with reference articles based on .app files. This article describes the steps to use the tool to generate the documents for al packages.

To generate help using the ALDoc tool, the following steps are involved: 

* Clone the repo <!-- internal steps -->
* Install .NET and DocFx v2 prerequisites
* Generate the internal file
* Build and host the project with DocFx v2

## Install prerequisites

### .NET 6.0

The ALDoc tool is based on `dotnet 4.8` or later. It's recommended to use .NET 6.0 or .NET 7.0. Use the following command to check your local dotnet version:

```bash
dotnet --list-sdks

# will print the following message
# 3.1.426 [C:\\Program Files\\dotnet\\sdk]
# 6.0.112 [C:\\Program Files\\dotnet\\sdk]
# 6.0.307 [C:\\Program Files\\dotnet\\sdk]
# 7.0.101 [C:\\Program Files\\dotnet\\sdk]
```

If you don't have .NET 6.0 installed, download it from here [Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/en-us/download).

### DocFx v2

> [!NOTE]  
> The ALDoc tool is currently supported to run with DocFx v2.

There are different ways to install DocFx v2. The following steps describe a suggested way to install the tool. For more information, see [Getting Started with DocFX](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html).

1. Go to [Chocolatey Software | Installing Chocolatey](https://chocolatey.org/install#individual)
2. Run the terminal as `admin` and follow the steps of this page [Chocolatey Software | Installing Chocolatey](https://chocolatey.org/install#individual) to install chocolate.
3. Then, install the DocFx v2 by running the following in the commandline:  
    ```bash
    choco install docfx -y    
    ```

Now, you have successfully installed DocFx v2 on your machine.

## Generate Reference

The next step is to use the ALDoc tool to generate the file for DocFx v2.

1. First, you must init the reference repo, by giving the following command:  
    ```bash
     {Path_to_aldoc}\\aldoc.exe init -o .\\{path-to-dev-appref}\\ -v 2 -t '{path_to_package1}','{path_to_package2}',...,'{path_to_package3}'
     
     # example:
     .\\Platform-ModernDev\\out\\Debug\\aldoc\\net6.0\\aldoc.exe init -o .\\test1\\ -v 2 -t 'F:\\AL\\ALProject1\\.alpackages\\Microsoft_System Application_20.1.39764.39901.app'
    ```

2. Next, generate the reference files by providing the following command, including the path to the .app file (alpackage) that you want to generate help for:  

    ```bash
     {Path_to_Platform}\\Platform-ModernDev\\out\\Debug\\aldoc\\net{version}\\aldoc.exe build -o .\\{path-to-dev-appref}\\  -s {path_to_package}
     # example:
     .\\Devlopment\\aldoc.exe build -o .\\test1\\  -s 'F:\\AL\\ALProject1\\.alpackages\\Microsoft_System Application_20.1.39764.39901.app'
    ```

## Build and host the static website

In the previous steps, the reference files were generated. You'll now use use DocFx v2 to build and host a website. 

1. In the command line, enter the following:  
    ```bash
    docfx build ./{path-to-dev-appref}/docfx.json -s
    ```
2. Then wait for the build to complete and in a browser window, type `https:\\localhost:8080` to check the generated website.

> [!TIP]  
> Use the parameter `-p <port_num>` to change the port to generate the website to.

## Structure of the files

The structure of the files that are generated is as follows:

|Paths and files| Description|
|-----|------------|
|`./override_file`| Default folder to store the files to replace the corresponding content of the auto-generated content.|
|`./reference`| Folder to store the generated content.|
|`./template` | Template of the project, users can modify the `*.css` files inside.|
|`docfx.json`| Configuration file, which is auto-generated.|
|`index.md`| Index file, providing a landing page for the help site.|
|`toc.yml`| The table of contents file, which is auto-generated.|

## See also

[Overwriting help with the ALDoc tool](help-aldoc-overwrites.md)