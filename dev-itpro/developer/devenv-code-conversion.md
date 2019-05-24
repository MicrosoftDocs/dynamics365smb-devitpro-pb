---
title: "Code Conversion from C/AL to AL"
description: "Description of the conversion process from C/AL to AL."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2019
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Code Conversion from C/AL to AL (Draft)

> [!IMPORTANT]  
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

With the recent preview release of the base application converted to AL, you can now preview converting your existing C/AL code-customized on-prem solution to an AL code-customized on-prem solution as well. Below outlines the steps involved to do so. Please notice that this is just to test out the conversion; running a modified base application on AL in production is not yet supported. Before venturing into this, we recommend getting familiar with the basics of setting up and developing in Visual Studio Code and AL, see [Developing Extensions in AL](devenv-dev-overview.md). 

> [!NOTE]  
> Moving on-premise C/AL code customizations to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] online, requires converting these to AL extensions. This could include converting the C/AL deltas to AL extension code as a starting point, as outlined in [The Txt2Al Conversion Tool](devenv-txt2al-tool.md). 

## To run a code conversion from C/AL to AL

### 1. Compile all the objects in your C/AL solution
Compiling all the objects is a prerequisite for a successful and complete export. To compile objects, you can use:  
- The classic C/SIDE [Compiling Objects](../cside/cside-compiling-objects.md), or the  
- [Compile-NAVApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/compile-navapplicationobject?view=businesscentral-psPowerShell) cmdlet.

### 2. Export the application from the database to the new TXT syntax
Once the application compiles, you must export all C/AL application objects to the new TXT format, that can be used as input to the conversion tool. To do so, use the [Export-NAVApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/export-navapplicationobject?view=businesscentral-ps) PowerShell cmdlet with the `ExportToNewSyntax` switch.

### 3. Convert the C/AL TXT files to AL
With C/AL exported to the new TXT format, you now convert the code to AL using the [The Txt2Al Conversion Tool](devenv-txt2al-tool.md). 

**Note** that if your solution contains .NET interoperability code, the following Txt2Al command line parameters should be used to achieve a conversion that requires less manual intervention:  

- ```--dotNetAddInsPackage``` should be used to point the conversion tool to an AL file containing declarations for the .NET types that represent .NET control addins. The file should be similar to: 

``` 

dotnet 

{ 
    assembly("Microsoft.Dynamics.Nav.Client.BusinessChart") 
    { 
        type("Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartAddIn";"Microsoft.Dynamics.Nav.Client.BusinessChart") 
        { 
            IsControlAddIn = true; 
        } 

        // Other control add-ins in this assembly 
    } 

    // Other assemblies containing control add ins 
}  

``` 

- ```--dotNetTypePrefix``` should be used to specify a prefix for all the .NET type aliases created by the conversion tool. In AL, .NET type declarations are in the global namespace, and this will prevent conflicts between different solutions.

If you are interested in migrating your localization resources, you should use the ```--addLegacyTranslationInfo``` switch to instruct Txt2Al to generate information about the legacy IDs of the translation code. 

### 4. Create and set up an AL project in Visual Studio Code
If you haven't already, install Visual Studio Code and the AL Language extension, and create a new AL project for your converted solution. 

- Use the **AL Go!** command as outlined in [Getting Started with AL](devenv-get-started.md). 

- Remove the HelloWorld.al sample file from the project. 

Add a `settings.json` file to your project and add the following settings: 

- `"al.packageCachePath": "./.alpackages"` and point to a folder containing the System.app package. This package contains the symbols for all the system tables and codeunits.

- `"al.assemblyProbingPaths": ["./.netpackages"]` and add all the folders that contain .NET assemblies used by your project.  

- Copy all of the AL files generated in the preview step to the root folder of your project.

> [!NOTE]  
> Adding assemblies to the folders in your assembly probing paths is not automatically detected by the compiler. You must restart Visual Studio Code for the changes to be detected. 

### 5. Improve Visual Studio Code editing experience performance
Visual Studio Code is built to handle many smaller, dependent projects, and not one large project, however, as the base application is not yet split into modules or components that allows managing the code in smaller projects, we recommend the following performance optimizations.

Open your `settings.json` file in the project (or global settings if you prefer that). Set:

- `"al.enableCodeAnalysis": false` to remove code analysis, read more here [Using the Code Analysis Tool](devenv-using-code-analysis-tool.md).

- `"al.enableCodeActions": false`

- `"editor.codeLens": false` to remove code lens in Visual Studio Code, see [Code Navigation](https://code.visualstudio.com/Docs/editor/editingevolved#_reference-information).

- Add the build folder to the exclusion list for [Windows Defender](https://support.microsoft.com/en-us/help/4028485/windows-10-add-an-exclusion-to-windows-security).

### 6. Compile your project in Visual Studio Code
The AL compiler is more strict than the C/SIDE compiler and will issue errors for constructs that are not valid. We recommend that you fix the errors in the C/AL solution and re-export, iterating over steps 1-4 above until all the compilation errors are fixed.

### 7. Publish your project
When your converted solutions compile to an app, you can deploy and run it. You can either create and publish to your own database, or use the recently release Docker AL Preview image.

#### 7.1 Publishing the AL solution to an empty database 

1. Use the [Create-NAVDatabase](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/create-navdatabase?view=businesscentral-ps) cmdlet to create a new database.

2. Create a new service instance and connect it to the newly created database. 

3. Use the [Publish-NAVApp](https://docs.microsoft.com/en-us/powershell/module/Microsoft.Dynamics.Nav.Apps.Management/Publish-NAVApp?view=businesscentral-ps) cmdlet to publish the System.app by specifying `-PackageType SymbolsOnly`.

4. Add any custom .NET assemblies to your service's Add-Ins folder or create symbolic links in the Add-Ins folder pointing to the folders in your project's `assemblyProbingPaths`. 

5. Publish your extension, either using:  

- PowerShell cmdlets as described in [Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md), or  

- Publish from within Visual Studio Code by defining the server configuration in launch.json and publish with **Ctrl+F5**. 

#### 7.2 Publishing to a Docker AL Preview image
We recently released a Docker AL Preview image as part of the Insider program, containing the BaseApp published as an extension. You can use this to deploy your own modified AL application.

1. Uninstall and unpublish the BaseApp extension and any other extensions that might depend on it. 

2. Add any custom .NET assemblies to your service's Add-Ins folder or create symbolic links in the Add-Ins folder pointing to the folders in your project's `assemblyProbingPaths`. 

3. Publish your extension: 

    - Using the PowerShell cmdlets as described in [Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md). 

    - Publish from within Visual Studio Code by defining the server configuration in `launch.json` and publish with **Ctrl+F5**. 

## See Also
[The Txt2Al Conversion Tool](devenv-txt2al-tool.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Report Object](devenv-report-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)