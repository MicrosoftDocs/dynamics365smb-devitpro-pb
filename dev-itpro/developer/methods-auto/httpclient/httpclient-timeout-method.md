---
title: "HttpClient.Timeout Method"
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
# HttpClient.Timeout Method
Gets or sets the duration in milliseconds to wait before the request times out.


## Syntax
```
[CurrentTimeout := ]  HttpClient.Timeout([SetTimeout: Duration])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*SetTimeout*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
The duration in milliseconds to wait before the request times out.  


## Return Value
*CurrentTimeout*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
The duration in milliseconds to wait before the request times out.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The *SetTimeout* duration is limited by the **NavHttpClientMaxTimeout** parameter that is configured for [!INCLUDE[server](../../includes/server.md)] instance. If you set the duration to a value that is greater than the value of the  **NavHttpClientMaxTimeout** parameter, a 'NavNclHttpClientTimeoutTooLargeException' error is thrown. The default value of the **NavHttpClientMaxTimeout** parameter is 00:05:00. To change the **NavHttpClientMaxTimeout** parameter, see [Configuring Business Central Server](../../../administration/configure-server-instance.md#Development).

## See Also

[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)