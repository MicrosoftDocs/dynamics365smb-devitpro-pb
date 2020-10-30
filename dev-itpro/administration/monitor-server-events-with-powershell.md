---
title: "Monitoring Business Central Server Events with PowerShell"
description: Learn how to use PowerShell to monitor Business Central Server instances
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Monitoring Business Central Server Events with PowerShell
Events that occur on the [!INCLUDE[server](../developer/includes/server.md)] instances are recorded in event logs on the computer that is running [!INCLUDE[server](../developer/includes/server.md)]. You can view the events by using Windows PowerShell as described in this article.  

##  <a name="ViewEventsWinPS"></a>PowerShell Get-WinEvent Cmdlet   
You can use the Get-WinEvent cmdlet of Windows PowerShell to view [!INCLUDE[server](../developer/includes/server.md)] instance events and trace events in the event logs and event tracing log files on the [!INCLUDE[server](../developer/includes/server.md)] computer. The Get-WinEvent cmdlet retrieves the same events that can be viewed in Event Viewer under **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** (see [Monitoring Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md)). 
  
The Get-WinEvent cmdlet includes several parameters that enable you to filter the events that you view and specify how the events are displayed. Windows PowerShell enables you can create scripts that perform complex operations for extracting and displaying specific event data. For more information about the Get-WinEvent cmdlet, see [Get-WinEvent](https://go.microsoft.com/fwlink/?LinkID=513535).  
  
For more information about installing and getting started with Windows PowerShell, see [Getting Started with Windows PowerShell](https://go.microsoft.com/fwlink/?LinkID=254637).  
  
## To use the Get-WinEvent Cmdlet to view events  
  
1.  If you want to view events in a **Debug** log, ensure that the log is enabled. The **Admin** and **Operational** logs are enabled by default.  
  
     For information, see [To enable the Business Central Server Debug Log from Windows PowerShell](monitor-server-events-with-powershell.md#EnableLog).  
  
2.  On the computer that is running [!INCLUDE[server](../developer/includes/server.md)], start Window PowerShell.  
  
     For more information, see [Starting Windows PowerShell](https://go.microsoft.com/fwlink/?LinkID=513794).  
  
3.  At the command prompt, enter the `Get-WinEvent` command. The following table provides some simple example commands.  
  
    |To view|Command|  
    |-------------|-------------|  
    |Events in the all **DynamicsNAV** > **Server** logs|`Get-WinEvent -ProviderName Microsoft-DynamicsNAV-Server`|
    |Events in the all **DynamicsNAV** > **Common** logs|`Get-WinEvent -ProviderName Microsoft-DynamicsNav-Common`|  
    |Events in the **DynamicsNAV** > **Server** > **Admin** log|`Get-WinEvent -LogName Microsoft-DynamicsNAV-Server/Admin`|
    |Events in the **DynamicsNAV** > **Common** > **Admin** log|`Get-WinEvent -LogName Microsoft-DynamicsNav-Common/Admin`|  
    |Events in the [!INCLUDE[server](../developer/includes/server.md)] Operational log|`Get-WinEvent -LogName Microsoft-DynamicsNAV-Server/Operational`|  
    |Trace events in the [!INCLUDE[server](../developer/includes/server.md)] Debug log|`Get-WinEvent -LogName Microsoft-DynamicsNAV-Server/Debug -Oldest`|  
  
##  <a name="EnableLog"></a> To enable the Debug Logs from Windows PowerShell 

There are two debug logs for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]: **Microsoft-DynamicsNAV-Server/Debug** and **Microsoft-DynamicsNav-Common/Debug**.
  
1.  On the computer that is running [!INCLUDE[server](../developer/includes/server.md)], start Window PowerShell as an administrator.  
  
2.  At the command prompt, run the following commands:  
  
    ```  
    wevtutil.exe set-log "Microsoft-DynamicsNAV-Server/<Debug>" /q:true /e:true  
    ```  

    ```  
    wevtutil.exe set-log "Microsoft-DynamicsNav-Common/<Debug>" /q:true /e:true  
    ```  
  
> [!TIP]  
>  You can also enable the Debug log from Event Viewer. For more information, see [Enable Analytic and Debug Logs](https://technet.microsoft.com/library/cc749492.aspx).  
  
## Filtering [!INCLUDE[server](../developer/includes/server.md)] Events  
You can filter the events that you view in a [!INCLUDE[server](../developer/includes/server.md)] log by setting the *FilterXpath* parameter of the Get-WinEvent cmdlet. The following examples illustrate how you can use the *FilterXpath* parameter to filter the [!INCLUDE[server](../developer/includes/server.md)] events.  
  
### Example 1  
  
The following example uses the Get-WinEvent cmdlet to view errors in the [!INCLUDE[server](../developer/includes/server.md)] Admin log for the tenant *MyTenant1* on the server instance *MyNavServerInstance1*.  
  
```  
Get-WinEvent -LogName 'Microsoft-DynamicsNAV-Server/Admin' -FilterXPath "*[System[(Level=2)]] and *[EventData[Data[@Name='tenantId'] and (Data = 'MyTenant1')]] and *[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]" | Format-List -Property Message-  
```  
  
### Example 2  
  
The following is an example of a Windows PowerShell script that you can create and run to view trace events in the [!INCLUDE[server](../developer/includes/server.md)] Debug log. The script returns the start and stop AL function trace events that take more than four seconds to execute on the tenant *MyTenant1* of the server instance *MyNavServerInstance1*.  
  
```  
$maxAllowedSeconds = 4  
  
$xPath = "*[System[(EventID = 400 or EventID = 401)]] and " +   
         "*[EventData[Data[@Name='tenantId'] and (Data  = 'MyTenant1')]] and " +  
         "*[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]"  
  
$events = Get-WinEvent -LogName 'Microsoft-DynamicsNAV-Server/Debug' -FilterXPath $xPath -Oldest -MaxEvents 10000  
  
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
 [Monitoring Business Central Server Events](monitor-server-events.md)    
 [Business Central Server Trace Events](server-trace-events.md)   
 [Monitoring Business Central Server](monitor-server.md)   
 [Monitoring Business Central Server Using Performance Counters](monitor-server-using-performance-counters.md)  
 [Event Viewer](https://go.microsoft.com/fwlink/?LinkID=314067)