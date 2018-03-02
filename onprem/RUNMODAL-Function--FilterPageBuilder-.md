---
title: "RUNMODAL Function (FilterPageBuilder)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e3df5d91-e3d8-4f54-9450-01571aa4f5a4
caps.latest.revision: 4
manager: edupont
---
# RUNMODAL Function (FilterPageBuilder)
Builds and runs the filter page that includes the filter controls that are stored in FilterPageBuilder object instance.  
  
## Syntax  
  
```  
[Ok :=] FilterPageBuilder.RUNMODAL()  
```  
  
## Return Value  
 Type: Boolean  
  
 **true** if the user selects the **OK** button on the filter page; otherwise, **false**.  
  
## Remarks  
 The page is run modally and includes an **OK** and **Cancel** button for closing to modal popup.  
  
 You can call the [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md) function to retrieve the current filter view that is configured on the filter control and apply to the record.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view. The GETVIEW function is used to capture that filter view from the FilterPageBuilder object, and then apply it to the record.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varFilterPageBuilder|FilterPageBuilder||  
|varDefaultView|Text||  
  
```  
varDateItem := 'Date record';  
varDateRecord.SETFILTER("Period End", '12122015D');  
varDateRecord.SETFILTER("Period Start", '01012015D');  
varDefaultView := varDateRecord.GETVIEW;  
varFilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  
varFilterPageBuilder.SETVIEW(varDateItem, varDefaultView);  
IF varFilterPageBuilder.RUNMODAL = TRUE THEN  
  varDateRecord.SETVIEW(varFilterPageBuilder.GETVIEW(varDateItem));  
  
```  
  
## See Also  
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDRECORDREF Function](ADDRECORDREF-Function.md)   
 [ADDTABLE Function](ADDTABLE-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [SETVIEW Function](SETVIEW-Function.md)   
 [COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)   
 [NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)