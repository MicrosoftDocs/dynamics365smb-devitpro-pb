---
title: Create a Page
description: Pages are objects for viewing and editing data in the RoleTailored client. To create a page, consider page's business purpose and user tasks.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a7d37590-e781-4c4d-8c71-beb3b93c44d7
caps.latest.revision: 35
---
# Creating a Page in Microsoft Dynamics NAV
Pages are objects for viewing and editing data in the [!INCLUDE[rtc](includes/rtc_md.md)]. When you create a new page, consider the page's business purpose, including which user uses it and what tasks the user must have. There are ten page types from which you can choose, including:  
  
-   Role Center pages, which are home pages for a specific user role such as account manager or sales order processor.  
  
-   List pages, which display multiple records on a page.  
  
-   Card pages, which are used to modify individual customer or item records.  
  
 The page type determines which controls, parts, and properties are valid for the page. For example, FactBoxes are not allowed on all page types. For more information about page types, see [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md).  
  
### To create a blank page  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose the **Page** button, and then choose the **New** button. The **New Page** dialog box appears.  
  
3.  If your page is associated with a table, in the **Table** text box, choose the **AssistEdit** button, select a table, and then choose the **OK** button.  
  
4.  Select **Create blank page**, and then choose the **OK** button.  
  
     The new page appears in Page Designer.  
  
    > [!NOTE]  
    >  If you are running [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can select **Create blank page of type**, select the page type, and then continue to step 9.  
  
5.  In the **Caption** field of the first row, which has the type **Container** and the subtype **ContentArea**, type some descriptive text, such as **contentcontainer**.  
  
    > [!NOTE]  
    >  This text is used internally for identification purposes and does not appear in the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
6.  Choose another row to automatically complete the **Name** field.  
  
7.  By default, the page is a Card page type. To change to another page type, select a blank row, and on the **View** menu, choose **Properties**.  
  
8.  Locate the **PageType** property, and then set the **Value** field to the page type you want. For more information about the different page types, see [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md).  
  
9. Save your page. On the **File** menu, choose **Save As**. The **Save As** dialog box appears.  
  
10. In the **ID** field, enter the page ID.  
  
11. In the **Name** field, enter a name.  
  
12. Choose the **OK** button. Your page is saved.  
  
13. Complete the page design by adding additional controls, parts, and actions as necessary. For more information, see the following topics:  
  
    -   [Page Designer Walkthroughs](Page-Designer-Walkthroughs.md)  
  
    -   [Adding Actions to Pages](Adding-Actions-to-Pages.md)  
  
    -   [Creating Activity Buttons for the Navigation Pane](Creating-Activity-Buttons-for-the-Navigation-Pane.md)  
  
    -   [How to: Run a Page](How-to--Run-a-Page.md)  
  
##  <a name="Wizard"></a> Creating a Page Using the Wizard  
 The [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] includes a wizard that you can use to create specific page types. In the page wizard, you choose a page type, and the page wizard automatically adds some content and controls to the page for you, such as fields, FastTabs, and FactBoxes. The page wizard is designed to help you learn about how to create a page by adding the basic content and controls. The wizard has limitations and may not add all content that you want on a page. For example, you cannot use the wizard to add navigation or actions on your page. Depending on the page's type and complexity, you should manually change a page after you use the wizard.  
  
 The following table outlines what the wizard can do for each page type.  
  
|What the wizard does|Card|CardPart|Confirmation Dialog|Document|List|ListPart|ListPlus|Navigate|RoleCenter|Standard Dialog|Worksheet|  
|--------------------------|----------|--------------|-------------------------|--------------|----------|--------------|--------------|--------------|----------------|---------------------|---------------|  
|Sets the page type.|X|X|X|X|X|X|X|X|X|X|X|  
|Associates the page with a table.|X|X|X|X|X|X|X|X||X|X|  
|Adds FastTabs that include selected fields.|X|X|X|X|||X|X||||  
|Places fields in a list that has selected fields that define the columns.|||||X|X|X||||X|  
|Adds a FactBox that includes page, system, or chart parts.|X|||X|X||X|X|||X|  
  
#### To create a page using the wizard  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose the **Page** button, and then choose the **New** button. The **New Page** dialog box appears.  
  
3.  Select **Create page using wizard**, and then choose the page type from the list.  
  
4.  To specify the table with which your page is associated, in the **Table** text box, choose the **AssistEdit** button, select a table, and then choose the **OK** button.  
  
    > [!NOTE]  
    >  RoleCenter page types are not associated with a table.  
  
5.  Choose the **Finish** button.  
  
     The new page appears in Page Designer.  
  
6.  Save the page. On the **File** menu, choose **Save As**. The **Save As** dialog box appears.  
  
7.  In the **ID** field, enter the page ID.  
  
8.  In the **Name** field, enter a name.  
  
9. Choose the **OK** button. Your page is saved.  
  
10. Complete the page design by adding additional controls, parts, and actions as necessary. For more information, see the following topics:  
  
    -   [Page Designer Walkthroughs](Page-Designer-Walkthroughs.md)  
  
    -   [Adding Actions to Pages](Adding-Actions-to-Pages.md)  
  
    -   [Creating Activity Buttons for the Navigation Pane](Creating-Activity-Buttons-for-the-Navigation-Pane.md)  
  
    -   [How to: Run a Page](How-to--Run-a-Page.md)  
  
## See Also  
 [Pages](Pages.md)   
 [Pages Overview](Pages-Overview.md)   
 [How to: Add FastTabs to a Customer Card Page](How-to--Add-FastTabs-to-a-Customer-Card-Page.md)   
 [Adding a FactBox to Page](Adding-a-FactBox-to-Page.md)   
 [Making a Page or Report Available From Search in the Windows Client](Making-a-Page-or-Report-Available-From-Search-in-the-Windows-Client.md)
