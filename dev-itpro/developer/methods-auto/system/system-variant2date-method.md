---
title: "Variant2Date Method"
ms.author: solsen
ms.custom: na
ms.date: 09/16/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Variant2Date Method
Gets a date from a variant.


## Syntax
```
Date :=   System.Variant2Date(Variant: Variant)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Variant*  
&emsp;Type: [Variant](../variant/variant-data-type.md)  
The input variant.  


## Return Value
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example  
 This example requires that you create the following variables.  

|Name|DataType|  
|----------|--------------|  
|TestDate|Date|  
|variant1|Variant|  

```  
variant1 := TODAY;  
TestDate := VARIANT2DATE(variant1);  
```  


## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)