---
title: "SERIALNUMBER Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 66cf96ca-4a19-495d-8927-078007debe13
caps.latest.revision: 13
manager: edupont
---
# SERIALNUMBER Function (Database)
Gets a string that contains the serial number of the license file for your [!INCLUDE[navnow](includes/navnow_md.md)] system.  
  
## Syntax  
  
```  
  
String := SERIALNUMBER;  
```  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 This string contains the serial number.  
  
## Example  
 This example requires that you create the following text constants and variables in the **C/AL Globals** window.  
  
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
>  The serial number depends on your licensed version of [!INCLUDE[navnow](includes/navnow_md.md)]. The serial number shown here is an example.