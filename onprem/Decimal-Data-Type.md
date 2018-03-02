---
title: Decimal Data Type
description: In Dynamics NAV, the Decimal data type denote decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.  
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1dbd3bd0-9cd2-4e2a-a959-3942fcca60ee
caps.latest.revision: 13
manager: edupont
---
# Decimal Data Type in Dynamics NAV
This simple data type denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.  

## Example  
 The following are examples of decimal values.  

```  
546.88  
3425.57  
```  

## Example  
 The following is not a decimal, but rather an [Integer Data Type](Integer-Data-Type.md).  

```  
342  
```  

## Changes from Previous Versions  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the Decimal data type is mapped to the Microsoft .NET Framework common language runtime \(CLR\) Decimal data type and the precision and limits behave slightly differently than the Binary Coded Decimal \(BCD\) data type in previous versions of C/AL. This example shows how decimal data types are different in [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

 The following table shows the limits for variables of type DECIMAL in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] and in previous versions.  

|Limit|[!INCLUDE[navnowlong](includes/navnowlong_md.md)]|Previous versions of [!INCLUDE[navnow](includes/navnow_md.md)]|  
|-----------|------------------------------|-----------------------------------------------|  
|Maximum format value.<br /><br /> This is the maximum value that can be:<br /><br /> -   Formatted into a TEXT variable by the FORMAT function.<br />-   Input from the UI or XMLPorts.<br />-   Assigned directly in source code.|+/- 999,999,999,999,999.99|+/- 999,999,999,999,999.99|  
|Maximum field data type value.<br /><br /> This is the maximum value that a field variable in a record can hold while not being persisted.|+/- 999,999,999,999,999.99|+/- \(9,99999999999999E+63\)|  
|Maximum persisted value.<br /><br /> This is the maximum value that can be stored in the database.|Can read previous stored values but cannot store values outside the formatting range since field variables cannot be assigned values outside the formatting range.|+/- 999.999.999.999.999.999,99|  
|Maximum calculating value.<br /><br /> This is the maximum value that can be calculated by code statements while not assigning to a field variable, storing to the database, or formatting to a text variable.|+/- 79,228,162,514,264,337,593,543,950,335|+/- \(9,99999999999999E+63\)|  

 This table shows that the maximum safe value that will work on all versions of [!INCLUDE[navnow](includes/navnow_md.md)] is +/- 999,999,999,999,999.99.  

 It is possible to assign to a variable the maximum value that can be formatted and then multiply that variable by a large positive number, thereby generating a greater value. However, we do not recommend doing this. If you do, you will get errors if you attempt to format this variable to a text variable or assign the variable to a field variable in a record.  

## See Also  
 [BigInteger Data Type](BigInteger-Data-Type.md)   
 [Integer Data Type](Integer-Data-Type.md)   
 [ABS Function \(Decimal, Integer, BigInteger\)](ABS-Function--Decimal--Integer--BigInteger-.md)   
 [POWER Function \(Decimal, Integer, BigInteger\)](POWER-Function--Decimal--Integer--BigInteger-.md)   
 [RANDOM Function \(Integer\)](RANDOM-Function--Integer-.md)   
 [RANDOMIZE Function \(Integer\)](RANDOMIZE-Function--Integer-.md)   
 [ROUND Function \(Decimal\)](ROUND-Function--Decimal-.md)
