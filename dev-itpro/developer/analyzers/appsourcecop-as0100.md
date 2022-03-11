---
title: "AppSourceCop Error AS0100"
description: "The 'application' property in the app.json file must be specified on apps targeting the AppSource marketplace."
ms.author: solsen
ms.custom: na
ms.date: 01/03/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0100
The 'application' property in the app.json file must be specified.

## Description
The 'application' property in the app.json file must be specified on apps targeting the AppSource marketplace.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The `application` property is used in order to compute the minimum release of [!INCLUDE [prod_short](../includes/prod_short.md)] for which your extension will be validated and made available for.

For more information about the computation of the minimum release targeted by an AppSource submission, see [Technical Validation Checklist](../devenv-checklist-submission.md#against-which-releases-of-business-central-is-your-submission-validated).


For more information about the usage and benefits of the `application`, see [The Microsoft_Application.app File](../devenv-application-app-file.md).

## How to fix this diagnostic?

In order to fix this diagnostic, you have to specify the `application` property in the `app.json` of the extension.

## Code example triggering the rule

The `app.json` file of the extension:
```json
{
  "id": "<some-guid>",
  "name": "My App",
  "publisher": "My Publisher",
  "version": "1.0.0.0"
}
```

## Code example not triggering the rule

The `app.json` file of the extension:
```json
{
  "id": "<some-guid>",
  "name": "My App",
  "publisher": "My Publisher",
  "version": "1.0.0.0",
  "application": "19.0.0.0",
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  