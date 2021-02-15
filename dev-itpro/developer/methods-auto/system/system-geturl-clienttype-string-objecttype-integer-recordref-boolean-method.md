---
title: "System.GetUrl Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# System.GetUrl Method
> **Version**: _Available or changed with runtime version 1.0._

Generates a URL for the specified client target that is based on the configuration of the server instance. If the code runs in a multitenant deployment architecture, the generated URL will automatically apply to the tenant ID of the current user.


## Syntax
```
String :=   System.GetUrl(ClientType: ClientType, Company: String, ObjectType: ObjectType, ObjectId: Integer, RecordRef: RecordRef [, UseFilters: Boolean])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*ClientType*  
&emsp;Type: [ClientType](../clienttype/clienttype-option.md)  
Specifies the client that you want to generate the URL for. This parameter is required. If you want to generate a URL that depends on the client that the user is accessing the URL from, choose Current. The following table describes the options.\> A runtime error occurs if the ClientType is set to SOAP or OData but the specified object type and ID has not been published as a web service.
          
*Company*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the company that the URL must contain. If you do not specify a company, the URL will run in the user’s current company.
        
*ObjectType*  
&emsp;Type: [ObjectType](../objecttype/objecttype-option.md)  
Value: Table, Page, Report, Codeunit, Query, or XmlPort. Specifies the object type that the URL must open. If you specify an object type, you must also specify an object ID in the ObjectId parameter. Otherwise, the user will see a runtime error. If you set the ObjectType parameter to Page, you can also specify a record variable in the Record parameter.
          
*ObjectId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the specified object type that the URL must open.
          
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
Specifies the RecordRef variable that specifies which record to open.
        
*UseFilters*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to include filters that are defined on the object as a text string in the URL.
        


## Return Value
*String*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)