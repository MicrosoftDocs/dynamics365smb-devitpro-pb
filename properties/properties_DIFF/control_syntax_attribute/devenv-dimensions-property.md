---
title: "Dimensions Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Dimensions Property
Sets the dimensions of a variable that is to create a multi-dimensional variable (array).  
  
## Applies to  

Variables  
  
## Remarks  

Enter the dimensions as a semicolon-delimited list of integers, where each number defines the number of elements in that dimension. The maximum number of dimensions is 10 and the total number of elements in all dimensions is 1,000,000.  
  
For example, to define an integer array with dimensions 3 x 3 x 4, start by creating an integer variable called A. Set the **Dimensions** property to a value of **3;3;4**. To access the elements in the array, use either of the following:  
  
- A\[2\]\[3\]\[2\]  
  
- A\[2,3,2\]  
  
Indexes start at a value of 1 (not 0 as in some programming languages).  
  
## See Also  

[Array Methods](../methods/devenv-array-methods.md)  
[Properties](devenv-properties.md)  