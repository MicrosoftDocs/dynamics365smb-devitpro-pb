---
title: Generating help with the ALDoc tool
description: This article describes how to download, and use the ALDoc tool to generate reference help for first party apps for Business Central. 
author: 
ms.topic: conceptual
ms.reviewer: solsen
ms.date: 08/03/2023
ms.author: solsen
ms.custom: bap-template
---

# Generating help with the ALDoc tool

[!INCLUDE [2023rw2_aldoctool_preview](../developer/includes/2023rw2_aldoctool_preview.md)]

Generating content based on source code has many advantages such as accuracy, 100% reflection of the current codebase, less error prone documentation, and it saves time. The ALDoc tool generates documentation from symbolic and syntactical information, code comments, and overall application structure based on input .app file(s). The tool also generates a help site with these reference articles, sorted by the application structure and based on the provided template.

This article describes the steps to use the tool to generate the documentation for AL .app packages. To generate help using the ALDoc tool, the following steps are involved: 

* Install .NET and DocFx prerequisites
* Install the ALDoc tool from the .vsix file
* Generate the reference documentation files
* Build a static web site for the generated documentation

## Installation prerequisites

The following prerequisites must be available on your machine to generate the reference documentation.

- A .NET 6.0 version or higher (this article uses .NET 6.0)
- <!-- https://dotnet.github.io/docfx/index.html -->
- DocFx v2

The following sections describe how to install these prerequisites.

### Checking your .NET version

It's recommended to use .NET 6.0 or higher. Use the following command to check your local dotnet version:

```bash
dotnet --list-sdks

# will print the following message
# 3.1.426 [C:\\Program Files\\dotnet\\sdk]
# 6.0.112 [C:\\Program Files\\dotnet\\sdk]
# 6.0.307 [C:\\Program Files\\dotnet\\sdk]
# 7.0.101 [C:\\Program Files\\dotnet\\sdk]
```

If you don't have .NET 6.0 installed, you can download it from here [Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/en-us/download).

### DocFx v2

> [!NOTE]  
> The ALDoc tool is currently supported to run with DocFx v2.

It's recommended to install the DocFx tool that comes with .NET. For more information, see [Getting Started with DocFX](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html).

1. Start the command line tool as administrator, and run the following command to install the .NET DocFx tool:  
    ```bash
    dotnet tool update -g docfx
    ```

After the installation is complete, you have the latest version of the DocFx tool on your machine.

## Get the ALDoc tool

The ALDoc tool is shipped with the Business Central AL Language extension (.vsix) <include>, and can be found in the following location: C:\Users\solsen\.vscode\extensions\ms-dynamics-smb.al-12.0.836604\bin\win32 <!-- change -->


## Generate reference

When all prerequisites have been successfully installed, the next step is to use the ALDoc tool to generate the initialization files.

1. First, you must initialize the reference repo, which unpacks AL support files, and creates the input folder for the DocFx tool including the DocFx configuration file (docfx.json). ... provide the following command:  
    ```bash
     {path_to_aldoc}\\aldoc.exe init -o .\\{path-to-generated-content}\\ -t '{path_to_package1}','{path_to_package2}',...,'{path_to_package3}'
     
     # Example
     .\\aldoc\\aldoc.exe init -o .\\test1\\ -t 'F:\\AL\\.alpackages\\Microsoft_System Application_23.00000.app'
    ```

2. Next, generate the reference files for each .app file that you specified in the previous step. The `build` command must be run for each .app file that you want to generate documentation for. Furthermore, it's important for the cross references that the `build` command has access to the complete set of .app files that you intend to generate documentation for by specifying these with the `-c` parameter.

    ```bash
     {path_to_aldoc}\\repo\\out\\Debug\\aldoc\\net{version}\\aldoc.exe build -o .\\{path-to-generated-content}\\ -c '{path_to_package1}','{path_to_package2}',...,'{path_to_package3}' -s {path_to_package}
     # Example - <!-- use c param too -->
     .\\development\\aldoc.exe build -o .\\test1\\  -s 'F:\\AL\\ALProject1\\.alpackages\\Microsoft_System Application_20.1.39764.39901.app'
    ```

Next, you'll use the DocFx tool to build and host the static website.

## Build and host the static website

In the previous steps, the reference files were generated. You'll now use DocFx to build a website to host the generated files. 

1. In the command line, enter a command equivalent to the following:  
    ```bash
    docfx build ./{path-to-generated-content}/docfx.json
    ```
2. Next, to host the website locally, enter a command equivalent to the following:
```bash  
    docfx serve ./{path-to-generated-content}/_site
```
1. Then wait for the build to complete and in a browser window, type `https:\\localhost:8080` to check the generated website.

> [!TIP]  
> Use the parameter `-p <port_num>` to change the port to generate the website to.

For more information about the DocFx tool, see [](https://dotnet.github.io/docfx/index.html).

## Structure of the files

The structure of the files that are generated is as follows:

|Paths and files| Description|
|-----|------------|
|`./override_file`| The default folder to store the files to replace the corresponding content of the autogenerated content.|
|`./reference`| The folder to store the generated content.|
|`./template` | The template of the project, users can modify the `*.css` files inside.|
|`docfx.json`| The configuration file, which is autogenerated.|
|`index.md`| The index file provides a landing page for the help site.|
|`toc.yml`| The table of contents file, which is autogenerated.|

## See also

[Authoring guide for Business Central](writing-guide.md)  
[Overwriting help with the ALDoc tool](help-aldoc-overwrites.md)  
[Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/download)  
[Getting Started with DocFX](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html)  