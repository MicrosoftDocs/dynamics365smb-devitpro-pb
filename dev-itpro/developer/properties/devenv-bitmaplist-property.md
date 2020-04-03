---
title: "BitmapList Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b9882836-702c-42e3-834d-bcbc1a8f4738
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# BitmapList Property
Sets a list of bitmaps from which the correct bitmap to display is selected.  
  
## Applies To  
- Picture boxes  
  
## Remarks  
Specify the bitmap list using a comma-separated list of file names, such as `c:\pictures\<example1>.bmp,c:\pictures\<example2>.bmp`. There are 44 predefined bitmaps. They can be chosen by entering a number from 1 to 44. You can mix external bitmaps that are stored in files, with the internal bitmaps in this list.  
  
The [SourceExpression Property](devenv-sourceexpr-property.md) of the control is used to choose which bitmap to display. The first bitmap in the list is number 1, the second bitmap is number 2, and so on.  
  
The bitmaps are imported. If you change one or more of the bitmaps, you have to re-import them to update the versions that are used. You can do this by reentering this property value.  
  
The size limit for all the user-defined bitmaps included in the list is 32 KB.  
  
## See Also  
 [Bitmap Property](devenv-bitmap-property.md)   
 [BitmapPos Property](devenv-bitmappos-property.md)