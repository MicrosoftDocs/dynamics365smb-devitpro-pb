---
title: "STRLEN Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 00ec9a7c-9584-493b-b936-4669923e5d33
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STRLEN Method (Code, Text)
Gets the length of a string you define.  
  
## Syntax  
  
```  
  
Length := STRLEN(String)  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or Code  
  
 The string for which you want to determine the length.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The length of *String*.  
  
## Remarks  
 The difference between the STRLEN method and the [MAXSTRLEN Method \(Code, Text\)](devenv-MAXSTRLEN-Method-Code-Text.md) is that the STRLEN returns the actual number of characters in the input string, whereas MAXSTRLEN returns the maximum defined length of the input string.  
  
 In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], if you call STRLEN on a Variant, then you get an error that the contents of the parameter are not valid. In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], if you call STRLEN on a Variant, then 0 is returned.  
  
## Example  
 This example shows the difference between the STRLEN and the MAXSTRLEN methods.  
  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|City|Text|30|  
|MaxLength|Integer|Not applicable|  
|Length|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Atlanta|  
|Text001|The MAXSTRLEN method returns: %1,\\|  
|Text002|whereas the STRLEN method returns: %2|  
  
```  
City := Text000;  
MaxLength := MAXSTRLEN(City);  
Length := STRLEN(City);  
MESSAGE(Text001 + Text002, MaxLength, Length);  
```  
  
 The message window displays the following:  
  
 **The MAXSTRLEN method returns: 30**  
  
 **whereas the STRLEN method returns: 7**  
  
 This shows that the MAXLENGTH method returns the maximum possible length according to the definition of the string variable, whereas STRLEN returns the actual length of the text.  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)