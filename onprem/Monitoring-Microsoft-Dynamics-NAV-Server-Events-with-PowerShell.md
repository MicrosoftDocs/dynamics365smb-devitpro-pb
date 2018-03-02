---
title: "Monitoring Microsoft Dynamics NAV Server Events with PowerShell"
ms.custom: na
ms.date: 22/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Monitoring Dynamics NAV Server Events with PowerShell
Events that occur on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances are recorded in event logs on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. You can view the events by using Windows PowerShell as described in this article.  

##  <a name="ViewEventsWinPS"></a>PowerShell Get-WinEvent Cmdlet   
You can use the Get-WinEvent cmdlet of Windows PowerShell to view [!INCLUDE[nav_server](includes/nav_server_md.md)] instance events and trace events in the event logs and event tracing log files on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. The Get-WinEvent cmdlet retrieves the same events that can be viewed in Event Viewer under **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** (see [Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md)). 
  
The Get-WinEvent cmdlet includes several parameters that enable you to filter the events that you view and specify how the events are displayed. Windows PowerShell enables you can create scripts that perform complex operations for extracting and displaying specific event data. For more information about the Get-WinEvent cmdlet, see [Get-WinEvent](http://go.microsoft.com/fwlink/?LinkID=513535).  
  
For more information about installing and getting started with Windows PowerShell, see [Getting Started with Windows PowerShell](http://go.microsoft.com/fwlink/?LinkID=254637).  
  
## To use the Get-WinEvent Cmdlet to view events  
  
1.  If you want to view events in a **Debug** log, ensure that the log is enabled. The **Admin** and **Operational** logs are enabled by default.  
  
     For information, see [To enable the Microsoft Dynamics NAV Server Debug Log from Windows PowerShell](Monitoring-Microsoft-Dynamics-NAV-Server-Events-with-PowerShell.md#EnableLog).  
  
2.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], start Window PowerShell.  
  
     For more information, see [Starting Windows PowerShell](http://go.microsoft.com/fwlink/?LinkID=513794).  
  
3.  At the command prompt, enter the `Get-WinEvent` command. The following table provides some simple example commands.  
  
    |To view|Command|  
    |-------------|-------------|  
    |Events in the all **DynamicsNAV** > **Server** logs|`Get-WinEvent -ProviderName Microsoft-DynamicsNav-Server`|
    |Events in the all **DynamicsNAV** > **Common** logs|`Get-WinEvent -ProviderName Microsoft-DynamicsNav-Common`|  
    |Events in the **DynamicsNAV** > **Server** > **Admin** log|`Get-WinEvent -LogName Microsoft-DynamicsNav-Server/Admin`|
    |Events in the **DynamicsNAV** > **Common** > **Admin** log|`Get-WinEvent -LogName Microsoft-DynamicsNav-Common/Admin`|  
    |Events in the [!INCLUDE[nav_server](includes/nav_server_md.md)] Operational log|`Get-WinEvent -LogName Microsoft-DynamicsNav-Server/Operational`|  
    |Trace events in the [!INCLUDE[nav_server](includes/nav_server_md.md)] Debug log|`Get-WinEvent -LogName Microsoft-DynamicsNav-Server/Debug -Oldest`|  
  
##  <a name="EnableLog"></a> To enable the Dynamics NAV Debug Logs from Windows PowerShell 

There are two debug logs for Dynamics NAV: **Microsoft-DynamicsNav-Server/Debug** and **Microsoft-DynamicsNav-Common/Debug**.
  
1.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], start Window PowerShell as an administrator.  
  
2.  At the command prompt, run the following commands:  
  
    ```  
    wevtutil.exe set-log "Microsoft-DynamicsNav-Server/<Debug>" /q:true /e:true  
    ```  

    ```  
    wevtutil.exe set-log "Microsoft-DynamicsNav-Common/<Debug>" /q:true /e:true  
    ```  
  
> [!TIP]  
>  You can also enable the Debug log from Event Viewer. For more information, see [Enable Analytic and Debug Logs](http://technet.microsoft.com/en-us/library/cc749492.aspx).  
  
## Filtering [!INCLUDE[nav_server](includes/nav_server_md.md)] Events  
You can filter the events that you view in a [!INCLUDE[nav_server](includes/nav_server_md.md)] log by setting the *FilterXpath* parameter of the Get-WinEvent cmdlet. The following examples illustrate how you can use the *FilterXpath* parameter to filter the [!INCLUDE[nav_server](includes/nav_server_md.md)] events.  
  
### Example 1  
  
The following example uses the Get-WinEvent cmdlet to view errors in the [!INCLUDE[nav_server](includes/nav_server_md.md)] Admin log for the tenant *MyTenant1* on the server instance *MyNavServerInstance1*.  
  
```  
Get-WinEvent -LogName 'Microsoft-DynamicsNav-Server/Admin' -FilterXPath "*[System[(Level=2)]] and *[EventData[Data[@Name='tenantId'] and (Data = 'MyTenant1')]] and *[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]" | Format-List -Property Message-  
```  
  
### Example 2  
  
The following is an example of a Windows PowerShell script that you can create and run to view trace events in the [!INCLUDE[nav_server](includes/nav_server_md.md)] Debug log. The script returns the start and stop C/AL function trace events that take more than four seconds to execute on the tenant *MyTenant1* of the server instance *MyNavServerInstance1*.  
  
```  
$maxAllowedSeconds = 4  
  
$xPath = "*[System[(EventID = 400 or EventID = 401)]] and " +   
         "*[EventData[Data[@Name='tenantId'] and (Data  = 'MyTenant1')]] and " +  
         "*[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]"  
  
$events = Get-WinEvent -LogName 'Microsoft-DynamicsNav-Server/Debug' -FilterXPath $xPath -Oldest -MaxEvents 10000  
  
Write-Host "List of AL functions that took more than $maxAllowedSeconds  seconds to execute :" -ForegroundColor DarkYellow  
  
for($i = 0; $i -lt  $events.Length; $i+=2)  
{   
   $seconds = ($events[$i + 1].TimeCreated - $events[$i].TimeCreated).Seconds  
  
   if ($seconds -ge $maxAllowedSeconds )  
   {  
     Write-Host $events[$i].Message `r`n -ForegroundColor Magenta  
   }  
}  
```  
  
 You can create the script by using, for example, Notepad or Windows PowerShell Integrated Scripting Environment \(ISE\). You save the script as .ps1 file type, and then run it from the Windows PowerShell.  
  
## See Also  
 [Monitoring Microsoft Dynamics NAV Server Events](Monitoring-Microsoft-Dynamics-NAV-Server-Events.md)   
 [Microsoft Dynamics NAV Server Trace Events](Microsoft-Dynamics-NAV-Server-Trace-Events.md)   
 [Monitoring Microsoft Dynamics NAV Server](Monitoring-Microsoft-Dynamics-NAV-Server.md)   
 [Monitoring Microsoft Dynamics NAV Server Using Performance Counters](Monitoring-Microsoft-Dynamics-NAV-Server-Using-Performance-Counters.md)  
 [Event Viewer](http://go.microsoft.com/fwlink/?LinkID=314067)