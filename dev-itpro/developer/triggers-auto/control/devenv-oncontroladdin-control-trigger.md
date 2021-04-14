---
title: "OnControlAddIn (Control) Trigger"
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

# OnControlAddIn (Control) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Executed when a control add-in on the client sends event information to the server-side business logic.


## Syntax
```
trigger OnControlAddIn(Index: Integer, Data: Text)
begin
    ...
end;
```

### Parameters

*Index*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
An integer identifier that a control add-in sends with the event.  

*Data*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
A text string that a control add-in sends with an event.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
