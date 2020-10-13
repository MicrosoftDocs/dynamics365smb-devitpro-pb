---
title: "The ID range assigned to the extension must be within the allowed range"
description: Explains AppSourceCop Rule AS0084.
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0084
The ID range assigned to the extension must be within the allowed range  

## Description
The ID range assigned to the extension must be within the range allowed for AppSource applications.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates that the ID range specified in the `app.json` of your extension is contained within the range allowed for AppSource application.

For more information about the object ID ranges in Business Central, see [Object Ranges in Dynamics 365 Business Central](../devenv-object-ranges.md).

For more information about the properties in the `app.json` file, see [JSON Files](../devenv-json-files.md).

## How to fix this diagnostic

If you are targetting the AppSource markeplace, you need to update the ID range in your `app.json` file with the one that Microsoft provided you with.

If you are not targeting the AppSource markeplace, you can suppress this rule using [rulesets](../devenv-using-code-analysis-tool-with-rule-set.md).

## Code example triggering the rule

The `app.json` file of the extension:
```json
{
   [...]
   "idRanges": [
    {
      "from": 50100,
      "to": 50149
    }
    [...]
  ]
}
```

The ID range specified is not contained in the range allowed for AppSource applications. 

## Code example not triggering the rule

The `app.json` file of the extension:
```json
{
   [...]
   "idRanges": [
    {
      "from": 1000000,
      "to": 1000100
    }
    [...]
  ]
}
```
The ID range specified is contained in the range allowed for AppSource applications. 

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
