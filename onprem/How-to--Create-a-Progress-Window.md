---
title: Create a Progress Window
description: Create a progress window for time-consuming applications by displaying a window with information of the progress that is being made. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 89d7a1a1-f0ac-4998-b1c4-e47fb118932f
caps.latest.revision: 8
---
# Creating a Progress Window in Dynamics NAV
If you have an application that performs some processing which can take a long time to complete, you should consider displaying a window that informs the user of the progress that is being made.  
  
 You can create a window in which each field is updated while the program is running. For example, the fields in a window display the count of the number of postings made. You can also display information about the record that is currently being processed. For example, the field in a window displays the number of the account that is currently being processed.  
  
### To create a progress window  
  
1.  On the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select **Codeunit**, and then choose the **New** button.  
  
3.  On the **View** menu, choose **C/AL Globals**.  
  
4.  On the **Variables** tab, in the **Name** field, enter **ProgressWindow**. In the **Data Type** field, select **Dialog** from the drop-down list.  
  
5.  On the **Variables** tab, on a new line in the **Name** field, enter **ChartOfAcc**. In the **Data Type** field, select **Record** from the drop-down list. In the **Subtype** field, select **G/L Account** from the table list.  
  
6.  In the **C/AL Editor** for the dialog, add the following code.  
  
    ```  
    ProgressWindow.OPEN('Processing account number #1#######');  
    REPEAT  
       SLEEP(1000);  
       ProgressWindow.UPDATE(1,ChartOfAcc."No.");  
       // Process the account.  
    UNTIL ChartOfAcc.NEXT = 0;  
    ProgressWindow.CLOSE;  
    ```  
  
     The first line defines the string that will be displayed in the progress window. The part of the string that contains the number signs \(\#\) and a number defines the field that will be displayed in the window. The number \(1\) refers to the field.  
  
     In this example, each entry in the **G/L Account** table is updated and the number of each account is displayed as it is updated.  
  
     The `SLEEP(1000);` function is necessary only to slow the processing so that you can see the progress window.  
  
## See Also  
 [Progress Windows, MESSAGE, ERROR, and CONFIRM Functions](Progress-Windows--MESSAGE--ERROR--and-CONFIRM-Functions.md)