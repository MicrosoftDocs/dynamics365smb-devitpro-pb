---
title: "SERIALNUMBER Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 66cf96ca-4a19-495d-8927-078007debe13
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SERIALNUMBER Method (Database)
Gets a string that contains the serial number of the license file for your [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] system.  
  
## Syntax  
  
```  
  
String := SERIALNUMBER;  
```  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 This string contains the serial number.  
  
## Example  
 This example requires that you create the following text constants and global variables.  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|The serial number for this software package is:\\%1|  
  
|Name|DataType|Length|  
|----------|--------------|------------|  
|SN|Text|30|  
  
```  
SN := SERIALNUMBER;  
MESSAGE(Text000, SN);  
```  
  
 The output of this example is as follows:  
  
 **The serial number for this software package is:**  
  
 **W1-ZA-002-6R75A-7**  
  
> [!NOTE]  
>  The serial number depends on your licensed version of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)]. The serial number shown here is an example.