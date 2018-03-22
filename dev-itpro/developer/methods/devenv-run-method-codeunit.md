---
title: "RUN Method (Codeunit)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 35b58153-17d6-4906-81e9-489a21ff6ffa
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUN Method (Codeunit)
Loads and executes the unit of AL code you specify. To use this method, you can specify a table associated with the codeunit when you defined the codeunit properties. This allows you to pass a variable with the method. The transaction that the codeunit contains is always committed due to the Boolean return value.  
  
## Syntax  
  
```  
  
[Ok :=] Codeunit.RUN(VAR Record)  
```  
  
#### Parameters  
 *Codeunit*  
 Type: Codeunit  
  
 Identifies the codeunit that you want to run.  
  
 *VAR Record*  
 Type: Record  
  
 This parameter is not always optional. If you specify a table associated with the codeunit, then you can select a record. If you do not specify a table, then you cannot specify a record. However, you must use this parameter to select a record if you attached a record to the codeunit when you defined its properties.  
  
 This parameter is a record data type.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you do not include the optional return value and an error occurs while the codeunit is running, then the AL code that called this codeunit will terminate.  
  
 If you include the return value and an error occurs, then the calling AL code continues to run. This means that you must handle any errors. If you include the return value, the variables used in the codeunit will be cleared before and after the codeunit runs.  
  
 **true** if no errors occurred; otherwise, **false**.  
  
## Example  
 This example runs two codeunits. The first uses a record parameter. The second is defined without a source table. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|FiscalYearCloseInstance|Codeunit|Fiscal Year-Close|  
|AppMgmtInstance|Codeunit|ApplicationManagement|  
|AccountRecord|Record|Accounting Period|  
  
```  
AccountRecord.INIT;  
IF NOT FiscalYearCloseInstance.RUN(AccountRecord) THEN  
  ERROR('Codeunit run failed (with record).');  
IF NOT AppMgmtInstance.RUN THEN  
  ERROR('Codeunit run failed.');  
```  
  
## See Also  
 [Codeunit Data Type](../datatypes/devenv-Codeunit-Data-Type.md)