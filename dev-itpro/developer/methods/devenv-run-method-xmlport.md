---
title: "RUN Method (XMLport)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1a3b82b8-2f24-4fae-9a45-391cde2de600
caps.latest.revision: 17
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUN Method (XMLport)
Loads and executes the XMLport that you specify.  

## Syntax  

```  
XMLport.RUN (Number [, ReqWindow] [, Import] [, Record])  
```  

#### Parameters  
 *XMLport*  
 Type: XMLport  

 The variable is automatically cleared after this method runs.  

 *Number*  
 Specifies the XMLport to run.  

 *ReqWindow*  

> [!NOTE]  
> This parameter is not supported. You should set this to **false**; otherwise, you will get an error at runtime.

<!--NAV  
Specify **true** to show request page; specify **false** to run the report and skip the request page.  

This parameter overrides the setting of the [UseRequestPage Property](../properties/devenv-UseRequestPage-Property.md) of the XMLPort. If you do not provide a value for the *ReqWindow* parameter, then the setting of the **UseRequestPage** property is used.  
> [!IMPORTANT]  
>[!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] does not support request pages with XMLports. If the XMLPort will appear in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)], you should set the value to **false**; otherwise, you will get an error at runtime.

-->

 *Import*  
 Specifies whether the XMLPort imports or exports data. Specify **true** to run the XMLport and import data; specify **false** to export data.  

 This parameter is most relevant when the XMLport does not use a request page and the [Direction Property](../properties/devenv-Direction-Property.md) of the XMLport is set to **Both**. In this instance, you use the parameter to specify the direction of the data. If the XMLport uses a request page, then a direction option appears on the request page that enables the user can choose to import or export data. The *Import* parameter specifies the default value in the direction on option on the request page.  

 If the Direction property is set to **Import** or **Export**, then you must set this parameter to match the direction that is set by the Direction property; otherwise, you will get an error at runtime.  

 The default is **true**.  

 *Record*  
 The record to use in the XMLport. The system will use any filters that are attached to the specified record.  

## Example  
 The following example creates a codeunit that runs the XMLport that has ID 50002, runs a request page that lets the user set filters, and exports data from the Customer table. On the request page, you can either open the file and view it or save it as an XML document on your computer. This example assumes that you have created an XMLport and saved it with ID 50002. <!--Links For more information about how to create an XMLport, see [How to: Create XMLports](How-to--Create-XMLports.md).--> This example requires that you create the following global variable.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|varRec|Record|Customer|  

```  
XMLPORT.RUN (50002, TRUE, FALSE, varRec);  
```  

## See Also  
 [XMLport Data Type](../datatypes/devenv-XMLport-Data-Type.md)   
 [XMLPort object](../devenv-xmlport-object.md)  
