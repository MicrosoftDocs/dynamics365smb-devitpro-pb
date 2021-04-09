---
title: "Session.IsSessionActive Method"
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
# Session.IsSessionActive Method
> **Version**: _Available or changed with runtime version 1.0._

Tests if the specified SessionID is active on the server instance where it was started.


## Syntax
```
Ok :=   Session.IsSessionActive(SessionID: Integer)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*SessionID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the session that you want to test if it is still active.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the specified SessionID is active on the server instance where it was started, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
Use this method to test if a session has completed or is still active, for example if you want to check that a session started with StartSession is still running.  

>[!NOTE]     
>The method looks for sessions on the local machine.


## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)