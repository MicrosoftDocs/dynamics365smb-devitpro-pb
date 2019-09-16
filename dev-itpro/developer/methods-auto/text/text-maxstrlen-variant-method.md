---
title: "MaxStrLen Method"
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
# MaxStrLen Method
Gets the maximum defined length of a variant variable. Calling this method always results in a run-time exception.


## Syntax
```
MaxLength :=   Text.MaxStrLen(Variant: Variant)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Variant*  
&emsp;Type: [Variant](../variant/variant-data-type.md)  
The source variant for which you want to find the maximum length.  


## Return Value
*MaxLength*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The maximum length of the string variable.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you call this method on a Variant, it returns an error.  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|City|Text|30|  
|MaxLength|Integer|Not applicable|  
|Length|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Vedbaek|  
|Text001|The MAXSTRLEN method returns %1,\\|  
|Text002|whereas the STRLEN method returns %2|  
  
```  
City := Text000;  
MaxLength := MAXSTRLEN(City);  
Length := STRLEN(City);  
MESSAGE(Text001 + Text002, MaxLength, Length);  
```  
  
 The message window displays the following:  
  
 **The MAXSTRLEN method returns 30,**  
  
 **whereas the STRLEN method returns 7.**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)