---
title: "GETFIELD Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a9ba69dd-81a2-4e88-b67f-d7370362eae3
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFIELD Method (TestPage)
Gets a field on a test page.  
  
## Syntax  
  
```  
[Field] := TestPage.GETFIELD(Id)  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page for which you want to get a field.  
  
 *Id*  
 Type: Integer  
  
 The ID of the field that you want to get. This ID is from Page Designer.  
  
## Property Value/Return Value  
 Type: TestField  
  
 The field on the test page.  
  
 You cannot declare a variable of type TestField. Instead, you use the **Value** property and assign the value of the field to a variable.  
  
## Remarks  
 To find the ID of a field, in Page Designer, select the field, and then on the **View** menu, choose **Properties**.  
  
 You can use this method if you have a method or a property on a test page with the same name as a field on the page. If you use the \<*TestPage*>.\<*Field*> notation but the Field name is also a method name, then the method takes precedence. To access the field, use the GETFIELD method.  
  
## Example  
 This example requires that you create the following variables and text constants.  
  
|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|CustomerCard|TestPage|Customer Card|Not applicable|  
|AddressField|Text|Not applicable|200|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text001|612 South Sunset Drive|  
  
```  
CustomerCard.OPENEDIT;  
AddressField := CustomerCard.GETFIELD(6).Value;  
IF AddressField <> Text001 THEN  
  ERROR('Incorrect address');  
```  
  
## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)