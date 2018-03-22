---
title: "Name Data Type"
ms.custom: na
ms.date: 06/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ead6388f-9985-451d-91d5-6d1e42bb5620
caps.latest.revision: 10
ms.author: solsen
---
# Name Data Type
Sets the name of the object. The name is used for internal identification of the objects, controls, and other elements in AL code and the development environment.  

## Applies To  

-   Codeunits  

-   Fields  

-   Menu items  

-   Pages  

-   Queries  

-   Reports  

-   Tables  

-   XMLports  

## Remarks  
 Unlike the [ID Data Type](devenv-id-data-type.md), the value of the **Name** data type does not have to be unique; however, it is a good practice to use unique names. The Name can be up to 30 characters long. The name must comply with the Common Language Specification (CLS). For example, the first character must be a letter and subsequent characters can be any combination of letters, whole number, and underscores. For more information, see the "Naming" section in [Common Language Specification](http://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.  

 When you use the Name in AL code, it is automatically converted to the value of the [ID Data Type](devenv-id-data-type.md) when the AL code is compiled.  

 For report, page, XMLport, and query objects, the name is the default for the [CaptionML Property](../properties/devenv-captionml-property.md).  

 For controls, the default name is based on the ID.  

## See Also  
 [ID Data Type](devenv-id-data-type.md)   
 [CaptionML Property](../properties/devenv-captionml-property.md)  
 [AL Data Types](devenv-al-data-types.md)   