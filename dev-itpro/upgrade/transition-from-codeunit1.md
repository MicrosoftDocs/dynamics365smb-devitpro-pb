---
title: "Transitioning from Codeunit 1"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Transitioning from Codeunit 1 to System Codeunits

With [!INCLUDE[prodshort](../developer/includes/prodshort.md)], codeunit 1 **Application Management** has been removed and replaced with new System codeunits. No functionality has been removed by this change. All system method triggers, event publishers, and their code have been moved to other codeunits.

However, this change will affect the upgrade process from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] and how you develop going forward.

## Overview

The foundation of this change is events - publishers and subscribers. System codeunits do not contain code. They only contain event publishers. Instead of running codeunit 1 and calling respective functions, [!INCLUDE[server](../developer/includes/server.md)] runs system codeunits. The system codeunits will in turn raise published events. There are various management codeunits that subscribe to these events. Like codeunit 1, these subscriber codeunits contain method triggers and integration event publishers, which means that they can call application functionality and raise events. The following figure illustrates the process:

![System event publishers](../media/system-event-publishers.png "system event publishers")

### About system codeunits
-    They have IDs in the 2 billion range.
-    You cannot modify them.
-    Currently, we do not recommend that code subscribes to the events in the new system codeunits 2000000001..2000000010 directly. Although this is not blocked, it might be in a future release. Instead, you should subscribe to one of the integration events which now reside next to the business logic.

  
## Mapping Codeunit 1 method triggers to events

The following table lists the mappings between the codeunit 1 triggers and event publishers and the new method trigger and publishers in the management codeunits.

|Codeunit 1 trigger|New Codeunit ID|New method|
|------------------|-------------|-----------------|
|CompanyClose|40|CompanyClose
|CompanyOpen|40|CompanyOpen
|GetSystemIndicator|40|GetSystemIndicator
|OnAfterCompanyClose|40|OnAfterCompanyClose
|OnAfterCompanyOpen|40|OnAfterCompanyOpen
|OnBeforeCompanyClose|40|OnBeforeCompanyClose
|OnBeforeCompanyOpen|40|OnBeforeCompanyOpen
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
|OnRoleCenterOpen|9170|OnRoleCenterOpen
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

## What does this mean for upgrade?

For a full upgrade (application code and data), you have to move any custom logic that was included in the old codeunit 1 into the management codeunits and methods described in the previous section. Any custom code that called into codeunit 1 will also have to be changed to call or subscribe to the new methods. You can this as part of the application code upgrade. 

For a technical upgrade, after you convert your old database to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform, you must import and compile a replacement codeunit 1 object, which you can get from [Codeunit 1 Replacement](codeunit1-replacement.md).

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 
