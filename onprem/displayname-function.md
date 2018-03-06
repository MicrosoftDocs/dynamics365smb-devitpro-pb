---
title: "DISPLAYNAME Function"
ms.custom: na
ms.date: 03/11/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# DISPLAYNAME Function
Gets the current display name for a company as it is stored in the system table **2000000006 Company**. 

## Syntax  

```  
Name := COMPANYPROPERTY.DISPLAYNAME
```  
  
## Return Value  
 Type: Text  
  
The display name of the company as specified in the **Display Name** field in the **Company** table. If no display name is specified, the company name that is stored in the **Name** field is returned. 

## Remarks
As is the case with the standard reports in the [!INCLUDE[navnow](includes/navnow_md.md)] base application, you can use this function to show the company display name instead of the company name in generated reports. The function is intended to be used in the dataitem columns of a report dataset that represent the company name. For example, in existing reports that show the company name, this function enables you to change the reports to show the display name instead of the company name; without having to change the report layout. In columns where the data source is specified by the `COMPANYNAME` function, you just replace the source expression with `CompanyProperty.DisplayName`. (**Note:** In this scenario, do not change the column name because that will be a breaking change with respect to layouts using the dataset).

## Example  
 This example requires that you create the following variables.

|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|MyCompanyName|Text|30|
|MyDisplayName|Text|30|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|Company ''%1'' uses display name ''%2''.|  
  
```  
myDisplayName := CompanyProperty.DisplayName;
myCompanyName := COMPANYNAME;

MESSAGE(Text000, myCompanyName, myDisplayName); 
```  
  
## See Also  