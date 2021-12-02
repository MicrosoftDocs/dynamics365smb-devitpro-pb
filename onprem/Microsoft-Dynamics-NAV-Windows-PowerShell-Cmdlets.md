---
title: "Microsoft Dynamics NAV Windows PowerShell Cmdlets"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5ec9b35d-a50d-43d7-b20c-efddc98dca32
caps.latest.revision: 17
---
# Microsoft Dynamics NAV Windows PowerShell Cmdlets
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets for administration and for development and file management of application object files and extension packages. The cmdlets are available in two Windows PowerShell modules: [!INCLUDE[nav_shell](includes/nav_shell_md.md)] and [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].  

-   The [!INCLUDE[nav_shell](includes/nav_shell_md.md)] includes cmdlets for administering the [!INCLUDE[navnow](includes/navnow_md.md)] deployment, such as adding and configuring [!INCLUDE[navnow](includes/navnow_md.md)] server instances, databases, and users. Also included are cmdlets for administering extension packages. The [!INCLUDE[nav_shell](includes/nav_shell_md.md)] is installed with the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   The [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] includes cmdlets for merging and modifying application object files. Also included are cmdlets for creating extension packages. The [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] is installed with the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

 The cmdlets are implemented in [!INCLUDE[wps_2](includes/wps_2_md.md)] 3.0, which is included with Windows Server 2012 and Windows 8 and later. For other versions of Windows supported for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can install it as part of the [Windows Management Framework 3.0](https://go.microsoft.com/fwlink/?LinkId=293806) on the Microsoft Download Center. 

> [!IMPORTANT]  
>  Cmdlets can perform actions that can also be done from the client, such as creating and modifying entities like web services, companies, users, and more. Be aware that cmdlets do not execute code on application objects (such as tables or pages) that are associated with these entities. If you have added logic to these application objects, the logic will be ignored by the cmdlets. For example, if you added logic on table **9900  Web Service Aggregate** to control the creation of web services, although this logic will run from the client, it will be ignored when creating web services by using the New-NAVWebService cmdlet.  

<!-- 
> [!NOTE]  
>  Alternatively to running [!INCLUDE[nav_shell](includes/nav_shell_md.md)] and [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] from where they are installed, you can import the relevant module into the [!INCLUDE[wps_2](includes/wps_2_md.md)] Integrated Scripting Environment \(ISE\).
-->  

## <a name="StartAdminShell"></a>Starting a [!INCLUDE[nav_shell](includes/nav_shell_md.md)] Session  
 You must run the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] as an Administrator. On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], choose **Start**, in the **Search** box, type **[!INCLUDE[nav_shell](includes/nav_shell_md.md)]**, right-click the related link, and then choose **Run as Administrator**.  

> [!IMPORTANT]  
>  To run the cmdlets in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], you must be a member of the local Administrator group on the computer where the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] is installed.  

## Starting a [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] Session  
 On the computer that is running [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], choose **Start**, in the **Search** box, type **[!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)]**, and then choose the related link.  

## <a name="GetHelp"></a>Getting Help on [!INCLUDE[navnow](includes/navnow_md.md)] Cmdlets  
 To see the cmdlets that are available for [!INCLUDE[navnow](includes/navnow_md.md)], type the following at the [!INCLUDE[wps_2](includes/wps_2_md.md)] prompt.  

```  
Get-Command *NAV*  
```  

 To get Help about syntax and options for a specific cmdlet, type the following cmdlet.  

```  
Get-Help <cmd name>  
```  

 For example, to get Help about the **Get-NAVServerInstance** cmdlet, type the following.  

```  
Get-Help Get-NAVServerInstance  
```  

 To get online Help in the MSDN Library for a specific cmdlet, type the following cmdlet.  

```  
Get-Help <cmd name> -online  
```  

>[!NOTE]
>The cmdlet help for [!INCLUDE[nav2017](includes/nav2017.md)] is currently not available in the MSDN Library. The *-online* switch parameter will open the [!INCLUDE[navcorfu](includes/navcorfu_md.md)] version of the help in the MSDN Library instead. For the latest cndlet help, use the cmdlet help in command-line interface (by omitting *-online* switch parameter).

For more information about [!INCLUDE[nav_shell](includes/nav_shell_md.md)] cmdlets, see [Administration Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.management) and [Administration Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.management).  

For more information about [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] cmdlets, see [Development Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.model.tools) and [Development Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.tools).  

 For more information about Windows PowerShell, see [Windows PowerShell Getting Started Guide](https://go.microsoft.com/fwlink/?LinkID=252252).  

## See Also  
 [Sample Windows PowerShell Scripts for Microsoft Dynamics NAV](Sample-Windows-PowerShell-Scripts-for-Microsoft-Dynamics-NAV.md)   
 [Administration](Administration.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)  
