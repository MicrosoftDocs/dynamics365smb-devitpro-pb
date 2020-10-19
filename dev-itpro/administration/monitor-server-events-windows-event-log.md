---
title: "Monitoring Microsoft Dynamics 365 Business Central Server Events in Event Viewer"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: da2944cc-063d-452d-968c-23b90c547600
caps.latest.revision: 28
---
# Monitoring Business Central Server Events Using Event Viewer
Events that occur on the [!INCLUDE[server](../developer/includes/server.md)] instances can be recorded in event logs on the computer that is running [!INCLUDE[server](../developer/includes/server.md)]. You can view the events by using Event Viewer.  
  
##  <a name="ViewEventViewer"></a> About Business Central Server Events in Event Viewer  
Events that occur on [!INCLUDE[server](../developer/includes/server.md)] instances are recorded in the event channels specific to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and also in the general Windows Application log. Event channels provide a way to collect and view events from a specific event trace provider. This differs from the Windows Application log which contains system-wide events from multiple publishers \(applications and components\).   

## Business Central channel logs
In the Event Viewer console tree, open **Applications and Services Logs** > **Microsoft** > **DynamicsNAV**.
 
### Server folder

The **Server** folder contains events from the event trace provider called **Microsoft-DynamicsNAV-Server**. The events are recorded in the following logs:  
  
|Log|Description|  
|---------|-----------------|  
|Admin|Includes events that target end users and IT administrators. These events typically indicate a problem that requires action to resolve the problem. An example of an admin event is a tenant database failing to mount on the [!INCLUDE[server](../developer/includes/server.md)] instance.<br /><br /> For a list and description of these events, see [Business Central Server Admin and Operational Events](server-events.md).|  
|Operational|Includes events that provide information about an operation that occurred on [!INCLUDE[server](../developer/includes/server.md)] instances. These events are typically ordinary operating events that do not require any action but can be used to analyze and diagnose a problem. An example of an operational event is the shutting down of the [!INCLUDE[server](../developer/includes/server.md)] instance.<br /><br /> For a list and description of these events, see [Business Central Server Admin and Operational Events](server-events.md).|  
|Debug|Includes the trace event types: SQL (SQLTracing), service calls (ServiceCalls), and AL function calls (ALTracing).  For more information about the different trace events and others ways to monitor them, see [Business Central Server Trace Events](server-trace-events.md) and [Monitoring Business Central Server Events](monitor-server-events.md) .<br /><br /> **Note:** In Event Viewer, this log is hidden and disabled by default. For information about how to show and enable this log, see [Enable Business Central Debug Logs in Event Viewer](use-Event-Viewer-Collect-View-Trace-Events.md).|  

### Common folder 

The **Common** folder contains telemetry events from the event trace provider called **Microsoft-DynamicsNAV-Common**. This folder contains strictly telemetry events, which have IDs 700-707. The telemetry events are recorded in the following logs:  
      
