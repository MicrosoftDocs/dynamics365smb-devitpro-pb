---
title: "ENCRYPT Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cf02c46d-2ee2-4d90-9331-518abac5d83a
author: SusanneWindfeldPedersen
---

 

# ENCRYPT Method
Takes a string as input and returns the encrypted value of the string.  

## Syntax  

```  
String := ENCRYPT(Str)  
```  

#### Parameters  
 *Str*  
 Value: Text or Code  

 The input string that will be encrypted.  

> [!IMPORTANT]  
>  The input string cannot exceed a length of 215 plain characters. If the input string includes special characters the length is even more reduced.  

## Property Value/Return Value  
 Value: Text or Code  

 The output string that is encrypted.  

## Exceptions  
 If encryption is not enabled or the encryption key is not found, the following error will be displayed: **An encryption key is required to complete the request**.  

## Remarks  

## Example  
 The code example requires that you create the following text constant in the **C/AL Globals** window.  

 **Text** Text000  

```  
Text000 := ‘ABC123’;  
MESSAGE(‘Value: ‘ + Text000)  
Text000 := ENCRYPT(Text000);  
MESSAGE(‘Value: ‘ + Text000);  
```  

 This code example takes the string value **ABC123** and outputs the encrypted value of the string. The encrypted value will vary from system to system due to differences in the encryption key.  

## See Also  
    
 [AL Reference Guide](../devenv-al-reference-guide.md)
