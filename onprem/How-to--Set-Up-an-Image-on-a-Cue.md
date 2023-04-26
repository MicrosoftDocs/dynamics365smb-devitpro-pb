---
title: "How to: Set Up an Image on a Cue"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 77fb4f20-8b5a-43dd-aae5-948f3deb67d3
caps.latest.revision: 8
---
# How to: Set Up an Image on a Cue
When a field that defines the data in a cue has an integer data type, you can set up the cue to include an image. There are several images from which to choose. For example, if the cue shows the total count of an item such as open sales orders, then you can set the cue to include the stack image, which depicts that total count as a stack of paper. This is the default image. You can also set up the cue so that it does not to include an image.  
  
 To set up an image on the cue, you set the [Image Property \(Fields\)](Image-Property--Fields-.md) of the field that defines the cue as described in the following procedure.  
  
### To set up an image on a cue  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open the page that contains the cue as follows:  
  
    1.  On the **Tools** menu, choose **Object Designer**.  
  
    2.  In Object Designer, choose **Page**, select the page, and then choose the **Design** button.  
  
2.  In Page Designer, select the field that defines the cue, and then on the **View** menu, choose **Properties**.  
  
3.  In the **Properties** window, set the **Image** property as follows:  
  
    1.  Choose the **AssistEdit** button in the **Value** field.  
  
    2.  In the **Image List** window, select the image that you want to use for the cue, and then choose the **OK** button.  
  
         If you do not want to include an image on the cue, then select **None**.  
  
         To view all the available action images, see [Microsoft Dynamics NAV Icon Collection](https://go.microsoft.com/fwlink/?LinkID=394623).  
  
4.  Close the **Properties** window, and then save the page.  
  
## See Also  
 [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md)
