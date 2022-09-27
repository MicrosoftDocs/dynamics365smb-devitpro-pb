---
title: "Fixing compilation errors for technical upgrade"
description: Describes how to fix compilation errors that occur when compiling extensions during a technical upgrade.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Fixing compilation errors for technical upgrade

When running a technical upgrade, part of the process is to compile the published extensions that you want to use on the upgraded environment against the new platform. You compile extensions by running the Repair-NAVApp cmdlet. When you run the Repair-NAVApp cmdlet, you'll get a `Extension compilation failed` error, followed by a message. 

Compilation errors happen when the new platform introduces breaking changes - for example, if we've deprecated platform features used by the system and base applications. To fix the errors, you'll most likely have to make changes to the source code of the extension that failed. You'll then have to publish and upgrade the version of the extension as part of the technical upgrade.

## Known errors

This section lists some known compilation errors that you might get when compiling extensions for the technical upgrade to version 19 or later. The exact errors that you get may vary from what is listed, based on your environment. 

### System application extension

#### O365ActionableMessageWrapper error

``` 
DotNet%20Aliases/src/dotnet.al(775,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.O365ActionableMessageWrapper, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\190\Service\Add-Ins, C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics NAV\Add-Ins\19.0.29480.30268, C:\Program Files\Microsoft Dynamics 365 Business Central\190\Service\, C:\Windows\Microsoft.NET\assembly\'
```

#### Fix

The ActionableMessage feature was removed in version 19. To fix this issue, remove the reference to the Microsoft.Dynamics.Nav.O365ActionableMessageWrapper assembly in the dotnet.al file of the System Application.

```
assembly("Microsoft.Dynamics.Nav.O365ActionableMessageWrapper")
{
    Culture = 'neutral';
    PublicKeyToken = '31bf3856ad364e35';

    type("Microsoft.Dynamics.Nav.O365ActionableMessageWrapper.ActionableMessage"; "ActionableMessage")
    {
    }
} 
```

#### Timeline and TimelineVisualization errors

```
DotNet%20Aliases/src/dotnet.al(268,14): error AL0451: An assembly named 'Microsoft.Dynamics.Framework.UI.WinForms.DataVisualization.Timeline, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, 
C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics NAV\Add-Ins\21.0.45657.0, C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'
DotNet%20Aliases/src/dotnet.al(371,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.Client.TimelineVisualization, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics 
NAV\Add-Ins\21.0.45657.0, C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'
```

#### Fix

The legacy TimelineVisualization add-in was removed in version 21. To fix the error, copy the **Timeline** add-in folder from the earlier version's server installation to the **Add-ins** folder of the new version's server installation. Replace existing files when prompted.

By default, the **Add-ins** folder path is C:\Program Files\Microsoft Dynamics 365 Business Central\<server instance>\Service\Add-ins. You'll have to stop the v21 server instance to copy the files.


### Base application extension

#### 'ActionableMessage' DotNet errors 

```
DotNet%20Wrappers/DotNetActionableMessage.Codeunit.al(9,34): error AL0185: DotNet 'ActionableMessage' is missing
DotNet%20Wrappers/DotNetActionableMessage.Codeunit.al(17,66): error AL0185: DotNet 'ActionableMessage' is missing
DotNet%20Wrappers/DotNetActionableMessage.Codeunit.al(23,62): error AL0185: DotNet 'ActionableMessage' is missing
```

#### Fix

The ActionableMessage feature was removed in version 19. To fix this issue, remove **DotNetActionableMessage.Codeunit.al* from the Base Application. 

#### Timeline and TimelineVisualization DotNet errors

```al
dotnet.al(35,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.Client.TimelineVisualization, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics 
NAV\Add-Ins\21.0.45657.0, C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'

TimelineEvent.Table.al(76,108): error AL0185: DotNet 'DataModel_TransactionDataTable' is missing
TimelineEvent.Table.al(78,25): error AL0185: DotNet 'DataModel_TransactionRow' is missing
TimelineEventChange.Table.al(70,124): error AL0185: DotNet 'DataModel_TransactionChangesDataTable' is missing
TimelineEventChange.Table.al(72,20): error AL0185: DotNet 'DataModel_TransactionChangesRow' is missing
TimelineEventChange.Table.al(91,110): error AL0185: DotNet 'DataModel_TransactionChangesRow' is missing

DotNet%20Aliases/src/dotnet.al(371,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.Client.TimelineVisualization, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics 
NAV\Add-Ins\21.0.45657.0, C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'

ItemAvailabilitybyTimeline.Page.al(169,44): error AL0417: Control add-in '"Microsoft.Dynamics.Nav.Client.TimelineVisualization"' not found
ItemAvailabilitybyTimeline.Page.al(461,27): error AL0185: DotNet 'DataModel_TransactionDataTable' is missing
ItemAvailabilitybyTimeline.Page.al(462,33): error AL0185: DotNet 'VisualizationScenarios' is missing
ItemAvailabilitybyTimeline.Page.al(476,22): error AL0185: DotNet 'DataModel_TransactionChangesDataTable' is missing
ItemAvailabilitybyTimeline.Page.al(556,33): error AL0185: DotNet 'VisualizationScenarios' is missing
```

#### Fix

The legacy TimelineVisualization add-in was removed in version 21. To fix the error, copy the **Timeline** add-in folder from the earlier version's server installation to the **Add-ins** folder of the new version's server installation. Replace existing files when prompted.

By default, the **Add-ins** folder path is C:\Program Files\Microsoft Dynamics 365 Business Central\<server instance>\Service\Add-ins. You'll have to stop the v21 server instance to copy the files.

