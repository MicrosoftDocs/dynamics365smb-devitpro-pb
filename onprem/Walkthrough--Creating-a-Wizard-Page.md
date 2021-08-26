---
title: "Walkthrough: Creating a Wizard Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ca39f91c-d1e5-47f4-8411-baad6af0a411
caps.latest.revision: 47
manager: edupont
---
# Walkthrough: Creating a Wizard Page
In [!INCLUDE[navnow](includes/navnow_md.md)], you can use the NavigatePage page type to create a wizard page. A wizard page consists of a number of user input screens or steps linked together, enabling users to carry out infrequently performed tasks, such as configuration or specific business tasks. Examples of wizard pages in [!INCLUDE[navnow](includes/navnow_md.md)] are Assisted Company Setup Wizard, page 1803 and Create Opportunity, page 5126.  
  
 In this walkthrough we will use and refer to the NavigatePage type as a wizard, but the NavigatePage type can also be used for other types of pages, for example, page 344, Navigate.  
  
> [!IMPORTANT]  
>  When you design NavigatePage pages, there are a few things to be aware of. The ribbon is not displayed when it is run on [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], or [!INCLUDE[nav_phone](includes/nav_phone_md.md)].  
>   
>  To get the right styling for the Back, Next, and Finish buttons, you must use specific images and set the **InFooterBar** property to **Yes**. Additionally,  
>   
>  -   for the **Back** button, set the **Image** property to **PreviousRecord**.  
> -   for the **Next** button, set the **Image** property to **NextRecord**.  
> -   for the **Finish** button, set the **Image** property to **Approve**.  
>   
>  The **Back**, **Next**, and **Finish** buttons are always displayed in this order and are always right-aligned.  
  
## About This Walkthrough  
 This walkthrough provides an overview of how to create the basic elements in a To-do wizard page using Page Designer.  
  
 This walkthrough illustrates the following tasks:  
  
-   Creating a wizard page.  
  
-   Adding steps to a wizard page.  
  
-   Adding the attendee subpage.  
  
-   Adding wizard buttons.  
  
-   Running the page.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Story  
 Simon is a partner working for CRONUS International Ltd. Benjamin, the marketing manager at CRONUS, wants Simon to create a page that will enable him to create To-dos for his team of salespeople. Simon must create a wizard page that makes it easy to link a To-do with a sales campaign or sales opportunity. Simon knows that he can do this successfully if he uses the NavigatePage page type to create a To-do wizard.  
  
## Creating a Wizard Page  
 Simon must first create a new page of the type NavigatePage in Page Designer.  
  
> [!NOTE]  
>  In this walkthrough, to learn about the properties and controls of a NavigatePage page, you will first create a blank page. Object Designer also includes a wizard that you can use to create a NavigatePage page that sets up many properties and controls for you. For more information about the wizard, see [How to: Create a Page](How-to--Create-a-Page.md).  
  
#### To create a wizard page  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, and then choose **New**. The **New Page** window opens.  
  
3.  In the **Table** text box, choose the up arrow, select the table 5080, **To-do**, and then choose the **OK** button.  
  
4.  Choose **Create blank page**, and then choose the **OK** button.  
  
     The new page appears in Page Designer.  
  
5.  On the first row, ensure that the **Type** column is set to **Container** and that the **SubType** column is set to **ContentArea**. In the **Name** column, type **Ben's To-dos**.  
  
6.  Select a blank row, and on the **View** menu, choose **Properties**.  
  
7.  In the **PageType** property, set the **Value** field to **NavigatePage**.  
  
8.  Close the **Properties** window.  
  
9. Close the **Page Designer** window.  
  
10. In the **Save As** dialog box, in the **Name** text box, enter **Ben's To-dos** and enter a page **ID**, for example, **50015**. Choose the **OK** button.  
  
 You have successfully created and saved a NavigatePage page, which you will use to create a To-do wizard. Next you must add steps to the wizard.  
  
