---
title: "FindSet Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# FindSet Method
Finds a set of records in a table based on the current key and filter.

## Syntax
```
[Ok := ]  Table.FindSet([ForUpdate: Boolean], [UpdateKey: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*ForUpdate*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any records in the set; otherwise, set the parameter to false.If you set this parameter to true, then the LOCKTABLE function (Record) is immediately run on the table before the records are read. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          
*UpdateKey*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any field value within the current key. This parameter only applies if the ForUpdate parameter is true. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You should use this method only when you explicitly want to loop through a recordset. You should only use this method in combination with **REPEAT**.. **UNTIL**.  
  
## Example  
 This example shows how to use the **FINDSET** method to loop through a set without updating it. This example requires that have a **CopyLine** method and that you create the following variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SalesLine|Record|Sales Line|  
  
```  
SalesLine.SETFILTER("Purch. Order Line No.",'<>0');  
IF SalesLine.FINDSET THEN BEGIN  
  REPEAT  
    CopyLine(SalesLine);  
  UNTIL SalesLine.NEXT = 0;  
END;  
```  
  
## Example  
 This example shows how to use the **FINDSET** method to loop through a set and update a field that is not within the current key. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SalesLine|Record|Sales Line|  
|DocumentType|Option|Not applicable|  
|DocumentNo|Code|Not applicable|  
  
 This example assumes that you have assigned values to the DocumentType and DocumentNo variables and that you have a **GetNewLocation** method, which returns a value that is a Code data type.  
  
```  
SalesLine.SETRANGE("Document Type",DocumentType);  
SalesLine.SETRANGE("Document No.",DocumentNo);  
IF SalesLine.FINDSET(TRUE, FALSE) THEN BEGIN  
  REPEAT  
    SalesLine."Location Code" := GetNewLocation(SalesLine);  
    SalesLine.MODIFY;  
  UNTIL SalesLine.NEXT = 0;  
END;  
```  
  
## Example  
 This example shows how to use the **FINDSET** method to loop through a set and update a field that is within the current key. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SalesShptLine|Record|Sales Shipment Line|  
|SalesShptLine2|Record|Sales Shipment Line|  
|SalesLine|Record|Sales Line|  
  
```  
SalesShptLine.SETCURRENTKEY("Order No.","Order Line No.");  
SalesShptLine.SETRANGE("Order No.",SalesLine."Document No.");  
SalesShptLine.SETRANGE("Order Line No.",SalesLine."Line No.");  
IF SalesShptLine.FINDSET(TRUE, TRUE) THEN BEGIN  
  REPEAT  
    SalesShptLine2 := SalesShptLine;  
    SalesShptLine2."Order Line No." := SalesShptLine."Order Line No." + 10000;  
    SalesShptLine2.MODIFY;  
  UNTIL SalesShptLine.NEXT = 0;  
END;  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)