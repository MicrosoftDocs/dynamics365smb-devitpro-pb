---
title: "MAXSTRLEN Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9fadefd8-7add-4dbf-84e8-2eee07ffd1ab
caps.latest.revision: 12
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MAXSTRLEN Method (Code, Text)
Gets the maximum defined length of a string variable.  
  
## Syntax  
  
```  
  
MaxLength := MAXSTRLEN(String)  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string variable for which you want to find the maximum length.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The maximum length of the string variable.  
  
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
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)