---
title: "AppSourceCop Rule AS0085"
description: "The 'application' property must be used for expressing a dependency on the 'Base Application' or the 'System Application' instead of explicit dependencies."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0085
The 'application' property must be used instead of explicit dependencies

## Description
The 'application' property must be used for expressing a dependency on the 'Base Application' or the 'System Application' instead of explicit dependencies. See https://docs.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-application-app-file for additional information.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule reports a diagnostic when the `app.json` of the extension specifies a dependency on the 'Base Application' or 'System Application' extensions by Microsoft.

For more information about the benefits of using the `application` property, see [The Microsoft_Application.app File](../devenv-application-app-file.md).

For more information about the properties in the `app.json`, see [JSON Files](../devenv-json-files.md).

## How to fix this diagnostic?

In order to fix this diagnostic, you have to replace the dependencies specifed on the 'Base Application' and 'System Application'  in the `dependencies` property by the `application` property in the `app.json` of the extension.

## Code example triggering the rule

The `app.json` file of the extension:
```json
{
  [...]
  "dependencies": [
    {
      "appId":  "437dbf0e-84ff-417a-965d-ed2bb9650972",
      "name":  "Base Application",
      "publisher":  "Microsoft",
      "version":  "15.3.0.0"
    },
    {
        "appId":  "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
        "name":  "System Application",
        "publisher":  "Microsoft",
        "version":  "15.3.0.0"
    }
  ],
  [...]
}
```

## Code example not triggering the rule

The `app.json` file of the extension:
```json
{
  [...]
  "application": "17.0.0.0",
  [...]
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  