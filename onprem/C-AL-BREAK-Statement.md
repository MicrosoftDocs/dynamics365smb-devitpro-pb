---
title: "C/AL BREAK Statement"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 625e29a8-963e-4ef1-971d-c96cf19e1ccb
caps.latest.revision: 8
author: jswymer
---
# C/AL BREAK Statement
You use the BREAK statement to terminate the iteration statement in which it appears.  

```  
BREAK;  
```  

 You typically use the BREAK statement in the repeating statements such as FOR, FOREACH, WHILE, or REPEAT to stop an iteration or loop when certain conditions are met.  

> [!NOTE]  
>  The BREAK statement is different than the [BREAK Function \(Report, XMLport\)](BREAK-Function--Report--XMLport-.md). Although both stop an iteration or loop, the BREAK function will also terminate the trigger in which it is run.  

## Example  
 The following code example loops through a .NET Framework collection that contains a generic list of elements and returns each element as text in a message. However, the BREAK statement terminates the iteration when the text equivalent of the element is *Item 2*.  

 Create the following local variables in a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit.  

|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|mylist|DotNet|System.Collections.Generic.List\`1.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  
|element|DotNet|System.Object.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  

 Add the following C/AL code \(for example, on the OnRun trigger of the codeunit\).  

```  
// Instantiate the .NET Framework collection object  
mylist := mylist.List();  

// Populate the collection  
mylist.Add('Item 1');  
mylist.Add('Item 2');  
mylist.Add('Item 3');  
mylist.Add('Item 4');  

// Iterate through the collection  
FOREACH element IN mylist DO  
  BEGIN  
    MESSAGE(FORMAT(element));  
    IF FORMAT(element) = 'Item 2' THEN  
      BREAK;  
  END;  
```  

 Compile and run the [!INCLUDE[navnow](includes/navnow_md.md)] object.  

## See Also  
 [C/AL Repetitive Statements](C-AL-Repetitive-Statements.md)
