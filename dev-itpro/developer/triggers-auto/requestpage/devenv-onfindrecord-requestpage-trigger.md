---
title: "OnFindRecord (Request Page) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/14/2021
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

# OnFindRecord (Request Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Overrides the default page behavior and enables you to specify which record you want to display when the page opens.



## Syntax
```
trigger OnFindRecord(Which: Text): Ok
begin
    ...
end;
```

### Parameters

*Which*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Text or code value with the following options:
- (a dash): First record,
+ (a plus sign): Last record,
=\<\>: Record defined in the Rec variable or the closest match.  


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)
**true** if the specified record was found, otherwise, **false**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnFindRecord (Page) Trigger](../page/devenv-onfindrecord-page-trigger.md)
