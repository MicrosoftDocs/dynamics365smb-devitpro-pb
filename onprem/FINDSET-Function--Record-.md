---
title: "FINDSET Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cf35fdc5-ceaf-45f0-9502-bf9a2edc459d
caps.latest.revision: 19
manager: edupont
---
# FINDSET Function (Record)
Finds a set of records in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] Record.FINDSET([ForUpdate][, UpdateKey])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 If the record is found, then the record is returned in this parameter and any [FlowFields](FlowFields.md) in the record are set to zero. You must update the FlowFields by using the [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md).  
  
 *ForUpdate*  
 Type: Boolean  
  
 Set this parameter to **true** if you want to modify any records in the set; otherwise, set the parameter to **false**.  
  
 If you set this parameter to **true**, then the [LOCKTABLE Function \(Record\)](LOCKTABLE-Function--Record-.md) is immediately run on the table before the records are read.  
  
 If you set this parameter to **false**, then you can still modify the records in the set, but these updates will not be performed optimally.  
  
 The default value is **false**.  
  
 *UpdateKey*  
 Type: Boolean  
  
 Set this parameter to **true** if you want to modify any field value within the current key.  
  
 This parameter only applies if the *ForUpdate* parameter is **true**.  
  
 If you set this parameter to **false**, then you can still modify the records in the set, but these updates will not be performed optimally.  
  
 The default value is **false**.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record set was found; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be found, then a run-time error occurs. If you include a return value, then you must handle any errors.  
  
## Remarks  
 You should use this function only when you explicitly want to loop through a recordset. You should only use this function in combination with **REPEAT**.. **UNTIL**.  
  
## Example  
 This example shows how to use the **FINDSET** function to loop through a set without updating it. This example requires that have a **CopyLine** function and that you create the following variable.  
  
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
 This example shows how to use the **FINDSET** function to loop through a set and update a field that is not within the current key. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SalesLine|Record|Sales Line|  
|DocumentType|Option|Not applicable|  
|DocumentNo|Code|Not applicable|  
  
 This example assumes that you have assigned values to the DocumentType and DocumentNo variables and that you have a **GetNewLocation** function, which returns a value that is a Code data type.  
  
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
 This example shows how to use the **FINDSET** function to loop through a set and update a field that is within the current key. This example requires that you create the following variables.  
  
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
 [FIND Function \(Record\)](FIND-Function--Record-.md)   
 [FINDFIRST Function \(Record\)](FINDFIRST-Function--Record-.md)   
 [FINDLAST Function \(Record\)](FINDLAST-Function--Record-.md)   
 [Record Data Type](Record-Data-Type.md)