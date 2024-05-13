---
title: "SQL Server Sysprep Installation Configuration File Example"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 11afd541-bfcf-4564-8d19-a1a2e874df2e
ms.author: jswymer
---
# SQL Server Sysprep Installation Configuration File Example
The following code is an example of a configuration file that you can use for installing SQL Server 2012 with SysPrep. You can use this code when you create a custom image for installing [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure.  

 To use the code, copy the code into a text editor, such as Notepad, and then save the file that has the name ConfigurationFile.ini. For more information about how to use the ConfigurationFile.ini file, see [How to: Create a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md).  

```  
;SQL Server 2012 Configuration File  
[OPTIONS]  

; Specifies a Setup workflow, like INSTALL, UNINSTALL, or UPGRADE. This is a required parameter.   

ACTION="PrepareImage"  

; Detailed help for command line argument ENU has not been defined yet.   

ENU="True"  

; Parameter that controls the user interface behavior. Valid values are Normal for the full UI, AutoAdvance for a simplified UI, and EnableUIOnServerCore for bypassing Server Core setup GUI block.   

;UIMODE="Normal"  

; Specifies setup not display any user interface.   

;QUIET="False"  

; Specifies setup to display progress only, without any user interaction.   

QUIETSIMPLE="True"  

; Specifies whether SQL Server Setup should discover and include product updates. The valid values are True and False or 1 and 0. By default SQL Server Setup will include updates that are found.   

UpdateEnabled="True"  

; Specifies features to install, uninstall, or upgrade. The list of top-level features include SQL, AS, RS, IS, MDS, and Tools. The SQL feature will install the Database Engine, Replication, Full-Text, and Data Quality Services (DQS) server. The Tools feature will install Management Tools, Books online components, SQL Server Data Tools, and other shared components.   

FEATURES=SQLENGINE  

; Specifies the location where SQL Server Setup will obtain product updates. The valid values are "MU" to search Microsoft Update, a valid folder path, a relative path such as .\MyUpdates or a UNC share. By default SQL Server Setup will search Microsoft Update or a Windows Update service through the Window Server Update Services.   

UpdateSource="MU"  

; Displays the command line parameters usage   

HELP="False"  

; Specifies that the detailed Setup log should be piped to the console.   

INDICATEPROGRESS="False"  

; Specifies that Setup should install into WOW64. This command line argument is not supported on an IA64 or a 32-bit system.   

X86="False"  

; Specifies the root installation directory for shared components.  This directory remains unchanged after shared components are already installed.   

INSTALLSHAREDDIR="C:\Program Files\Microsoft SQL Server"  

; Specifies the root installation directory for the WOW64 shared components.  This directory remains unchanged after WOW64 shared components are already installed.   

INSTALLSHAREDWOWDIR="C:\Program Files (x86)\Microsoft SQL Server"  

; Specifies the Instance ID for the SQL Server features you have specified. SQL Server directory structure, registry structure, and service names will incorporate the instance ID of the SQL Server instance.   

INSTANCEID="MSSQLSERVER"  

; Specifies the installation directory.   

INSTANCEDIR="C:\Program Files\Microsoft SQL Server"  
```  

## See Also  
 [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)
