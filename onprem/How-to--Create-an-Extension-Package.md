---
title: Create Extension Package
description: When you developed a Dynamics NAV extension, the next step is to wrap your new .TXT and .DELTA files into a .NAVX file, the packageing format for extensions. 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c3403c71-52c4-4cd9-a8c4-22499bd78cd1
ms.author: solsen
---

# Creating an Extension Package in Dynamics NAV
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

When you have developed a [!INCLUDE[navnow](includes/navnow_md.md)] extension, the next step is to wrap your new .TXT and .DELTA files into a .NAVX file, the packaging format for extensions. The package includes the application objects and metadata that describes your extension, such as name and version.  

### To create the extension manifest  

The extension manifest describes characteristics about your extension. All characteristics have a parameter in the [!INCLUDE[wps_2_md](includes/wps_2_md.md)] cmdlet that you use to create the manifest. The following table describes the data in the manifest:  

|Data|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|Name|Specifies the name of the extension.|  
|Publisher|Specifies the publisher of the extension, such as your company name.|  
|Version|Specifies the version of the extension. The version is a string in the format of Major.Minor.Build.Revision, with a default value of 1.0.0.0. You must increment the value for each new version of the extension that you publish.|  
|Description|Specifies the description for the extension.|  
|Id|Specifies the unique identifier for the extension. A unique identifier will be generated if a value is not provided. The same unique identifier should be used for each new version of the extension.|  
|Brief|Specifies a brief description for the extension.|  
|PrivacyStatement|Specifies a hyperlink to the extension’s Privacy Statement.|  
|Eula|Specifies a hyperlink to the End User License Agreement for your extension.|  
|Url|Specifies a hyperlink to a page or web site with additional information about the extension.|  
|Help|Specifies a hyperlink to the site where you have published Help for the extension.|  
|CompatibilityId|Specifies the compatibility ID of the extension. The compatibility ID is a version string in the format of Major.Minor.Build.Revision, with a default value of 1.0.0.0. The value is used to indicate whether there are compatibility related code changes between different versions of the extension. If a new version of the extension does not break compatibility, leave the compatibility ID the same as the previous version.|  
|Dependencies|Specifies the path to a package file (.navx) for another extension that this extension depends on. Use a comma (,) to separate the paths to multiple .navx files., such as in the following example: `C:\Proseware\SmartAppBase.navx, C:\Proseware\ProsewareBase.navx`|  
|Prerequisites|Specifies the objects that must exist in order to deploy the extension to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The prerequisites is a string in the format of type=ID, where type can be any object type such as Table, CodeUnit, or Page. Use a comma (,) to separate the prerequisites, such as in the following example: Table=397, CodeUnit=78.|  

For more information, see [Manifest Overview](Manifest-Overview.md).  

The New-NAVAppManifest cmdlet creates an in-memory Manifest object.  

```  
New-NAVAppManifest -Name "Proseware SmartStuff" -Publisher "Proseware, Inc." -Version "1.5.0.12"  
```  

You can either persist this object to a file and then check it in to source control by using `New-NAVAppManifestFile`, or you can pass it directly to [!INCLUDE[wps_2_md](includes/wps_2_md.md)] `New-NAVAppPackage` as described in the next step.

```  
New-NAVAppManifest -Name "Proseware SmartStuff" -Publisher "Proseware, Inc." -Version "1.5.0.12" | New-NavAppManifestFile -Path proseware.xml  
```  

Related cmdlets are `Get-NAVAppManifest` and `Set-NAVAppManifest`. For more information, use the Get-Help command in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].  

