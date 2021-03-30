---
title: "Debugger.Attach Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Debugger.Attach Method
> **Version**: _Available or changed with runtime version 1.0 until version 4.0 where it was deprecated._

Activates the debugger and attaches it to the specified session.


## Syntax
```
[Ok := ]  Debugger.Attach(SessionID: Integer)
```
## Parameters
*SessionID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the session that you want to attach the debugger to.The session can be any of the following:
-   Windows client
-   Web client
-   NAS services session
-   SOAP web services client session
-   OData web services client session
-   Background session
        


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **Attach** method behaves like the **Debug** action on the **Sessions** page.
You can call the **Attach** method to activate the debugger.

## See Also

[Debugger Data Type](debugger-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)