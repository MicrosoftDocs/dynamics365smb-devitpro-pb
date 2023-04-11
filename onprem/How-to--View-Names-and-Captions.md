---
title: "How to: View Names and Captions"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 10ccff06-ebf2-4eb5-b52a-8fc601cf156a
caps.latest.revision: 11
---
# How to: View Names and Captions
If you have a multilanguage application, then you need to know how to find the values of both the [Name Property](Name-Property.md) of an object, which is in English \(United States\), and the [Caption Property](Caption-Property.md) of an object, which is in the local application language.  

## Viewing Names and Captions in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]  
 Each of the following windows displays both the **Name** property and the **Caption** property for the items in the list:  

-   Object Designer  

-   Table List  

-   Page List  

-   Field List  

-   Object List  

-   Field Menu  

 In each window, there is a column with the object number. The following two columns contain the **Name** property and the **Caption** property in the current application language, respectively. The following procedure describes how to view a list in Object Designer.  

#### To view the Table List window when creating a page  

1.  In Object Designer, choose **Page**, and then choose **New**.  

2.  In the **New Page** window, in the **Table** field, choose the up arrow.  

3.  In the **Table List** window, the first column contains the table number, the second column contains the **Name** property, and the third column contains the **Caption** property in the current application language.  

 In Object Designer and the **Field Menu** window, you can show or hide columns, including the **Caption** column.  

#### To show columns in the Object Designer window  

1.  In Object Designer, on the shortcut menu of a column header, choose **Show Column**.  

2.  In the **Show Column** window, select columns that you want to show, and then choose the **OK** button.  

#### To hide columns from the Object Designer window  

-   In Object Designer, on the shortcut menu of a column header for the column that you want to hide, choose **Hide Column**.  

 In the C/AL Editor, the C/AL scanner displays captions for objects, fields, and text constants. When you place the cursor on an object, field, or text constant, the C/AL scanner displays the **Caption** property for the object, field, or text constant in the status bar at the bottom of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] window.  

 In the **C/AL Symbol Menu**, if you have selected a field name, then the value of the **Name** property is displayed in the third column, and the value of the **Caption** property is displayed in the lower-left corner of the window. If you have selected a caption, then the corresponding **Name** for that caption is displayed in the lower-left corner of the window and the value of the **Caption** property is displayed in the third column.  

## See Also  
 [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)