> [!TIP]  
>  For any [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlet, you can get help and sample usages, such as the following command: `Get-Help Set-NAVAppManifest -Examples`  

Next, you can choose to include permission sets and other data in your package. This is optional, but at a minimum, an extension must include one permission set that grants permission to use the objects contained in the extension. An administrator must map users this permission set ID once it has been imported. For more information, see [How to: Export Data for an Extension Package](how-to-export-data-for-an-extension.md).  

> [!IMPORTANT]  
>  If you do not include a permission set with your extension, only users with the SUPER permission set will be able to use the extension.  

 Once you have the DELTA and TXT files and .NET Interop add-ins for your app created you can now complete the final step and build the extension package file. Extension packages require a manifest and access to the application objects that you created.  

### To build the extension package  

Use the `New-NAVAppManifest` and `New-NAVAppPackage` cmdlets to build the manifest and package file.  
The following is an example of how to create a new extension .NAVX package file with a new manifest.  

```  
New-NAVAppManifest -Name "Proseware SmartStuff" -Publisher "Proseware, Inc." -Version "1.5.0.12" | New-NAVAppPackage -Path MyExtension.navx -SourcePath DELTA  
```  

Alternatively, if you created a manifest file, you can use directly from that file:  

```  
Get-NAVAppManifest -Path '.\Manifest-Proseware SmartStuff.xml' | New-NAVAppPackage -Path MyExtension.navx -SourcePath DELTA   
```  

You have packaged your extension so it is ready to be published and installed on a target server.  

> [!NOTE]  
>  The packaging process adds a description of the extension to the manifest, such as whether it changes pages or adds tables. While not explicitly being enforced currently, this can be used to determine whether to install an extension, or not. Use `Get-NAVAppManifest –Path` to see capabilities.  

 Finally, you can choose to get your extension package signed to help validate its authenticity.

## Signing a NAVx File
Code signing is a common practice for many applications. For more information, see [Authenticode](https://msdn.microsoft.com/library/ms537359\(VS.85\).aspx) in the MSDN Library. The signing must be performed on a computer that has [!INCLUDE[navcorfu](includes/navcorfu_md.md)] or later installed. You must have a certificate on the computer (as a file or in the certificate store) that includes code signing for the intended purpose. It is recommended that you use a certificate from a third party certificate authority. For testing purposes, it is acceptable to create a self-signed certificate using the [New-SelfSignedCertificate](https://technet.microsoft.com/library/hh848633) cmdlet in PowerShell on Windows 10 or [MakeCert](https://msdn.microsoft.com/library/windows/desktop/aa386968(v=vs.85).aspx).  

The following example illustrates how to create a new self-signed certificate for code signing:

```
New-SelfSignedCertificate –Type CodeSigningCert –Subject “CN=ProsewareTest”
```

Example MakeCert command to create a new self-signed certificate for code signing:

```
Makecert –sk myNewKey –n “CN=Prosewaretest” –r –ss my
```
Optionally, but recommended, use a time stamp when signing the NAVx file. A time stamp allows the NAVx signature to be verifiable even after the certificate used for the signature has expired. For more information, see [Time Stamping Authenticode Signatures](https://msdn.microsoft.com/library/windows/desktop/bb931395\(v=vs.85\).aspx).  

Use a signing tool such as [SignTool](https://msdn.microsoft.com/library/8s9b9yaz\(v=vs.110\).aspx) or [CodeSign](https://msdn.microsoft.com/library/ms537364\(v=vs.85\).aspx) to sign the NAVx file.  

The following example signs the Proseware.navx file using the certificate in the password-protected MyCert.pfx file.

```
SignTool sign /f MyCert.pfx /p MyPassword “C:\NAV\Proseware.navx”
```

The following example signs the Proseware.navx file with a time stamp using the certificate in the password-protected MyCert.pfx file.

```
SignTool sign /f MyCert.pfx /p MyPassword /t https://timestamp.verisign.com/scripts/timestamp.dll “C:\NAV\Proseware.navx”
```

The following example signs the Proseware.navx file using the certificate in the My store with a subject name of “Prosewaretest”.

```
SignTool sign /n Prosewaretest “C:\NAV\Extension\Proseware.navx”
```
> [!NOTE]  
>  If you want to publish an unsigned extension package, you need explicitly state that by using the *–SkipVerification* parameter on the `Publish-NAVApp` cmdlet.  

## See Also  
[Getting Started](developer/devenv-get-started.md)  
<!-- 
 [Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)   
 [Manifest Overview](Manifest-Overview.md)  
 [How to: Develop an Extension](How-to--Develop-an-Extension.md)  
 [How to: Export Data for an Extension](how-to-export-data-for-an-extension.md)  
 [How to: Publish and Install an Extension](How-to--Publish-and-Install-an-Extension.md)  
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)  
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)  
 [Development Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkID=626875)  
 [Authenticode](https://msdn.microsoft.com/library/ms537359\(VS.85\).aspx)  
 [Introduction to Code Signing](https://msdn.microsoft.com/library/ms537361\(v=vs.85\).aspx)  
-->