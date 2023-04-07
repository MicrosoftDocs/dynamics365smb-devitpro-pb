---
title: Import-NAVEncryptionKey Cmdlet Error
description: The path to Windows Communication Foundation was not found on the service tier Error occurs if the Server instance is on Azure running Windows Server 2012 R2.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9f90e574-1bdd-4ffc-8a2f-0b417c64b686
caps.latest.revision: 3
---
# Troubleshooting: Import-NAVEncryptionKey Cmdlet: The path to Windows Communication Foundation was not found on the service tier
If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is on an Azure virtual machine that is running Windows Server 2012 R2, you get the following error when you run the Import-NAVEncryptionkey cmdlet:  
  
 **Import-NAVEncryptionKey : The path to Windows Communication Foundation was not found on the service tier. It was expected to be in folder 'C:\\Windows\\Microsoft.NET\\Framework64\\v3.0\\Windows Communication Foundation'.Have you installed the .NET Framework 3.0?**  
  
## Resolution  
 You must install the HTTP Activation feature on the Azure virtual machine. Perform one of the following procedures:  
  
-   Run the Microsoft Dynamics NAV Administration Shell as Administrator, and then run the following cmdlet:  
  
    ```  
    install-windowsfeature -Name NET-HTTP-Activation  
  
    ```  
  
-   Open Server Manager, and then use the **Add Roles and Features Wizard** to install HTTP Activation, which is available under the .NET Framework 3.5 feature.  
  
     For more information, see [Install or Uninstall Roles, Role Services, or Features](https://go.microsoft.com/fwlink/?LinkID=623826).  
  
## See Also  
 [Managing Encryption Keys for SQL Server Authentication](Managing-Encryption-Keys-for-SQL-Server-Authentication.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)
