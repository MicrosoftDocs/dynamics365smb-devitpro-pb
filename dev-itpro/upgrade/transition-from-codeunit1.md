---
title: "Transitioning from Codeunit 1"
ms.custom: na
ms.date: 24/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
## Transitioning from Codeunit 1

With [!INCLUDE[prodshort](includes/prodshort.md)], codeunit 1 Application Management has been removed and replaced with new System codeunits. No functionality has been removed by this change. All system triggers triggers that were in codeunit 1 are now available through the system codeunits.

However, this change will affect the upgrade process from [!INCLUDE[navnow_md](includes/navnow_md.md)] and how you develop going forward.

## About the System Codeunits

System codeunits will be in the 2 billion range, and they cannot be modified. 

System codeunits contain publish business events. These events are special in that they will only allow a single subscriber. As before, subscribers will then either call the application functionality or raise integration events as before.

The following figure illustrates the implementation:

![System event publishers](../media/system-event-publishers.png "system event publishers")   
  
> [!IMPORTANT] 
> It is important that code does not subscribe to the events in the new system codeunits 2000000001..2000000010 directly. Although this is not blocked, it will be in a future release.

## Mapping Codeunit 1 triggers to System events

The following table lists the mappings between the codeunit 1 system trigger and the new events.

 

|Codeunit 1 trigger|New object ID|New function name|
|------------------|-------------|-----------------|
|CompanyOpen|40|CompanyOpen
|GetSystemIndicator|40|GetSystemIndicator
|CompanyClose|40|CompanyClose
|FindPrinter|44|GetPrinterName
|ApplicationVersion|9015|ApplicationVersion
|CustomApplicationVersion|N/A|N/A
|ReleaseVersion|9015|ReleaseVersion
|ApplicationBuild|9015|ApplicationBuild
|CustomApplicationBuild|N/A|N/A
|ApplicationLanguage|43|ApplicationLanguage
|DefaultRoleCenter|9170|DefaultRoleCenterID
|MakeDateTimeText|41|MakeDateTimeText
|GetSeparateDateTime|41|GetSeparateDateTime
|MakeDateText|41|MakeDateText
|MakeTimeText|41|MakeTimeText
|MakeText|41|MakeText
|MakeDateTimeFilter|41|MakeDateTimeFilter
|MakeDateFilter|41|MakeDateFilter
|MakeTextFilter|41|MakeTextFilter
|MakeCodeFilter|41|MakeTextFilter
|MakeTimeFilter|41|MakeTimeFilter
|AutoFormatTranslate|45|AutoFormatTranslate
|ReadRounding|45|ReadRounding
|CaptionClassTranslate|42|CaptionClassTranslate
|GetCueStyle|9701|GetCueStyle
|SetGlobalLanguage|43|SetGlobalLanguage
|ValidateApplicationlLanguage|43|ValidateApplicationLanguage
|LookupApplicationlLanguage|43|LookupApplicationLanguage
|GetGlobalTableTriggerMask|49|GetGlobalTableTriggerMask
|OnGlobalInsert|49|OnGlobalInsert
|OnGlobalModify|49|OnGlobalModify
|OnGlobalDelete|49|OnGlobalDelete
|OnGlobalRename|49|OnGlobalRename
|GetDatabaseTableTriggerSetup|49|GetDatabaseTableTriggerSetup
|OnDatabaseInsert|49|OnDatabaseInsert
|OnDatabaseModify|49|OnDatabaseModify
|OnDatabaseDelete|49|OnDatabaseDelete
|OnDatabaseRename|49|OnDatabaseRename
|OnDebuggerBreak|9500|ProcessOnDebuggerBreak
|LaunchDebugger|9500|OpenDebugger
|OpenSettings|9170|OpenSettings
|OpenContactMSSales|50|OpenContactMSSales
|InvokeExtensionInstallation|2501|InvokeExtensionInstallation
|CustomizeChart|9180|CustomizeChart
|HasCustomLayout|44|HasCustomLayout
|MergeDocument|44|MergeDocument
|ReportGetCustomRdlc|44|ReportGetCustomRdlc
|ReportScheduler|44|ScheduleReport
|OnBeforeOpenSettings|9170|OnBeforeOpenSettings
|OnAfterGetApplicationVersion|9015|OnAfterGetApplicationVersion
|OnBeforeCompanyOpen|40|OnBeforeCompanyOpen
|OnAfterCompanyOpen|40|OnAfterCompanyOpen
|OnRoleCenterOpen|9170|OnRoleCenterOpen
|OnBeforeCompanyClose|40|OnBeforeCompanyClose
|OnAfterCompanyClose|40|OnAfterCompanyClose
|OnAfterGetSystemIndicator|79|OnAfterGetSystemIndicator
|OnAfterFindPrinter|44|OnAfterGetPrinterName
|OnAfterGetDefaultRoleCenter|9170|OnAfterGetDefaultRoleCenter
|OnAfterMakeDateText|N/A|N/A
|OnAfterMakeTimeText|N/A|N/A
|OnAfterMakeText|N/A|N/A
|OnAfterMakeDateTimeFilter|41|OnAfterMakeDateTimeFilter
|OnAfterMakeDateFilter|41|OnAfterMakeDateFilter
|OnAfterMakeTextFilter|41|OnAfterMakeTextFilter
|OnAfterMakeCodeFilter|N/A|N/A
|OnAfterMakeTimeFilter|41|OnAfterMakeTimeFilter
|OnAfterAutoFormatTranslate|45|OnAfterAutoFormatTranslate
|OnAfterCaptionClassTranslate|42|OnAfterCaptionClassTranslate
|OnAfterGetGlobalTableTriggerMask|49|OnAfterGetGlobalTableTriggerMask
|OnAfterOnGlobalInsert|49|OnAfterOnGlobalInsert
|OnAfterOnGlobalModify|49|OnAfterOnGlobalModify
|OnAfterOnGlobalDelete|49|OnAfterOnGlobalDelete
|OnAfterOnGlobalRename|49|OnAfterOnGlobalRename
|OnAfterGetDatabaseTableTriggerSetup|49|OnAfterGetDatabaseTableTriggerSetup
|OnAfterOnDatabaseInsert|49|OnAfterOnDatabaseInsert
|OnAfterOnDatabaseModify|49|OnAfterOnDatabaseModify
|OnAfterOnDatabaseDelete|49|OnAfterOnDatabaseDelete
|OnAfterOnDatabaseRename|49|OnAfterOnDatabaseRename
|OnAfterHasCustomLayout|44|OnAfterHasCustomLayout
|OnAfterReportGetCustomRdlc|9650|OnAfterReportGetCustomRdlc
|OnBeforeOnDatabaseInsert|49|OnBeforeOnDatabaseInsert
|OnBeforeOnDatabaseModify|49|OnBeforeOnDatabaseModify
|OnBeforeOnDatabaseDelete|49|OnBeforeOnDatabaseDelete
|OnBeforeOnDatabaseRename|49|OnBeforeOnDatabaseRename
|OnEditInExcel|6710|OnEditInExcel
|OnInstallAppPerDatabase|N/A|N/A
|OnInstallAppPerCompany|N/A|N/A
|OnCheckPreconditionsPerDatabase|9900|OnCheckPreconditionsPerDatabase
|OnCheckPreconditionsPerCompany|9900|RaiseOnCheckPreconditionsPerCompany
|OnUpgradePerDatabase|9900|OnUpgradePerDatabase
|OnUpgradePerCompany|9900|OnUpgradePerCompany
|OnValidateUpgradePerDatabase|9900|OnValidateUpgradePerDatabase
|OnValidateUpgradePerCompany|9900|OnValidateUpgradePerCompany


## See Also  
 [Converting a Database](Converting-a-Database.md)  
 