## Adding Steps to a Wizard Page  
 In a wizard page, steps are controls that you place on a NavigatePage to enable it to work like a wizard. These controls initially appear as tabs in the content area of the page. Simon can create steps in Page Designer by adding a different group element for each step that he wants to create. Each control is displayed as a separate step to the user. The following procedure shows how to create the first step in a To-do wizard that has four steps.  
  
#### To add steps to a wizard page  
  
1.  In Page Designer, select your new Ben’s To-dos wizard page, 50015, and choose **Design** to open it.  
  
2.  On the second row, in the **Name** column, type **Step1**. Set **Type** to **Group** and **SubType** to **Group**.  
  
3.  In the next empty row, leave the **Name** field blank and set **Type** to **Field**.  
  
4.  On the **View** menu, choose **Field Menu**.  
  
     In the **Field Menu** window, select fields from the table 5080, **To-do**.  
  
5.  Make your selection by holding down the Ctrl key while you select the following fields:  
  
    -   Type  
  
    -   Date  
  
    -   Description  
  
    -   Start time  
  
    -   Duration  
  
    -   Team To-do  
  
    -   All Day Event  
  
    -   Ending Date  
  
    -   Ending Time  
  
6.  Choose the **OK** button. A message box displays the following message, "Do you want to add the fields that are selected in the field menu?" Choose **Yes**.  
  
7.  In the **Caption** column for each of the fields you added, type the following captions:  
  
    |Field|Caption|  
    |-----------|-------------|  
    |**Type**|What is the type of the to-do?|  
    |**Date**|What is the starting date of the to-do?|  
    |**Description**|Describe your to-do|  
    |**Start time**|What is the start time of the to-do?|  
    |**Duration**|What is the duration of the to-do?|  
    |**Team To-do**|Team to-do|  
    |**All Day Event**|All Day Event|  
    |**Ending Date**|What is the end date of the to-do?|  
    |**Ending Time**|What is the end time of the to-do?|  
  
     All the fields that you add must be indented one space below Step 1. Remember to check indentation on all elements that you create, and adjust with the left and right arrows if necessary.  
  
8.  When you have added all the necessary steps, close the Page Designer, and save your page.  
  
     In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], each step is displayed like a tab control until you add **Back**, **Next**, and **Finish** buttons to the lower part of the page. You will read about this in Adding Wizard Buttons.  
  
## Adding the Attendee Subform  
 When Ben opens his new wizard page for the first time, he wants to be able to choose a salesperson to create a To-do for. Simon must add a control to Step 1 of the wizard, which allows him to select attendees from table 5080, Attendees.  
  
#### To add the attendee subform  
  
1.  In Object Designer, select your new wizard page, 50015, and choose **Design** to open it.  
  
2.  Insert a row right below the **Step1** row.  
  
3.  Type **AttendeeSubForm** in the **Name** column. This row should be indented to match the other field elements in the **Step 1** group. Set **Type** to **Part**.  
  
4.  On the **View** menu, choose **Properties**. Set the **PagePartID** property to **Attendee Wizard Subform** \(5198\). This will ensure that Ben can select attendees for his To-dos in the first step of the wizard.  
  
5.  Close the **Properties** window, save your page, and in Page Designer, choose **Preview** to view your changes in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and then close the **Preview** window.  
  
     The following illustration shows the indentation of elements on the wizard page after adding steps and the attendee subform.  
  
     ![Wizard page in Object Designer.](media/RTCPageWizard.png "RTCPageWizard")  
  
## Adding Wizard Buttons  
 Simon has now successfully created a basic wizard page. To make his page appear more like a wizard he must add **Next**, **Back**, and **Finish** buttons. To do this, Simon must add a new set of actions to his wizard page using the Action Designer.  
  
#### To add wizard buttons  
  
1.  In Page Designer, select your Ben’s To-dos wizard page, 50015, and choose **Design** to open it.  
  
