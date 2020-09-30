---
title: "Session.CurrentClientType Method"
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
# Session.CurrentClientType Method
Gets the client type that is running in current session.


## Syntax
```
ClientType :=   Session.CurrentClientType()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*ClientType*  
&emsp;Type: [ClientType](../clienttype/clienttype-option.md)  
The client type that is running in current session.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You can use CurrentClientType as a parameter in the [GetURL Method](../system/system-geturl-clienttype-string-objecttype-integer-table-boolean-method.md) to get the URL of the current client.  

## Example  
In the following example, CurrentClientType is used to get the client type for the session and return a message if the session uses the [!INCLUDE[d365fin_tablet_md](../../includes/d365fin_tablet_md.md)].  

```  
if CURRENTCLIENTTYPE = CLIENTTYPE::Tablet then  
  Message('The session is running the Tablet client');  
```  

## Example  
 In the following example, CURRENTCLIENTTYPE is used as a parameter of the [GetURL Method](../system/system-geturl-clienttype-string-objecttype-integer-table-boolean-method.md) to return the URL of the client that invokes the code.  

```  
url := GETURL(CURRENTCLIENTTYPE);  
MESSAGE('The URL is %1.', url);  
```  


## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)