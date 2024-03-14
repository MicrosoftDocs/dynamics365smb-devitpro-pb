---
title: C/AL Behavior Version Support
description: Provides an overview of the new, removed or changed C/AL data types, functions, properties, and triggers from previous versions of Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Changes in C/AL Behavior and Support in Microsoft Dynamics NAV 2018

**Applies to:** [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. [See [!INCLUDE[nav2017](includes/nav2017.md)] version](Changes-in-C-AL-Behavior-and-Support-from-Earlier-Versions-of-Microsoft-Dynamics-NAV-2017.md).

The following tables provide an overview of the new, removed, or changed C/AL data types, functions, properties, and triggers in [!INCLUDE[nav2018_md](includes/nav2018_md.md)] since [!INCLUDE[nav2017](includes/nav2017.md)]. For more information about the changes, see the specific topic about the data type, function, property, or trigger.  

## C/AL Data Types  
 The following table lists the new data types in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Data Type|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|SessionSettings|A complex data type for passing user personalization settings for a client session as an object. You can use the AL methods of the SessionSettings data type to get, set, and send the user personalization settings for the current client session.<br /><br />For more information, see [SessionSettings Data Type](sessionsettings-data-type.md).| 
 
See the C/AL Functions section that follows for a description of the data type functions.

## C/AL Functions  
### New functions
The following table lists the new functions in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  
|Function|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[CANCREATTASK \(TaskScheduler\)](cancreatetask-function.md)|Indicates whether a user has permissions to create or schedule a task.|
|[DISPLAYNAME](displayname-function.md)|Gets the display name that is defined for a company.|
|[Company \(SessionSettings\)](company-function-sessionsettings.md)|Gets or sets the company property in a SessionSettings object. |
|[INIT \(SessionSettings\)](init-function-sessionsettings.md)|Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database.|
|[LANGUAGEID \(SessionSettings\)](languageid-function-sessionsettings.md)|Gets or sets the language ID property in a SessionSettings object.|
|[LOCALEID \(SessionSettings\)](localeid-function-sessionsettings.md)|Gets or sets the locale ID property in a SessionSettings object.|
|[PROFILEAPPID \(SessionSettings\)](profileappid-function-sessionsettings.md)|Gets or sets the ID of an extension, which provides a profile, in a SessionSettings object. |
|[PROFILEID \(SessionSettings\)](profileid-function-sessionsettings.md)|Gets or sets the profile ID property in a SessionSettings object. |
|[PROFILESYSTEMSCOPE \(SessionSettings\)](profilesystemscope-function-sessionsettings.md)|Gets or sets the profile scope property in a SessionSettings object. |
|[REQUESTSESSIONUPDATE \(SessionSettings\)](requestsessionupdate-function-sessionsettings.md)|Passes a SessionSettings object to the client to request a new session that uses the user personalization properties that are set in the object. The current client session is abandoned and a new session is started. |
|[TIMEZONE \(SessionSettings\)](timezone-function-sessionsettings.md)|Gets or sets the time zone property in a SessionSettings object. |

## C/AL Properties  
### New properties
The following table lists the new properties in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Property|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[ObsoleteReason Property](obsoletereason-property.md)|Specifies why a table, field, or key has been marked as **Pending** or **Obsolete** in the **ObsoleteState** property.| 
|[ObsoleteState Property](obsoletestate-property.md)|Marks whether the table, field, or key is or will become obsolete (deprecated).|

### Changed properties
The following table lists the new properties in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  
|Property|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[SubType Property](SubType-Property--Codeunit-.md)|The **Install** option has been added for adding code that runs when you install an extension.| 

## C/AL Triggers  
The following table lists the changed triggers in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

|Trigger|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|OnCheckPreconditionsPerCompany() and OnCheckPreconditionsPerDatabase()| Used to check that certain requirements are met in order to run the upgrade.|
|OnUpgradePerCompany() and OnUpgradePerDatabase()|Used to perform the actual upgrade.|
|OnValidateUpgradePerCompany() and OnValidateUpgradePerDatabase()|Used to check that the upgrade was successful.|
|OnAfterUpgradeCommitPerCompany() and OnAfterUpgradeCommitPerDatabase()|Used to perform post-upgrade tasks after transactions in the previous triggers are committed.|    

## See Also  
[Functions Not Supported by Microsoft Dynamics NAV Web Client](Functions-Not-Supported-by-Microsoft-Dynamics-NAV-Web-Client.md)   
[Page Properties Not Supported by Microsoft Dynamics NAV Web Client](Page-Properties-Not-Supported-by-Microsoft-Dynamics-NAV-Web-Client.md)
