---
title: "Application Validation Service Diagnostics Overview"
description: "The application validation service diagnostics"
ms.author: thpeder
ms.custom: na
ms.date: 05/18/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: thpeder
---

# Application Validation Service Diagnostics Overview

When an app is submitted for AppSource, a per-tenant extension is submitted, or a tenant is about to be upgraded, the Application Validation Service is run. This article gives an overview of the diagnostics that running the AVS tool gives, sorted by ID and severity. For more information about a specific diagnostic, choose the ID.

|ID|Message|Default Severity|
|--|-----------|----------------|
|[AVS0001](diagnostic-avs0001.md)|The 'app.json' could not be found in the specified package.|Error|
|[AVS0002](diagnostic-avs0002.md)|The runtime version '{0}' of the extension is too recent for the release of Business Central being validated. The latest supported runtime version is '{1}'.|Error|
|[AVS0003](diagnostic-avs0003.md)|The file '{0}' could not be added to the file system because a file with the same name already exists.|Error|
|[AVS0004](diagnostic-avs0004.md)|The specified ruleset could not be loaded. Details: {0}|Error|
|[AVS0005](diagnostic-avs0005.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be found.|Error|
|[AVS0006](diagnostic-avs0006.md)|The runtime version '{0}' is not supported for the release '{1}' because its latest supported runtime version is '{2}'.|Error|
|[AVS0007](diagnostic-avs0007.md)|The release version '{0}' is not supported.|Error|
|[AVS0101](diagnostic-avs0101.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be found.|Error|
|[AVS0102](diagnostic-avs0102.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be loaded.|Error|
|[AVS0103](diagnostic-avs0103.md)|The extension with ID '{0}' appears multiple times in the submission, while all extensions submitted are expected to have a unique ID.|Error|
|[AVS0104](diagnostic-avs0104.md)|The extension '{0}' by '{1}' (version '{2}') is a runtime package, which is not allowed in Business Central online.|Error|
|[AVS0105](diagnostic-avs0105.md)|The submission must target at least one existing release of Business Central. Verify the dependencies specified in the app.json of all the apps submitted. For more information about the target release computation, see the examples in the Technical Validation Checklist at https://aka.ms/CheckBeforeYouSubmit.|Error|
|[AVS0106](diagnostic-avs0106.md)|The submission must target at least one existing country/region of Business Central. Verify that at least one country/region is marked as 'Available' at aka.ms/bccountries. For more information, see the Technical Validation FAQ, at https://go.microsoft.com/fwlink/?linkid=2182737.|Error|
|[AVS0107](diagnostic-avs0107.md)|The extension '{0}' by '{1}' (version '{2}') has already been uploaded to Business Central for the country/region '{3}' with different content. Remove this extension from your submission, use the same .app file as the one that has already been uploaded to Business Central, or increase the version in the app.json. For more information, see the Technical Validation FAQ, at https://go.microsoft.com/fwlink/?linkid=2182737.|Error|
|[AVS0108](diagnostic-avs0108.md)|The following extension(s) could not be found. Upload the missing extensions and try again. {0}.|Error|
|[AVS0109](diagnostic-avs0109.md)|The per-tenant extension (or one of its dependencies) cannot be deployed as it has missing dependencies or the dependencies are conflicting with currently installed apps. Check if these dependencies are installed.|Error|
|[AVS0110](diagnostic-avs0110.md)|A {0} with ID {1} is found in both {2} and {3}. Object IDs must be unique per environment. Resolve the conflict in your extension by using a different ID and upload the extension again.|Warning|
|[AVS0111](diagnostic-avs0111.md)|A {0} with name '{1}' is found in both {2} and {3}. Object names must be unique per environment. Resolve the conflict in your extension by using a different name and upload the extension again.|Warning|
|[AVS0112](diagnostic-avs0112.md)|A {0} with ID {1} in '{2}' is found in both {3} and {4}. {0} IDs must be unique within the base objects and their extension objects. Resolve the conflict in your extension by using a different ID and upload the extension again.|Warning|
|[AVS0113](diagnostic-avs0113.md)|A {0} with name '{1}' in '{2}' is found in both {3} and {4}. {0} names must be unique within the base objects and their extension objects. Resolve the conflict in your extension by using a different name and upload the extension again.|Warning|

