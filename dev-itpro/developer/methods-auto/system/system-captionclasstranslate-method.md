---
title: "System.CaptionClassTranslate(Text) Method"
description: "Returns a translated version of the caption string."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.CaptionClassTranslate(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a translated version of the caption string. The string is translated to the current local language.


## Syntax
```AL
String :=   System.CaptionClassTranslate(CaptionClassText: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*CaptionClassText*  
&emsp;Type: [Text](../text/text-data-type.md)  
A literal string that defines the caption.  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can use the [SelectLatestVersion Method \(Database\)](../../methods-auto/database/database-selectlatestversion-method.md) to clear the current session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** method trigger in codeunit 42.  


## See Also

[System Data Type](system-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)