|Log|Description|  
|---------|-----------------|  
|Admin|Includes custom telemetry trace events that are emitted from the application. These are events that are sent by [SENDTRACETAG method](../developer/methods/devenv-sendtracetag-method.md) calls from inside the application. <br /><br /> For more information, see [Instrumenting an Application for Telemetry](../developer/devenv-instrument-application-for-telemetry.md).<br /><br /> **Note** The [!INCLUDE[server](../developer/includes/server.md)] instance includes a configuration setting called **Diagnostic Trace Level** (`TraceLevel` in the customsettings.config file) that enables you to specify the lowest severity level of telemetry events to be recorded in the event log, or even turn off telemetry event logging altogether. If you do not see the expected events, then verify the [!INCLUDE[server](../developer/includes/server.md)] instance configuration with an administrator. For information, see [Configuring Business Central Server](configure-server-instance.md#General).|  
|Operational|Not applicable.|  
|Debug|Includes system telemetry trace events that occur.<br /><br /> **Note:** In Event Viewer, this log is hidden and disabled by default. For information about how to show and enable this log, see [Enable Business Central Debug Logs in Event Viewer](use-Event-Viewer-Collect-View-Trace-Events.md).|  
  
## Application log  
  
The Application log includes admin and operational type events \(errors, warnings, and information messages\) that occur on the [!INCLUDE[server](../developer/includes/server.md)] instance.  
  
To view the **Application** log, in the console tree, choose **Windows Logs**, **Applications**.  
  
The events in this log are the same events that are recorded in the **Admin** and **Operation** logs in the **DynamicsNAV** > **Server** channel. Therefore, you can consider the **Application** log to be a secondary log for these events. Unless you are using System Center Operations Manager to monitor [!INCLUDE[server](../developer/includes/server.md)] events, you can disable logging [!INCLUDE[server](../developer/includes/server.md)] events to the Windows Application log and rely on **Applications and Services Logs** instead. For more information, see [Disable Logging Events to the Windows Application Log](disable-Logging-Events-Windows-Application-Log.md).  
  
> [!NOTE]  
>  Trace events are not included in this log.  

## Filtering Dynamics Server Events in Event Viewer  
By default, the [!INCLUDE[server](../developer/includes/server.md)] logs contain events of all levels \(error, warning, and information\) for all [!INCLUDE[server](../developer/includes/server.md)] instances. You can use the filtering functionality that is available in Event Viewer to display only [!INCLUDE[server](../developer/includes/server.md)] instance events that meet specific criteria. For example, if you have several [!INCLUDE[server](../developer/includes/server.md)] instances, you can filter logs to show only events from a specific [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see the following example.  
  
 **Example**  
  
 Your [!INCLUDE[server](../developer/includes/server.md)] is running several instances that are configured with multiple tenants. In Event Viewer, you want to view only errors that occurred in the last 24 hours on the tenant *MyTenant1* of the [!INCLUDE[server](../developer/includes/server.md)] instance *MyNavServerInstance1*.  
  
### To filter the event log  
  
1.  For example, in the console tree of Event Viewer, choose **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** > **Server**.  
  
2.  Select the **Admin** log.  
  
3.  In the **Action** pane, choose **Filter Current Log**.  
  
     The **Filter Current Log** window opens.  
  
4.  On the **Filter** tab, set the **Logged** drop-down list to **Last 24 hours**.  
  
5.  In the **Error Level** section, select the **Error** check box.  
  
6.  Choose the **XML** tab.  
  
     XML similar to the following is displayed:  
  
    ```  
    <QueryList>  
      <Query Id="0" Path="Microsoft-DynamicsNAV-Server/Admin">  
        <Select Path="Microsoft-DynamicsNAV-Server/Admin">  
          *[System[(Level=2) and TimeCreated[timediff(@SystemTime) <= 604800000]]]  
      </Query>  
    </QueryList>  
    ```  
  
     `Microsoft-DynamicsNAV-Server` indicates that [!INCLUDE[server](../developer/includes/server.md)] is the provider of the events in the log.  
  
7.  Select the **Edit** query manually check box, and then choose the **Yes** button.  
  
8.  In the `<Select Path="Microsoft-DynamicsNAV-Server/Admin">` element, after `*[System[(Level=2) and TimeCreated[timediff(@SystemTime) <= 86400000]]]`, add the following lines:  
  
    ```  
    and  
    *[EventData[Data[@Name='tenantId'] and Data  = 'MyTenant1']]  
    and  
    *[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]  
  
    ```  
  
     The complete XML should look similar to the following XML:  
  
    ```  
    <QueryList>  
      <Query Id="0" Path="Microsoft-DynamicsNAV-Server/Admin">  
        <Select Path="Microsoft-DynamicsNAV-Server/Admin">  
          *[System[(Level=2) and TimeCreated[timediff(@SystemTime) <= 604800000]]]  
          and  
          *[EventData[Data[@Name='tenantId'] and Data  = 'MyTenant1']]  
          and  
          *[EventData[Data[@Name='serverInstanceName'] and Data='MyNavServerInstance1']]  
        </Select>  
      </Query>  
    </QueryList>  
    ```  
  
9. Choose the **OK** button.  
  
 The **Admin** log displays only errors that occurred in the last 24 hours on tenant *Tenant1* and [!INCLUDE[server](../developer/includes/server.md)] instance *MyNavServerInstance1*. The applied filter can be removed. Alternatively, you can save it as a custom view. For more information about filtering in Event Viewer, see [Filter Displayed Events](https://go.microsoft.com/fwlink/?LinkID=516925) and [Advanced XML filtering in the Windows Event Viewer](https://go.microsoft.com/fwlink/?LinkID=516924).  
  
## See Also  
 [Monitoring Business Central Server Events](monitor-server-events.md)    
 [Business Central Server Trace Events](server-trace-events.md)   
 [Monitoring Business Central Server](monitor-server.md)   
 [Monitoring Business Central Server Using Performance Counters](monitor-server-using-performance-counters.md)  
 [Windows Event Viewer](https://go.microsoft.com/fwlink/?LinkID=314067)  