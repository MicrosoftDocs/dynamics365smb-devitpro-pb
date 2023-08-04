---
title: Generating help with the ALDoc tool
description: This article describes how to download and use the ALDoc tool to generate reference help for first party apps for Business Central. 
author: 
ms.topic: conceptual
ms.reviewer: solsen
ms.date: 08/03/2023
ms.author: solsen
ms.custom: bap-template
---

# Generating help with the ALDoc tool

[!INCLUDE [2023rw2_aldoctool_preview](../developer/includes/2023rw2_aldoctool_preview.md)]

Generating content based on source code has many advantages such as accuracy, 100% reflection of the current codebase, less error prone documentation, and it saves time. The ALDoc tool generates documentation from symbolic and syntactical information, code comments, and overall application structure based on input .app file(s). The tool also generates a help site with these reference articles, sorted by the application structure, based on the provided template.

This article describes the necessary steps to use the ALDoc tool to generate the documentation for AL .app packages. To generate help using the ALDoc tool, the following steps are involved: 

* Install .NET and DocFx prerequisites
* Get the ALDoc tool from the .vsix file
* Generate the reference documentation files
* Build a static web site for the generated documentation

## Prerequisites

The following prerequisites must be available on your machine to use the ALDoc tool to generate reference documentation.

- A .NET 6.0 version or higher. For more information, see [Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/download).
- DocFx

### Checking your .NET version

It's recommended to use .NET 6.0 or higher. Use the following command to check your local dotnet version. For example:

```bash
dotnet --list-sdks

# will print the following message
# 3.1.426 [C:\\Program Files\\dotnet\\sdk]
# 6.0.112 [C:\\Program Files\\dotnet\\sdk]
# 6.0.307 [C:\\Program Files\\dotnet\\sdk]
# 7.0.101 [C:\\Program Files\\dotnet\\sdk]
```

If you don't have .NET 6.0 installed, you can download it from here [Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/en-us/download).

### DocFx

It's recommended to install the DocFx tool that comes with .NET. For more information, see [Getting Started with DocFX](https://dotnet.github.io/docfx/index.html).

1. Start a command line tool as administrator, and run the following command to install the .NET DocFx tool:  
    ```bash
    dotnet tool update -g docfx
    ```

After the installation is complete, you now have the latest version of the DocFx tool on your machine.

## Get the ALDoc tool

The ALDoc tool is shipped with the [!INCLUDE [d365al_ext_md](../includes/d365al_ext_md.md)], and can be found in the equivalent location of:  

```
C:\Users\<user>\.vscode\extensions\ms-dynamics-smb.al-12.0.836604\bin\win32\aldoc.exe
```

## Generate reference

When all prerequisites have been successfully installed, the next step is to use the ALDoc tool to generate the documentation files. For this, you must have the .app files that you want to generate documentation for available on your machine. You also need to have a folder available where the generated files can be placed.

1. First, you must initialize the reference repo by providing the following command. The initialization unpacks AL support files, and creates the input folder for the DocFx tool including the DocFx configuration file (docfx.json).  

    ```bash
     {path_to_aldoc}\\aldoc.exe init -o .\\{path-to-generated-content}\\ -t '{path_to_package1}','{path_to_package2}',...,'{path_to_package3}'
     
     # Example
     .\\aldoc\\aldoc.exe init -o .\\mypath\\ -t 'F:\\AL\\.alpackages\\Microsoft_System Application_23.0.00000.00000.app'
    ```

2. Next, generate the reference files for each .app file that you specified in the previous step. The `build` command must be run for each .app file that you want to generate documentation for. Furthermore, it's important for the cross references that the `build` command has access to the complete set of .app files that you intend to generate documentation. You specify these files with the `-c` parameter.

    ```bash
     {path_to_aldoc}\\repo\\out\\Debug\\aldoc\\net{version}\\aldoc.exe build -o .\\{path-to-generated-content}\\ -c '{path_to_package1}','{path_to_package2}',...,'{path_to_package3}' -s {path_to_package}
     # Example - <!-- use c param too -->
     .\\development\\aldoc.exe build -o .\\mypath\\ -c 'c:\\my_path_package1','c:\\my_path_package2',...,'c:\\my_path_package3' -s 'F:\\AL\\.alpackages\\Microsoft_System Application_23.0.00000.00000.app'
    ```

Next, you can use the DocFx tool to build and host the static website.

## Build and host the static website

In the previous steps, the reference files were generated. You can now use DocFx to build a website to host the generated files. 

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

## Overwriting help with the ALDoc tool

Some areas of autogenerated content work as they are, giving information about syntax, showing any code comments, and displaying the overall application structure. But some areas of the autogenerated content might need more information, guidance, or remarks to add value. The ALDoc tool supports *overwrites* of the autogenerated articles. An *overwrite* file contains content that is injected into autogenerated content and it doesn't overwrite autogenerated content. For more information, see [Overwriting help with the ALDoc tool](help-aldoc-overwrites.md).

## See also

[Authoring guide for Business Central](writing-guide.md)  
[Overwriting help with the ALDoc tool](help-aldoc-overwrites.md)  
[Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/download)  
[Getting Started with DocFX](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html)  