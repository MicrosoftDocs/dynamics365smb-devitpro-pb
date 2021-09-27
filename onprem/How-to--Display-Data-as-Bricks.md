---
title: "How to: Display Data as Bricks"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 17340569-ee99-49bb-8c84-da6978b01437
caps.latest.revision: 29
manager: edupont
---
# Designing lists for the Tile View


The Microsoft Dynamics NAV Web client, Microsoft Dynamics NAV Tablet client, and Microsoft Dynamics NAV Phone client have a brick view option in order to optimize space and readability for data that appears in page types that have Repeater controls, such as ListPart, ListPlus, and List. The brick view compresses up to six columns of data and you can switch between the brick view and standard list view.

You can design pages that display data in a list, such as ListPart, ListPlus, and List, to give users the option to view data for e.In the client, users The [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] have a brick view option in order to optimize space and readability for data that appears in page types that have Repeater controls, such as ListPart, ListPlus, and List. The tile view compresses up to six columns of data and you can switch between the tile view and list view.  

 The context menu available in the upper right corner on each brick. The context menu contains the actions that are defined for the record, just as in the list view. Choose a brick to drill down into the card.  

 You must specify which data that you want shown in a brick view on the table’s **Field Group**. Depending on the number of columns that you define in the Field Group for the brick, the layout will dynamically change. Up to 6 fields can be displayed, and therefore, there are six possible layouts as shown in this illustration:  

 ![Brick layout for tablet and phone.](media/TabletPhone_BrickLayout.jpg "TabletPhone\BrickLayout")  

 The fields 2 and 3 are shown in a large font and should contain data that identifies the brick, for example, the Customer Name and Balance as you can see in the Customer list in, for example, the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 To display an image in the brick, you must include the Media field as part of the Brick definition. The image will then be displayed on the left side of the brick. If an image does not exist for a certain record, a default picture is displayed instead. For more information, see  

> [!IMPORTANT]  
>  By default, the **Field Group** named **DropDown** is interpreted as **Brick** when a **Brick** definition has not been set. The **DropDown** is typically set on entities such as Customer, Vendor, and Items.  

> [!TIP]  
>  The brick layout supports using the [Style Property](Style-Property.md) and [StyleExpr Property](StyleExpr-Property.md) that lets you mark, for example, numbers as favorable or unfavorable.  

### To display data as bricks  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer** to open the Object Designer window.  

2.  In **Object Designer**, choose **Tables**, select a table, and then choose the **Design** button to open **Table Designer**. For example, select table **18**, the **Customer** table.  

3.  To open the **Field Groups** window, choose **View**, and then choose **Field Groups**.  

4.  Select the first row in the **Field Groups** window, and in the **Name** field, type **Brick**.  

5.  In the **Field List** window, make a selection from the fields in the source table. Select more rows by using the **Shift** key. Choose the **OK** button to add the fields to the **Field Groups** table.  

6.  Close the windows and then choose **Save and Compile**.  

## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)
