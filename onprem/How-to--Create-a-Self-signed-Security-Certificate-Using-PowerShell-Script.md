---
title: Self-signed Security Certificate
description: Create a self-signed certificate using PowerShell cmdlet to help secure the communication between the Server and Web Client in Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 227a75d5-2eed-4a88-acea-1a280aaef027
caps.latest.revision: 13
---
# Creating Self-signed Security Certificate Using PowerShell Script
With the `New-NavSelfSignedCertificate` PowerShell cmdlet, you can create a self-signed certificate to help secure the communication between the [!INCLUDE[nav_server](includes/nav_server_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 Running the `New-NavSelfSignedCertificate` takes several parameters. One of these parameters is `MakeCertExePath`. This parameter must be filled in with the file path of the Windows SDK MakeCert.exe file. Typically, this file can be found under *C:\\Program Files \(x86\)\\Windows Kits\\8.1\\bin\\x86\\makecert.exe*. If you do not have a Windows 7.1 or 8.1 SDK on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, you can download this from [MSDN](https://go.microsoft.com/fwlink/?LinkId=335897).  
  
> [!IMPORTANT]  
>  The `New-NavSelfSignedCertificate` PowerShell cmdlet will only create self-signed certificates that can be used on Windows and Windows Phone.  
  
### To create a self-signed security certificate using the PowerShell script  
  
1.  On the computer or virtual machine that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], run Microsoft Dynamics NAV Administration Shell as an Administrator.  
  
2.  Choose Start, in the **Search** box, type **Microsoft Dynamics NAV Administration Shell**.  
  
3.  Right-click the related link, and then choose **Run as Administrator**.  
  
4.  At the command prompt, import the PowerShell module by typing the following command:  `Import-Module <dvddir>\\WindowsPowerShellScripts\NAVCertificateAdministration\NAVCertificateAdministration.psm1` or a path equivalent to where your PowerShell module is located.  
  
5.  Next, at the command prompt, type the following command: `New-NavSelfSignedCertificate <parameters>`  
  
     The following table describes the parameters you can specify:  
  
    |Parameter name|Type|Description|  
    |--------------------|----------|-----------------|  
    |`-TestCertificateName`|Type:String|The name that identifies your test certificate. The default value is `TestCertificate`. This parameter is optional.|  
    |`-TestCertificateServerAddress`|Type:String|The authority/entity that this certificate is issued for. Default is the computer host name. Specify this value if the [!INCLUDE[nav_server](includes/nav_server_md.md)] is accessed by using an address that differs from the computer name. This parameter is optional.|  
    |`-TestCertificateRootCertificateAuthorityName`|Type:String|The root certificate authority name. The name will identify the root certificate issuer. The default value is the `TestCertificate` parameter value prefixed `RootCA`. This parameter is optional.|  
    |`-Outputfolder`|Type:String|Specifies the output folder for the certificates. Default is the location where the script was executed from. This parameter is optional.|  
    |`-MakeCertExePath`|Type:String|The path of the Windows SDK MakeCert.exe tool. Default is the specified `Outputfolder`. This parameter is optional.|  
    |`-NavServiceIdentity`|Type:String|Username for the identity running the [!INCLUDE[nav_server](includes/nav_server_md.md)]. Default is `NTAUTHORITY\Network Service`. This parameter is optional.|  
    |`-Import`|Type:String|Imports the certificates after creation. If not specified, the user will be prompted for a reply. This parameter is optional.|  
    |`-SkipImport`|Type:Boolean|**false** will import certificates and **true** will skip the import of certificates.|  
  
 The `New-NavSelfSignedCertificate` PowerShell cmdlet has now generated a self-signed security certificate with an accompanying root certificate and root revocation list, which is put under the specified output folder. Once the cmdlet is run, you have the option to import the security certificate, root certificate, and root revocation list to the local computer.  
  
## See Also  
 [Using Certificates to Secure a Remote Client Connection](Using-Certificates-to-Secure-a-Remote-Client-Connection.md)   
 [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md)
