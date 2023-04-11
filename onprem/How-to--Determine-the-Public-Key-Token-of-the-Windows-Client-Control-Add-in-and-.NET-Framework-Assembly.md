---
title: "How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f7ce3b2d-5e2e-4d2d-97fa-bed3a6add0d2
caps.latest.revision: 20
---
# How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly
To use a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in on a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] page, you must register the assembly that contains the control add-in on the **Control Add-ins** page of the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database. To register an assembly, you provide the assembly's *public key token*. The public key token is a unique 16-character key that is given to the assembly when it is built and signed in Microsoft Visual Studio. To determine the public token key, you can run the Strong Name tool \(sn.exe\) on the assembly. The sn.exe is available with the Microsoft .NET Framework SDK. For more information about how to sign assemblies, see [Strong Name Signing \(sn.exe\)](https://go.microsoft.com/fwlink/?LinkID=150113&clcid=0x409) or [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md).  
  
### To determine the public key token  
  
1.  Locate the sn.exe file.  
  
     The location will depend on your operating system and the installed Microsoft .NET Framework SDK. For example, *C:\\Program Files\\Microsoft SDKs\\Windows\\v7.0\\Bin* or *C:\\Utils\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.6.1 Tools\\x64*.  
  
2.  At the command prompt, change to the directory that contains the sn.exe utility.  
  
3.  Type the following command.  
  
    ```  
    sn.exe -T <assembly>  
    ```  
  
     Replace `<assembly>` with the add-in assembly's path and file name, such as [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins\\MyCompany.MyProduct.RtcAddins.dll.  
  
4.  Press Enter and note the public token key that is displayed.  
  
## See Also  
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)
