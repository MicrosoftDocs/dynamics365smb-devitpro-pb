---
title: "How to: Install a Windows Client Control Add-in Assembly"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 65541fa4-a40c-497a-abac-857eeeb70d6d
caps.latest.revision: 26
---
# How to: Install a Windows Client Control Add-in Assembly
[!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-ins are provided in one or more Microsoft Framework .NET–based assemblies, which are .dll type files. To run a control add from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the control add-in assembly must be installed on the computer on which the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is installed. In some cases during development, such as when you compile an object that uses a control add-in, the control add-in assembly must also be installed on the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
 You can install control add-ins the following ways:  
  
-   Install the control add-in assemblies manually on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] computer.  
  
     For more information, see [To install control add-in assemblies on the Microsoft Dynamics NAV Windows client manually](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md#InstallClient).  
  
-   Install the control add-in assemblies on the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] or in the database.  
  
     The assemblies will be automatically deployed to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer. For more information, see [Automatic Deployment of Control Add-ins](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md#AutomaticDep).  
  
##  <a name="InstallClient"></a> To install control add-in assemblies on the Microsoft Dynamics NAV Windows client manually  
  
-   On the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], copy the assemblies that contain the control add-ins to the **Add-ins** folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installation.  
  
     By default, the path of this folder is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  
  
    > [!NOTE]  
    >  You can also include assemblies in a subfolder of the Add-ins folder. This can be useful if you have multiple assemblies and dependencies.  
  
##  <a name="AutomaticDep"></a> Automatic Deployment of Control Add-ins  
 If a control add-in has the same name as the assembly, the system can automatically deploy control add-in assembly, and any associated files, to the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. There are two ways that you set up the automatic deployment of a control add-in:  
  
-   You can install the control add-in assembly directly on the computers running the [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
-   Or you can import the control add-in assembly into the database.  
  
 When an operation from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] client requires a control add-in, such as running a page that contains the control add-in, the control add-in is deployed as follows:  
  
1.  The client looks for the control add-in assembly in the local **Add-ins** folder \(by default, [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins\).  
  
    -   If the assembly is available, it is used.  
  
    -   If the assembly is not available, the client requests the assembly from [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
2.  The [!INCLUDE[nav_server](includes/nav_server_md.md)] looks for the control add-in assembly in the local **Add-ins** folder \(by default, [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Add-ins\).  
  
    -   If the assembly is available, it is deployed to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer.  
  
         The control add-in is installed in the *%TEMP%\\Microsoft Dynamics NAV\\Add-Ins* folder of the user who is running the client.  
  
    -   If the control add-in assembly is not there, the add-in is deployed from the database to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
3.  The control add-in assembly is streamed from the database to [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and eventually the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer.  
  
     On the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer, the control add-in is installed in the *%TEMP%\\Microsoft Dynamics NAV\\Add-Ins* folder of the user who is running the client.  
  
 The deployed assembly will be then be used whenever the page is run until the control add-in has been updated with a version change.  
  
 If the control add-in assembly is updated and its version number changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] will deploy the updated assembly to the client computer the next time that the client requests the assembly. The updated assembly is put in a subfolder of the %TEMP%\\Microsoft Dynamics NAV\\Add-Ins folder, where the subfolder has the assembly's version number as its name. This implementation means that you do have to remove the older versions of assemblies that are stored on the client computer.  
  
 The process is similar when the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] requires a control add-in, for example, when you compile an object. the control add-in assembly will be deployed to the local temporary folder for the current user on the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
> [!NOTE]  
>  To be deployed automatically, a control add-in must have the same name as its assembly and the assembly must comply with the following [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration settings: Chunk Size, Max Upload Size, and Prohibited File Types. For more information about these settings, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
#### To install the control add-in on [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
-   On the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)], copy the assembly that contains the control add-in to the *Add-ins* folder of the [!INCLUDE[nav_server](includes/nav_server_md.md)] installation.  
  
     By default, the path is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Add-ins.  
  
###  <a name="InstallOnDatabase"></a> To import the control add-in to the database  
  
1.  Create a compressed \(.zip type\) file that contains the control add-in assembly files in the desired folder structure.  
  
2.  You can import the compressed \(.zip\) file when you register the control add-in from the **Control Add-ins** page in [!INCLUDE[navnow](includes/navnow_md.md)]. In the **Search** box, enter **Control Add-ins** and then choose the related link.  
  
3.  In the **Control Add-ins** window, choose **New**, and then in the **Control Add-in Name** column, enter the control add-in name. In the **Public Key Token** column, enter the public key token that you obtained earlier.  
  
4.  Choose **Import**.  
  
5.  In the **Import Control Add-in Resource** window, locate the.zip file, and then choose **Open**.  
  
6.  Choose the **OK** button to close the **Control Add-in** page.  
  
 For more information about registering a control add-in, see [How to: Register a Windows Client Control Add-in](/dynamics-nav/How-to--Register-a-Windows-Client-Control-Add-in.md).  
  
> [!TIP]  
>  You can also register the control add-in, import and manage the files by using the [New-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521781), [Set-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521784), [Get-NAVAddin](https://go.microsoft.com/fwlink/?LinkID=521782), or [Remove-NAVAddin](https://go.microsoft.com/fwlink/?LinkID=521783) cmdlets from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  
  
## See Also  
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md)   
 [How to: Install a RoleTailored Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md)
