---
title: "SENDTRACETAG Function"
ms.custom: na
ms.date: 27/11/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
author: jswymer
---
# SENDTRACETAG Function
Sends a telemetry trace event to the event log.  
  
## Syntax  
  
```  
SENDTRACETAG(Tag, Category, Verbosity, Message[, DataClassification])  
```  
  
## Parameters  
*Tag*  
Type: Text or code  
  
Specifies an identifier of the trace event. The tag can consist of letters, numbers, and special characters. [!INCLUDE[navnow_md](includes/navnow_md.md)] system telemetry events use an auto-generated, auto-incremented, 7-character tag that includes numbers and letters, such as 000002Q. and 000013P. Try to make your tags unique from these telemetry event tags by, for example, using at least 8 characters or a prefix, like Cronus-0001 and Cronus-0002. 
  
*Category*  
Type: Text or code  
  
Specifies category for the telemetry trace.  
  
*Verbosity*  
Type: Verbosity  
  
Specifies the level of the event. You can set this parameter to either `Critical`, `Error`, `Warning`, `Normal`, or `Verbose`.   
  
*Message*  
Type: Text or code  
  
Specifies the descriptive message for the telemetry trace event. 

*DataClassification*  
Type: DataClassification  
  
Specifies a classification for the data in the telemetry trace event. The following values are supported:

[!INCLUDE[data_classifications](includes/data_classifications.md)] 

<!--

|  Value  |  Description  |  Example  |
|---------|---------------|-----------|
|CustomerContent|Content directly provided/created by admins and users.|<ul><li>Customer generated BLOB or structured storage data</li><li>Customer-owned/provided secrets (passwords, certificates, encryption keys, storage keys)</li></ul>|
|EndUserIdentifiableInformation|(EUII) Data that identifies or could be used to identify the user of a Microsoft service. EUII does not contain Customer content.|<ul><li>User name or display name (DOMAIN\UserName)</li><li>User principle name (name@company.com)</li><li>User-specific IP address</li></ul>| 
|AccountData|Customer billing information and payment instrument information, including administrator contact information, such as tenant administrator’s name, address, or phone number.|<ul><li>Tenant administrator contact information (for example, tenant administrator’s name, address, e-mail address, phone number)</li><li>Customer’s provisioning information</li></ul>|  
|EndUsePseudonymousIdentifiers|EUPI) An identifier created by Microsoft tied to the user of a Microsoft service. When EUPI is combined with other information, such as a mapping table, it identifies the end user. EUPI does not contain information uploaded or created by the customer (Customer content or EUII)|<ul><li>User GUIDs, PUIDs, or SIDs</li><li>Session IDs</li></ul>|
|OrganizationIdentifiableInformation|(OII) Data that can be used to identify a tenant, generally config or usage data. This data is not linkable to a user and does not contain Customer content.|<ul><li>Tenant ID (non-GUID)</li><li>Domain name in e-mail address (xxx@contoso.com) or other tenant-specific domain information</li></ul>| 
|SystemMetadata|Data generated while running the service or program that is not linkable to a user or tenant. |<ul><li>Database table names, database column names, entity names</li></ul>| 

-->

These values correspond to values of the [DataClassification property](dataclassification-property.md) on table objects and fields. Like the DataClassification property, you can use the `DataClassification` parameter to help comply with legislative requirements for collecting, storing, and using user personal information.

>[!IMPORTANT]
>If you do not set the `DataClassification`, the telemetry trace event is automatically classified as `CustomerContent`.

## Remarks 
You use the SENDTRACETAG function for instrumenting the application for telemetry. When the SENDTRACETAG function called, a telemetry trace event is emitted. The event can then be recorded in the Windows event log or collected by other event trace collection tools, like PerfView, Logman, and Performance Monitor. 

A telemetry event is given one of the following event IDs, depending on the `DATACLASSIFICATION`and `VERBOSITY`:

|  DATACLASSIFICATION |  VERBOSITY |    ID|
|----------------------|------|------------------------------|
|All except `CustomerContent` and `EndUserIdentifiableInformation`|Critical|700|
||Error|701|
||Informational|702|
||Verbose|704|
||Warning|705|
|`CustomerContent` or `EndUserIdentifiableInformation`|Critical|707|
||Error|708|
||Informational|709|
||Verbose|711 |
||Warning|712 |

For more information about instrumenting and monitoring telemetry, see [Instrumenting an Application for Telemetry](instrumenting-application-for-telemetry.md) and [Monitoring-Dynamics NAV Server Events](Monitoring-Microsoft-Dynamics-NAV-Server-Events.md). 


## Example 
The following code defines simple telemetry events for the five different severity levels. 
```  
SENDTRACETAG('Cronus-0001', 'Action', VERBOSITY::Critical, 'This is a critical message.', DATACLASSIFICATION::CustomerContent);
SENDTRACETAG('Cronus-0002', 'Action', VERBOSITY::Error, 'This is an error message.',  DATACLASSIFICATION::EndUserIdentifiableInformation);
SENDTRACETAG('Cronus-0003', 'Action', VERBOSITY::Warning, 'This is a warning message.', DATACLASSIFICATION::AccountData);
SENDTRACETAG('Cronus-0004', 'Action', VERBOSITY::Normal, 'This is an informational message.', DATACLASSIFICATION::OrganizationIdentifiableInformation);
SENDTRACETAG('Cronus-0005', 'Action', VERBOSITY::Verbose, 'This is a verbose message.', DATACLASSIFICATION::SystemMetadata);
```  

The events emitted by this code will have the events IDs (listed in the order that the are called): 707, 708, 705, 702, and 704.

## See Also  
[Instrumenting an Application for Telemetry](instrumenting-application-for-telemetry.md) 