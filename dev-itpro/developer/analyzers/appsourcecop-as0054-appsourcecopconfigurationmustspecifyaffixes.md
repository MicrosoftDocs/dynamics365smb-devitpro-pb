---
title: "The AppSourceCop configuration must specify the set of affixes used by the application"
ms.author: solsen
ms.custom: na
ms.date: 08/25/2020
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
# AppSourceCop Rule AS0054
The AppSourceCop configuration must specify the set of affixes used by the application  

## Description
The AppSourceCop configuration must specify one of the following properties: 'mandatorySuffix', 'mandatoryPrefix', or 'mandatoryAffixes'. The use of these affixes is validated by the AppSourceCop analyzer and helps prevent conflicts between different AppSource applications.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
In the `AppSourceCop.json` configuration file, use the `mandatorySuffix`, `mandatoryPrefix`, or `mandatoryAffixes` to specify which affixes apply for this particular extension. For example:

```
{
    "mandatoryAffixes": [ "Foo", "Bar" ]
}
```
For more information, see [AppSourceCop Rule AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md).

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  