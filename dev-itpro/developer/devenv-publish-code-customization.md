---
title: "Publishing a Code-Customized Base Application"
description: "Description of the process of publishing a code customization for Dynamics 365 Business Central on-prem"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Publishing a Code-Customized Base Application for Business Central On-Prem

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

This topic describes the steps and development environment configuration settings that are needed in order to customize the Base Application code in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] on-prem and publish the code-customized Base Application to the local server. 

> [!IMPORTANT]  
> Instead of code-customizing the Base Application, it is *strongly* recommended to create extensions whenever possible.

## Prerequisites
Make sure to have the following prerequisites installed to be able to follow the steps in this topic.

- [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] on-prem with the AL Development environment option installed.
- Visual Studio Code.
- The AL Language extension.

## To publish a code customization for Business Central on-prem

1. Get the Base Application source from the `/Applications/BaseApp/Source` folder on the DVD.
2. Unzip the *BaseApplication.source.zip* file and open the source folder in Visual Studio Code. This folder contains all of the base application objects and an `app.json` file with the settings enabled for `OnPrem`.
3. Next, download symbols for the Base Application using **Ctrl+Shift+P** and then choose **Download Symbols**. 
3. Customize the Base Application. In this example, we will just modify the text in the **Name** field on the **Customer Card** page to be **Strong**. So, in the `CustomerCard.Page.al` file, we specify the following extra line of code:
    ```
    ...
    field(Name; Name)
    {
        ApplicationArea = All;
        Importance = Promoted;
        ShowMandatory = true;

        Style = Strong;       // Show name in bold
        
        ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer.';

        trigger OnValidate()
        begin
            CurrPage.SaveRecord;
        end;
    }
    ...
    ```
4. Use the [!INCLUDE[prodshort](../includes/prodshort.md)] Administration Console to ensure that the settings for developing for on-premises are correctly set. On the **Development** tab these must be: 
    - **Allowed Extension Target Level** is set to **OnPrem**.
    - **Enable Developer Service Endpoint** checkbox is selected.
5. Now, you must configure your `launch.json` file settings to the local server. For more information, see [JSON Files](devenv-json-files.md).
6. In the `app.json` file, in the `dependencies` section, make sure that `version` is set to the version of the System Application found in the project under `.alpackages`. For example:
    ```
    "dependencies": [
        {
        "appId": "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
        "publisher": "Microsoft",
        "name": "System Application",
        "version": "16.0.10037.0"
        }
    ],
    ```

8. Configure **User Settings** or **Workspace Settings** to include the following paths for the `"al.assemblyProbingPaths"` setting. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).

    ```
    "al.assemblyProbingPaths": [
        "C:\\Program Files\\Microsoft Dynamics 365 Business Central\\150",
        "C:\\Program Files (x86)\\Microsoft Dynamics 365 Business Central\\150",
        "C:\\Program Files (x86)\\Reference Assemblies\\Microsoft\\Framework\\.NETFramework\\v4.7.2",
        "C:\\Program Files (x86)\\Reference Assemblies\\Microsoft\\WindowsPowerShell"
    ],        
    ```
9. For improved performance when working with a large project like the Base Application, see the [Optimize Visual Studio Code Editing and Building Performance](devenv-optimize-visual-studio-code.md) topic.

10. If you now try to publish the extension from Visual Studio Code you will get the following error:

    `The request for path /BC150/dev/apps?SchemaUpdateMode=synchronize&DependencyPublishingOption=ignore failed with code 422. Reason: The extension could not be deployed because it is already deployed on another tenant.`

    The extensions are installed in the global scope. If you want to publish an extension from Visual Studio Code, within the developer scope, you will have to first uninstall and then unpublish the extensions from the command line.

    Ideally, you should uninstall the application that you want to update and all its dependencies. To uninstall the Base Application use the following cmdlet:<br>
    `Uninstall-NavApp -Name "Base Application" -ServerInstance BC150 -Force`

    Use the `-Force` parameter to uninstall all dependencies.

    Alternatively, uninstall everything using the following cmdlet.

    `Get-NAVAppInfo -ServerInstance BC150 | %{Uninstall-NAVApp -Name $_.Name -ServerInstance BC150 -Force}`

11. The next step is to first unpublish the application that we want to publish and all of its dependencies.

    `Unpublish-NavApp -Name "Base Application" -ServerInstance BC150`

    This can give an error regarding dependencies on the Base Application. To solve this, you must unpublish all the applications with dependencies on the Base Application.

    A script like the following is useful for unpublishing the app and all of its dependencies. For example, use Windows PowerShell ISE to create a new script with the following lines of code:

    ```
    function UnpublishAppAndDependencies($ServerInstance, $ApplicationName)
    {
         Get-NAVAppInfo -ServerInstance $ServerInstance | Where-Object { 
        # If the dependencies of this extension include the application that we want to unpublish, it means we have to unpublish this application first.
        (Get-NavAppInfo -ServerInstance $ServerInstance -Name $_.Name).Dependencies | Where-Object {$_.Name -eq $ApplicationName}
     } | ForEach-Object {
        UnpublishAppAndDependencies $ServerInstance $_.Name
     }

     Unpublish-NavApp -ServerInstance $ServerInstance -Name $ApplicationName
    }

    function UninstallAndUnpublish($ServerInstance, $ApplicationName)
    {
        Uninstall-NavApp -ServerInstance $ServerInstance -Name $ApplicationName -Force
        UnpublishAppAndDependencies $ServerInstance  $ApplicationName
    
    }
    ```
12. Run the script you created in step 11 to handle the uninstall and unpublishing of the Base Application and dependencies.
13. Use `"dependencyPublishingOption": "Ignore"` in the `launch.json` file to only publish this extension. For more information, see [JSON Files](devenv-json-files.md).

14. Import a license with rights to publish the extension. For example:  
    ```
    Import-NAVServerLicense -ServerInstance BC150 -LicenseFile "C:\Users\mylicense.flf"
    ```

15. Press **Ctrl+F5** to publish the modified Base Application as an extension from Visual Studio Code.

The Base Application is now published with the small customization of bolding the text in the name field on the Customer Card.

## See Also

[Unpublishing and Uninstalling Extensions](devenv-unpublish-and-uninstall-extension-v2.md)  
[Developing Extensions](devenv-dev-overview.md)
