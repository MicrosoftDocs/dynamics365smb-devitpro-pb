---
title: "Options for Merging Objects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5b6834f0-204a-474a-a6c5-23229838630d
caps.latest.revision: 5
---
# Options for Merging Objects
The following sequence of events shows when objects are merged:  
  
1.  The old object is decompiled.  
  
2.  The new object is decompiled.  
  
3.  The objects are merged.  
  
4.  The resulting object is compiled.  
  
 If any one of these steps fail, the merge will be discontinued.  
  
 There are two options for merging:  
  
-   Existing \<- New  
  
-   New \<- Existing  
  
## Existing \<- New  
 When you use Existing \<- New, the following items from the existing object are always used:  
  
-   Table properties.  
  
-   Local C/AL functions on the table, including local variables.  
  
-   Global variables.  
  
 The following items are merged into the existing object from the new object:  
  
-   New fields.  
  
-   Field properties that are different in the objects.  
  
-   Trigger code on field level, including local variables.  
  
 Fields are merged based on the field number. The following scenarios are possible:  
  
-   The field is located in the old object, but not in the new. The field will remain as it was.  
  
-   The field is located in the new object, but not in the old. The field will be added.  
  
-   The field is located in both objects. If the properties are different in the new object, these new properties will be used.  
  
 This could lead to problems that have to be resolved manually. For example, consider a new object that differs from an old object by introducing code in a field trigger and this code uses a global variable that is not in the old object. The merge will fail because the global variables are taken from the old object, and the merged object needs the global variable in order to compile.  
  
 A workaround would be to declare the global variable in the old object before merging the objects.  
  
## New \<- Existing  
 When you use New \<- Existing option, this reverses the scenario.  
  
 The following items from the new object are always used:  
  
-   Table properties.  
  
-   Local C/AL functions on the table, including local variables.  
  
-   Global variables.  
  
 The following items are merged into the new object from the existing object:  
  
-   New fields.  
  
-   Field properties that are different in the objects.  
  
-   Trigger code on field level, including local variables.
