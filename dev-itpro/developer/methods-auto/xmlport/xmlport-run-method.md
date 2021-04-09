---
title: "Xmlport.Run Method"
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
# Xmlport.Run Method
> **Version**: _Available or changed with runtime version 1.0._

Loads and executes the XmlPort that you specify.


## Syntax
```
 Xmlport.Run(Number: Integer [, RequestWindow: Boolean] [, Import: Boolean] [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the XmlPort to run.
        
*RequestWindow*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specify true to show request page; specify false to run the report and skip the request page. This parameter overrides the setting of the UseRequestPage Property of the XMLPort. If you do not provide a value for the RequestWindow parameter, then the setting of the UseRequestPage property is used. \> Web client does not support request pages with XmlPorts. If the XMLPort will appear in the web client, you should set the value to false; otherwise, you will get an error at runtime.
          
*Import*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the XMLPort imports or exports data. Specify true to run the XmlPort and import data; specify false to export data.This parameter is most relevant when the XmlPort does not use a request page and the Direction Property of the XmlPort is set to Both. In this instance, you use the parameter to specify the direction of the data. If the XmlPort uses a request page, then a direction option appears on the request page that enables the user can choose to import or export data. The Import parameter specifies the default value in the direction on option on the request page. If the Direction property is set to Import or Export, then you must set this parameter to match the direction that is set by the Direction property; otherwise, you will get an error at runtime. The default is true.
          
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to use in the XmlPort. The system will use any filters that are attached to the specified record.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Xmlport Data Type](xmlport-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)