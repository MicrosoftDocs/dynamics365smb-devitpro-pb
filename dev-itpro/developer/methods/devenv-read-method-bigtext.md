---
title: "READ Method (BigText)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4c804577-36eb-4386-9894-abe270d5df6a
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# READ Method (BigText)
Streams a BigText object that is stored as a BLOB in a table to a BigText variable.  
  
## Syntax  
  
```  
  
[Ok := ] BigText.READ(InStream)  
```  
  
#### Parameters  
 *BigText*  
 Type: BigText  
  
 The BigText variable into which you stream the BLOB.  
  
 *InStream*  
 Type: InStream  
  
 The InStream object type that you use to stream a BLOB to a BigText variable.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the read transaction was successful; otherwise, **false**.  
  
## Remarks  
 To delete the content in a BigText variable, use the CLEAR method.  
  
```  
CLEAR(BigText)  
```  
  
## Example  
 This example shows how to stream a BigText that is stored as a BLOB in a table to a BigText variable.  
  
 This example requires that you define the following variables.  
  
|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|Bstr|BigText|Not applicable|  
|EmployeeRec|Record|Employee|  
|Istream|InStream|Not applicable|  
  
```  
EmployeeRec.FIND('-');  
EmployeeRec.CALCFIELDS(Picture);  
EmployeeRec.Picture.CREATEINSTREAM(Istream);  
Bstr.READ(Istream);  
```  
  
 Use the [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md) to calculate the BlobField. A BlobField is a binary large object \(maximum size 2 GB\) and must be calculated if you want to use it in AL or display it in the application.  
  
## See Also  
 [BigText Data Type](../datatypes/devenv-BigText-Data-Type.md)