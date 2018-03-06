---
title: "Changes in C/AL Behavior and Support from Earlier Versions of Microsoft Dynamics NAV"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
manager: edupont
author: jswymer
---
# Changes in C/AL Behavior and Support from Earlier Versions of Microsoft Dynamics NAV

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Changes-in-C-AL-Behavior-and-Support-from-Earlier-Versions-of-Microsoft-Dynamics-NAV.md).


The following tables provide an overview of the new, removed, or changed C/AL data types, functions, properties, and triggers in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] since the previous version of [!INCLUDE[navnow](includes/navnow_md.md)]. For more information about the changes, see the specific topic about the data type, function, property, or trigger.  

## C/AL Data Types  
 The following table lists the new data types in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Data Type|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|Media|A complex type that encapsulates media (such as images) in the application database for displaying the media with associated records. The data type can be used on table fields and supports the following functions:<br /><br /> -   ImportFile<br />-   ImportInStream<br />-   MEDIAID<br />-   HASVALUE<br />-   EXPORTFILE<br />-   EXPORTSTREAM<br /><br />|  
|MediaSet|A complex type that encapsulates media files, such as images, in application database for displaying the media with associated records. The **MediaSet** data type enables you to include multiple media files as part of a collection on a record. The **MediaSet** data type can be used on table fields and supports the following functions:<br /><br /> -   ImportFile<br />-   ImportInStream<br />-   MEDIAID<br />-   COUNT<br />-   EXPORTMEDIASET<br /><br />|  
|Notification| A complex type for publishing and consuming notifications in the application. Notifications provide a programmatic way to send non-intrusive information to the user interface (UI). The **Notification** data type supports the following functions:<br /><br /> -   ADDACTION<br />-   GETDATA<br />-   ID<br />-   MESSAGE<br />-   RECALL<br />- SCOPE<br />- SEND<br />- SETDATA|  
See the C/AL Functions section that follows for a description of the data type functions.

## C/AL Functions  
### New functions
The following table lists the new functions in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Function|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[ADDACTION Function \(Notification\)](function-notificationaddaction.md)|Specifies an action for the notification.|  
|[GETDATA Function \(Notification\)](function-notificationgetdata.md)|Retrieves data that was passed to a notification instance as specified by a [SETDATA function](function-notificationsetdata.md) call.|  
|[ID Function \(Notification\)](function-notificationid.md)|Specifies the identifier for a notification.|  
|[MESSAGE Function \(Notification\)](function-notificationmessage.md)|Specifies the content of the notification.|  
|[RECALL Function \(Notification\)](function-notificationrecall.md)|Recall a sent notification.|  
|[SCOPE Function \(Notification\)](function-notificationscope.md)|Specifies the context in which the notification appears in the client.|  
|[SEND Function \(Notification\)](function-notificationsend.md)|Sends the notification to the client, where it will display in the UI.|  
|[SETDATA Function \(Notification\)](function-notificationsetdata.md)|Specifies a data property value for the notification. The data is specified as text in a key-value pair.|  
|[APPLICATIONAREA Function](APPLICATIONAREA-Function.md)|Gets or sets the application areas for the current session.|  
|[CAPTIONCLASSTRANSLATE Function](CAPTIONCLASSTRANSLATE-Function.md)|Returns a translated version of the caption string. The string is translated to the current local language.|  
|[CHANGECOMPANY Function \(RecordRef\)](CHANGECOMPANY-Function--RecordRef-.md)|Redirects references to table data from one company to another.|  
|[COUNT Function \(MediaSet\)](COUNT-Function--MediaSet-.md)|Gets the number of media files that are included in a media set of a record.|  
|[EXPORTFILE Function \(Media\)](EXPORTFILE-Function--Media-.md)|Exports a media object that is set up on a record to a file.|  
|[EXPORTFILE Function](EXPORTFILE-Function-MediaSet.md)|Exports the media objects that included in a media set to individual files.|  
|[EXPORTSTREAM Function \(Media\)](EXPORTSTREAM-Function--Media-.md)|Exports a media object that is set up on a record to an OutStream object.|  
|[HASVALUE Function \(Media\)](HASVALUE-Function--Media-.md)|Detects whether a record has a media object in the **Media** data type field.|  
|[IMPORTFILE Function \(Media\)](IMPORTFILE-Function--Media-.md)|Adds media from a file to a media set of a record.|  
|[IMPORTFILE Function \(MediaSet\)](IMPORTFILE-Function--MediaSet-.md)|Adds media from a file to a media set of a record.|  
|[IMPORTSTREAM Function \(Media\)](IMPORTSTREAM-Function--Media-.md)|Adds media from an InStream object to a record.|  
|[IMPORTSTREAM Function \(MediaSet\)](IMPORTSTREAM-Function--MediaSet-.md)|Adds media from an InStream object to a media set of a record.|  
|[ISBYTE Function \(Variant\)](ISBYTE-Function--Variant-.md)|Indicates whether a C/AL variant contains a Byte variable.|  
|[ISTEXTCONSTANT Function \(Variant\)](ISTEXTCONSTANT-Function--Variant-.md)|Indicates whether a C/AL variant contains a text constant.|  
|[MEDIAID Function \(Media\)](MEDIAID-Function--Media-.md)|Get the ID that is assigned to media in the database.|  
|[MEDIAID Function \(MediaSet\)](MEDIAID-Function--MediaSet-.md)|Gets the ID that is assigned to the media set of a record.|  
|[PRODUCTNAME Functions](function-productname.md)|Get the name of the application in three variations: full, marketing, and short.|  

### Changed functions
The following table lists the changed functions in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Function|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|TryFunction|By default, database write transactions in a try function are not allowed. For more information, see [Database write transactions in try functions](Handling-Errors-by-Using-Try-Functions.md#DbWriteTransactions).|  

## C/AL Properties  
 The following table lists the new properties in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Property|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[ApplicationArea Property](ApplicationArea-Property.md)|Sets the application areas that apply to the control.|  
|[Gesture Property](property-gesture.md)|Specifies a gesture that runs the page action on a device with a touch interface.|
|[TestPermissions Property](property-testpermissions.md)|Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.|
|[PromotedOnly Property](PromotedOnly-Property.md)|Specifies whether a page action will appear only on the **Home** tab in the ribbon and not on the tab where it is defined.|    

## C/AL Triggers  
 The following table lists the changed triggers in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Trigger|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[OnAfterTestRun Trigger](trigger-onaftertestrun.md)|Includes a TestPermissions data type parameter for running tests with permission sets.|
|[OnBeforeTestRun Trigger](trigger-onbeforetestrun.md)|Includes a TestPermissions data type parameter for running tests with permission sets.|    

## See Also  
 [Functions Not Supported by Microsoft Dynamics NAV Web Client](Functions-Not-Supported-by-Microsoft-Dynamics-NAV-Web-Client.md)   
 [Page Properties Not Supported by Microsoft Dynamics NAV Web Client](Page-Properties-Not-Supported-by-Microsoft-Dynamics-NAV-Web-Client.md)
