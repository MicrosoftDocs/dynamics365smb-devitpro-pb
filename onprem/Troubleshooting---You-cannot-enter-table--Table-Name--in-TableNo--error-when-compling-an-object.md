---
title: "Troubleshooting: &quot;You cannot enter table &#39;Table Name&#39; in TableNo&quot; error when compling an object"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 286df8aa-d122-4e80-bd2f-3efdb84c7781
caps.latest.revision: 6
---
# Troubleshooting: &quot;You cannot enter table &#39;Table Name&#39; in TableNo&quot; error when compling an object
If C/AL code references a table whose name starts with a number, followed by a space and then text, you will get the following error when you compile the object:  
  
 **You cannot enter table '\[Number\]\[ \]\[Text\]' in TableNo.**  
  
 For example, if a table has the name **340 Declaration Line**, then the C/AL code `MESSAGE(FORMAT(DATABASE::"340 Declaration Line"));` would result in the following error when the object is compiled:  
  
 **You cannot enter table '304 Declaration Line' in TableNo.**  
  
## Resolution  
 To resolve this issue, do one of the following.  
  
-   Reference the table by its ID instead of its name.  
  
     If the table in the previous example has an ID of 5000, then you could change the code to `MESSAGE(FORMAT(DATABASE::"5000"));`.  
  
     The ID is specified by the table's [ID Property](ID-Property.md).  
  
     This is the recommended resolution.  
  
-   Rename the table by either removing the number or the space between the number and the rest of the name. The name is specified by the table's [Name Property](Name-Property.md).  
  
## See Also  
 [How to: Create a Table](How-to--Create-a-Table.md)   
 [How to: Save a New Table](How-to--Save-a-New-Table.md)