2.  Select the first empty row below the steps that you have already created, and on the **View** menu, choose **Control Actions** to open **Action Designer**.  
  
3.  On the first empty row in Action Designer, set **Type** to **ActionContainer** and **SubType** to **ActionItems**.  
  
4.  In the next available row, type **Back** in the **Name** field, and set **Type** to **Action**. Do the same in the next two available rows except enter **Next** and **Finish** in the **Name** fields.  
  
5.  When you have added all the buttons you need, select the row with the **Back** button control, and open the **Properties** window.  
  
6.  In the **Properties** window, set the following properties on the **Back** button.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**Enabled**|**BackEnable**<br /><br /> For the **Next** button, set **NextEnable**<br /><br /> For the **Finish** button, set **FinishEnable**|  
    |**Visible**|**True**|  
    |**Caption**|**&Back**<br /><br /> For the **Next** button, set **&Next**<br /><br /> For the **Finish** button, set **&Finish**|  
    |**RunPageMode**|**Edit**|  
    |**InFooterBar**|**Yes**|  
  
7.  On the **View** menu, choose **C/AL Globals**, and on the **Variables** tab, declare the following variables:  
  
    |Variable|DataType|  
    |--------------|--------------|  
    |BackEnable|Boolean|  
    |NextEnable|Boolean|  
    |FinishEnable|Boolean|  
  
8.  To make sure the controls are visible on the page, from the **Action Designer** window, open the **C/AL Code** window.  
  
9. In the OnAction\(\) trigger for Back, enter the following line of code `CurrPage.UPDATE(TRUE);`  
  
10. Repeat this for the OnAction\(\) triggers for Next and Finish.  
  
11. Close the **C/AL Code** window.  
  
12. Save and compile your page.  
  
#### To enable the wizard buttons  
  
1.  In Page Designer, select your Ben’s To-dos wizard page, 50015, and choose **Design** to open it.  
  
2.  On the **View** menu, choose **C/AL Globals**, and on the **Functions** tab, create a new function named **DoStep**.  
  
3.  Choose the **Locals** button, and then, on the **Parameters** tab, enter **step** in the Name field, and choose **Integer** in the DataType field.  
  
4.  Close the **C/AL Locals** window and the **C/AL Globals** window.  
  
5.  On the **View** menu, choose **C/AL Code**, and scroll down until you locate the **DoStep** function.  
  
6.  In the **DoStep** function, insert the following lines of code:  
  
    ```  
  
    BEGIN  
    CASE step OF  
            0:  
              BEGIN  
                BackEnable := FALSE;  
                NextEnable := TRUE;  
                FinishEnable := FALSE;  
              END;  
            1:  
              BEGIN  
                BackEnable := TRUE;  
                NextEnable := FALSE;  
                FinishEnable := TRUE;  
              END;  
            2:  
              BEGIN  
                BackEnable := FALSE;  
                NextEnable := FALSE;  
                FinishEnable := FALSE;  
              END  
            ELSE  
              ERROR('invalid button state/step, choose 0-2');  
          END;  
  
          CurrPage.UPDATE(TRUE);  
    END;  
  
    ```  
  
7.  Now scroll to the **OnInit** function and enter the following line of code:  
  
    ```  
  
    BEGIN  
      DoStep(0);  
    END;  
    ```  
  
8.  Close the C/AL Code window.  
  
9. Save and compile the page.  
  
## Running the Page  
 Test your new wizard page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To run the page  
  
1.  In Object Designer, select page Ben's To-dos, and then choose **Run**.  
  
     The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and displays the new wizard page.  
  
## Next Steps  
 Simon has now created a basic wizard page.  
  
 For more information about adding variables, constants, and functions, see [Codeunits](Codeunits.md).  
  
## See Also  
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md)   
 [How to: Create a Page](How-to--Create-a-Page.md)   
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [How to: Run a Page](How-to--Run-a-Page.md)