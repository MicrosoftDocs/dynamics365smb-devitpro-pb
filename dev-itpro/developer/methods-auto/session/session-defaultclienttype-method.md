---
title: "Session.DefaultClientType Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Session.DefaultClientType Method
> **Version**: _Available from runtime version 1.0._

Gets the default client that is configured for the server instance that is used by the current session.


## Syntax
```
ClientType :=   Session.DefaultClientType()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*ClientType*
&emsp;Type: [ClientType](../clienttype/clienttype-option.md)
The default client that is configured for the server instance that is used by the current session.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use DefaultClientType in a [GetURL Method](../../methods/devenv-geturl-method.md) call to get the URL of the default client.  

## Example 1

 In the following example, DefaultClientType is used to return the default client type that is configured for the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance that is used by the current session.  

```al
if DefaultClientType = ClientType::Web then  
  Message('The default client is Web client');  
```  

## Example 2

 In the following example, DefaultClientType is used as a parameter in the GetURL method to return the URL of the default client that is configured for the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.  

```al
url := GetURL(DefaultClientType);  
Message('The URL is %1.', url);  
```  

## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)