### PingPong DotNet errors
```al
dotnet.al(27,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.Client.PingPong, PublicKeyToken=null' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics NAV\Add-Ins\21.0.45657.0, C:\Program Files\Microsoft Dynamics 
365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'

Job%20queue/MyJobQueue.Page.al(65,39): error AL0417: Control add-in '"Microsoft.Dynamics.Nav.Client.PingPong"' not found
Job%20queue/ReportInboxPart.Page.al(81,39): error AL0417: Control add-in '"Microsoft.Dynamics.Nav.Client.PingPong"' not found
```

#### Fix

The legacy PingPong add-in was removed in version 21. To fix the error, copy the **PingPong** add-in folder from the earlier version's server installation to the **Add-ins** folder of the new version's server installation. Replace existing files when prompted.

By default, the **Add-ins** folder path is C:\Program Files\Microsoft Dynamics 365 Business Central\<server instance>\Service\Add-ins. You'll have to stop the v21 server instance to copy the files.

<!--
### NavEtsWrapper DotNet errors
```al
DotNet%20Aliases/src/dotnet.al(1039,14): error AL0451: An assembly named 'Microsoft.Exchange.WebServices, Version=15.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-Ins, 
C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\Microsoft Dynamics NAV\Add-Ins\21.0.45947.0, C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\, C:\Windows\Microsoft.NET\assembly\'
MarketingSetup.Page.al(745,25): error AL0185: DotNet 'WebCredentials' is missing
MarketingSetup.Page.al(746,27): error AL0185: DotNet 'OAuthCredentials' is missing
MarketingSetup.Table.al(411,68): error AL0185: DotNet 'WebCredentials' is missing
Todo.Table.al(2953,25): error AL0185: DotNet 'WebCredentials' is missing
EmailLoggingDispatcher.Codeunit.al(96,25): error AL0185: DotNet 'WebCredentials' is missing
EmailLoggingDispatcher.Codeunit.al(97,27): error AL0185: DotNet 'OAuthCredentials' is missing
O365SyncManagement.Codeunit.al(323,22): error AL0185: DotNet 'ExchangeCredentials' is missing
O365SyncManagement.Codeunit.al(336,113): error AL0185: DotNet 'ExchangeCredentials' is missing
O365SyncManagement.Codeunit.al(339,25): error AL0185: DotNet 'WebCredentials' is missing
O365SyncManagement.Codeunit.al(340,27): error AL0185: DotNet 'OAuthCredentials' is missing
O365SyncManagement.Codeunit.al(422,22): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeAddinSetup.Codeunit.al(80,25): error AL0185: DotNet 'WebCredentials' is missing
ExchangeWebServicesClient.Codeunit.al(233,113): error AL0185: DotNet 'OAuthCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(19,108): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(19,174): error AL0185: DotNet 'ExchangeVersion' is missing
ExchangeWebServicesServer.Codeunit.al(52,88): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(54,26): error AL0185: DotNet 'ExchangeVersion' is missing
ExchangeWebServicesServer.Codeunit.al(60,103): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(62,26): error AL0185: DotNet 'ExchangeVersion' is missing
ExchangeWebServicesServer.Codeunit.al(82,92): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(84,26): error AL0185: DotNet 'ExchangeVersion' is missing
ExchangeWebServicesServer.Codeunit.al(90,113): error AL0185: DotNet 'ExchangeCredentials' is missing
ExchangeWebServicesServer.Codeunit.al(92,26): error AL0185: DotNet 'ExchangeVersion' is missing
SetupEmailLogging.Page.al(754,32): error AL0185: DotNet 'OAuthCredentials' is missing
SetupEmailLogging.Page.al(953,33): error AL0185: DotNet 'OAuthCredentials' is missing
AttachmentManagement.Codeunit.al(278,25): error AL0185: DotNet 'WebCredentials' is missing
```
-->
 
## Rewrite code and create new extension versions

To fix compilation errors, you'll create a new version of the extension. You'll need the source files for the earlier version (that is, the version your upgrading from). For Microsoft extensions, like the system application and base application, you can get the source files from the installation media (DVD) for the earlier version, in the **Applications** folder. The basic steps are as follows:

1. Create new AL project in Visual Studio Code for the extension.

    If you're using the Microsoft System Application, start with this project first.

2. Include the source files of the current version in the project.

3. Copy the version 19 System symbols (System.app) file to the **\.alpackages** folder of the project.

    You'll find the System.app file on the installation media (DVD) for version 19 or in the **AL Development Environment** installation folder. By default, the folder is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\190\AL Development Environment.
4. When working with the base application, copy the extension package (.app) for the new version of the Microsoft System Application to **\.alpackages** folder of the project. 

5. Modify the app.json:

    - Increase `"version"` number. You increase the version so you can run a data upgrade later in this process. 
    - Set `"runtime"` to the version you're upgrading to, For example, use `8.0` when upgrading to version 19.
    - Set `"platform"` to the version you're upgrading to. For example, use  `19.0.0.0` when upgrading to version 19.
    - Set `"target"` to `OnPrem`

    For more information about the app.json file, see [App.json file](../developer/devenv-json-files.md#Appjson).

6. Rewrite code to as needed to clear the compilation errors.

    Build the project to see what errors you get. Then, resolve the errors. <!-- For help about most of the errors, see [Rewriting Code for Breaking Changes](deprecated-tables-fix-compile-errors.md).-->

7. Compile and build the new version of the extension.

8. Publish the new version of the extension to the server instance of the environment your upgrading. Run the Repair-NAVApp cmdlet on it to verify that it compiles.

## Next steps

Return to the technical upgrade.
