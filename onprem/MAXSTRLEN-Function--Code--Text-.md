---
title: "MAXSTRLEN Function (Code, Text)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9fadefd8-7add-4dbf-84e8-2eee07ffd1ab
caps.latest.revision: 12
---
# MAXSTRLEN Function (Code, Text)
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
 If you call this function on a Variant, it returns an error.  
  
## Example  
 This example requires that you create the following variables and text constants in the C/AL Globals window.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|City|Text|30|  
|MaxLength|Integer|Not applicable|  
|Length|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Vedbaek|  
|Text001|The MAXSTRLEN function returns %1,\\|  
|Text002|whereas the STRLEN function returns %2|  
  
```  
City := Text000;  
MaxLength := MAXSTRLEN(City);  
Length := STRLEN(City);  
MESSAGE(Text001 + Text002, MaxLength, Length);  
```  
  
 The message window displays the following:  
  
 **The MAXSTRLEN function returns 30,**  
  
 **whereas the STRLEN function returns 7.**  
  
## See Also  
 [Code Data Type](Code-Data-Type.md)   
 [Text Data Type](Text-Data-Type.md)