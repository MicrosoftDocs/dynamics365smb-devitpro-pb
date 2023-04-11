---
title: "How to: Set .NET Framework Types to Run on the Microsoft Dynamics NAV Windows Client or Microsoft Dynamics NAV Server Computers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3c0380ea-8c21-4977-a939-0b58c1d793eb
caps.latest.revision: 23
---
# How to: Set .NET Framework Types to Run on the Microsoft Dynamics NAV Windows Client or Microsoft Dynamics NAV Server Computers
This topic describes how to set .NET Framework objects that are instantiated by DotNet variables to target either the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_server](includes/nav_server_md.md)]. By default, a type is set to target [!INCLUDE[nav_server](includes/nav_server_md.md)]. However, you can set the type to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 For more information, see [Setting .NET Framework Types to Target the Microsoft Dynamics NAV Windows Client or Server](Setting-.NET-Framework-Types-to-Target-the-Microsoft-Dynamics-NAV-Windows-Client-or-Server.md)  

## Setting the .NET Framework Type to Target the Microsoft Dynamics NAV Windows Client  
 To set a .NET Framework type instance to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you must complete the following tasks as described in this section:  

-   Set the DotNet variable for the .NET Framework type to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

-   Unless the NET Framework assembly is included in the global assembly cache, you must do one of the following:  

    -   Import the .NET Framework assembly into the [!INCLUDE[navnow](includes/navnow_md.md)] database,  

         You import the assembly into the table **2000000069 Add-ins**. The .NET Framework assembly will be automatically deployed on the client computer when an operation from the client requires it. The assembly will be deployed to the *%TEMP%\\Microsoft Dynamics NAV\\Add-Ins* folder of the user who is running the client. The deployed assembly will be then be used whenever it is required by the client. If a .NET Framework assembly is updated and its version number changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] will deploy the updated assembly to the client computer the next time that the client requests the assembly. The updated assembly is put in a subfolder of the %*TEMP%\\Microsoft Dynamics NAV\\Add-Ins* folder, where the subfolder has the assembly's version number as its name.  

         For more information, see [To import a .NET Framework assembly into the database](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md#ImportDb).  

        > [!NOTE]  
        >  To be deployed, an assembly must comply with the following [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration settings: Chunk Size, Max Upload Size, and Prohibited File Types. For more information about these settings, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

    -   Copy the .NET Framework assembly to the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

         Similar to importing the .NET Framework assembly into the database, if you copy a .NET Framework assembly on computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)], then [!INCLUDE[nav_server](includes/nav_server_md.md)] automatically deploys the assembly on the client computer when an operation from the client requires the .NET Framework assembly.  

         For more information, see [To copy a .NET Framework assembly to the computer that is running Microsoft Dynamics NAV Server](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md#CopyAssemblyServer).  

    -   Copy the assembly to each computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

         For more information, see [To copy a .NET Framework assembly to a computer that is running the Microsoft Dynamics NAV Windows client](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md#CopyAssembyToClient).  

> [!IMPORTANT]  
>  For the [!INCLUDE[nav_web](includes/nav_web_md.md)], you cannot implement Microsoft .NET Framework interoperability objects that target the client.  

#### To set the .NET Framework type to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

1.  In Object Designer, open the C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object that uses .NET Framework interoperability.  

2.  Do one of the following steps:  

    -   For a global variable, on the **View** menu, choose **C/AL Globals**.  

    -   For a local variable, select the trigger that uses the variable, and then on the **View** menu, choose **C/AL Locals**.  

3.  On the **Variables** tab, select the DotNet variable, and then on the **View** menu, choose **Properties**.  

4.  In the **Properties** window, set the **RunOnClient** property to **Yes**.  

###  <a name="CopyAssembyToClient"></a> To copy a .NET Framework assembly to a computer that is running the Microsoft Dynamics NAV Windows client  

-   On the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], copy the.NET Framework assembly to the Add-ins folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installation.  

     By default, the path of this folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client\\Add-ins or [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  

    > [!NOTE]  
    >  You can also put assemblies in a subfolder of the Add-ins folder. This can be useful when you have multiple versions of the same assemblies and dependencies.  

## Setting the .NET Framework Type to Target [!INCLUDE[nav_server](includes/nav_server_md.md)]  
 To set a .NET Framework type instance to target [!INCLUDE[nav_server](includes/nav_server_md.md)], you must complete the following tasks as described in this section:  

-   Set the variable for the NET Framework type to target [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Copy the .NET Framework assembly to the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

    > [!NOTE]  
    >  If the assembly is included in the global assembly cache of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], then you do not have to do this task.  

#### To set the .NET Framework type to target Microsoft Dynamics NAV Server  

1.  In the development environment, in Object Designer, open the object that uses the .NET Framework variable.  

2.  Do one of the following steps:  

    -   For a global variable, on the **View** menu, choose **C/AL Globals**.  

    -   For a local variable, in the C/AL Editor, select the trigger that uses the DotNet variable, and then on the **View** menu, choose **C/AL Locals**.  

3.  On the **Variables** tab, select the **NET Framework variable** type, and then on the **View** menu, choose **Properties**.  

4.  In the **Properties** window, set the **RunOnClient** property to **No**.  

###  <a name="CopyAssemblyServer"></a> To copy a .NET Framework assembly to the computer that is running Microsoft Dynamics NAV Server  

-   On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], copy the.NET Framework assembly to the **Add-ins** folder of the [!INCLUDE[nav_server](includes/nav_server_md.md)] installation folder.  

     By default, the path of the [!INCLUDE[nav_server](includes/nav_server_md.md)] installation folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Add-ins.  

     You can also put assemblies in a subfolder of the **Add-ins** folder. This can be useful when you have multiple assemblies and dependencies.  

    > [!NOTE]  
    >  If you are working in the development environment, to compile and test [!INCLUDE[navnow](includes/navnow_md.md)] objects, you must also copy the assembly to the Add-ins folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installation on the computer that is running the development environment. By default, the path of this folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client\\Add-ins or [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  

###  <a name="ImportDb"></a> To import a .NET Framework assembly into the database  

1.  Get the public key token for the .NET Framework assembly.  

     The public key token is a 16-character key that is given to the assembly when it is built and signed in Microsoft Visual Studio. To determine the public token key, run the Microsoft .NET Strong Name Utility \(sn.exe\) on the assembly. For more information, see [How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly](How-to--Determine-the-Public-Key-Token-of-the-Windows-Client-Control-Add-in-and-.NET-Framework-Assembly.md) and [Strong-Named Signing](https://go.microsoft.com/fwlink/?LinkID=150201&clcid=0x409).  

2.  Create a compressed \(.zip type\) file that contains the .NET Framework assembly in the desired folder structure.  

3.  You can import the compressed \(.zip\) file when you register the NET Framework assembly from the **Control Add-ins** page in [!INCLUDE[navnow](includes/navnow_md.md)].  

4.  In the **Search** box, enter **Control Add-ins** and then choose the related link.  

5.  In the **Control Add-ins** window, choose **New**, and then in the **Control Add-in Name** column, enter the control add-in name. In the **Public Key Token** column, enter the public key token that you obtained earlier.  

6.  Choose **Import**.  

7.  In the **Import Control Add-in Resource** window, locate the.zip file, and then choose **Open**.  

8.  Choose the **OK** button to close the **Control Add-in** page.  

 For more information about registering a control add-in, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  

> [!TIP]  
>  You can also register the control add-in and import the files by using the [New-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521781) or [Set-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521784) from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

## See Also  
 [How to: Call .NET Framework Types From C/AL Code](How-to--Call-.NET-Framework-Types-From-C-AL-Code.md)   
 [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md)
