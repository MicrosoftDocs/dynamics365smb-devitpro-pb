---
title: "Troubleshooting: Could not load type &#39;System.ServiceModel.Activation.HttpModule&#39; from assembly &#39;System.ServiceModel...&#39;"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dd6a8846-4736-42fd-90ac-f25ebd28ea25
caps.latest.revision: 7
---
# Troubleshooting: Could not load type &#39;System.ServiceModel.Activation.HttpModule&#39; from assembly &#39;System.ServiceModel...&#39;
When you try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get the following error.  
  
 **Could not load type 'System.ServiceModel.Activation.HttpModule' from assembly 'System.ServiceModel, Version=3.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089**  
  
 This error can occur when there are multiple versions of the .NET Framework on the computer that is running IIS, and IIS was installed after .NET Framework 4.0 or before the Service Model in Windows Communication Foundation was registered.  
  
## Resolution  
 For Windows 7 and Windows Server 2008, use the ASP.NET IIS Registration Tool \(aspnet\_regiis.exe,\) to register the correct version of ASP.NET. For more information about the aspnet\_regiis.exe, see [ASP.NET IIS Registration Tool](https://go.microsoft.com/fwlink/?LinkID=259700).  
  
#### To register the correct version of ASP.NET  
  
1.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open a command prompt as an administrator as follows:  
  
    1.  From the **Start** menu, choose **All Programs**, and then choose **Accessories**.  
  
    2.  Right-click **Command Prompt**, and then choose **Run as administrator**.  
  
2.  At the command prompt, type the following command to change to the *Microsoft.NET\\Framework64\\v4.0.30319* folder, and then press Enter.  
  
    ```  
    cd\Windows\Microsoft.NET\Framework64\v4.0.30319  
    ```  
  
3.  At the command prompt, type the following command, and then press Enter.  
  
    ```  
    aspnet_regiis.exe -iru  
    ```  
  
4.  At the command prompt, type the following command, and then press Enter.  
  
    ```  
    iisreset  
    ```  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)
