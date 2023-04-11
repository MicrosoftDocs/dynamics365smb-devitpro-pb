---
title: "Walkthrough: Using Automation to Write a Letter in Microsoft Office Word"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b256a000-e9fe-4050-b54c-1c618d78431b
caps.latest.revision: 30
---
# Walkthrough: Using Automation to Write a Letter in Microsoft Office Word
Automation lets you use the capabilities and features of Microsoft Office products, such as Microsoft Word or Microsoft Excel, in your [!INCLUDE[navnow](includes/navnow_md.md)] application. In this walkthrough, you will implement Word Automation from a customer card in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You will set up the customer card so that if the customer has bought goods for more than LCY 2,500 during the past year, then the user can choose a menu item or action to automatically create a letter in Word that offers the customer 3% discount. The letter will include information about the customer, such as the customer's name and the address, and the name of the contact to whom you will address the letter.  
  
> [!NOTE]  
>  The [!INCLUDE[nav_web](includes/nav_web_md.md)] does not support automation.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating a template in Word that will be used for Word documents that are created from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] with Automation.  
  
-   Creating a codeunit and declaring the Automation variables that are required for using Microsoft Office Word Automation.  
  
-   Writing C/AL code in the codeunit to instantiate the Automation object that creates a Word document from a template.  
  
-   Adding C/AL code to the Automation codeunit to transfer data from a table record to a Word document.  
  
-   Calling the Automation codeunit from an action on a page.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)].  
  
-   Microsoft Word 2013 or Microsoft Word 2010.  
  
### Where to Get the Information for the Letter  
 Most information that you need to transfer to Word is in the **Customer** table. The **Customer** table contains a FlowField called **Sales \(LCY\)** that contains the aggregated sales for the customer. For this walkthrough, you are learning about Automation, so you use the existing value. In a real customer installation, you would need to set up an appropriate date filter to get the sales for the past year only.  
  
 You also need to retrieve the information about your own company that you will use in the letterhead and in the greeting of the letter. This information is contained in the **Company Information** and **User** tables.  
  
### Where to Place Automation Code  
 In this walkthrough, you put all code in a separate codeunit that is called from a menu item on the **Customer Card** page. You must consider the following issues when you are deciding where to place the code that uses Automation:  
  
-   The Automation server must be installed on the computer that compiles an object that uses Automation. If you must recompile and modify an object on a computer that does not have the Automation server installed, then you must modify the code to compile it again. We recommend that you isolate code that uses Automation in separate codeunits.  
  
-   Performance can be an issue if extra work is needed to create an Automation server with the **CREATE** system call. If the Automation server is to be used repeatedly, then you will gain better performance by designing your code so that the server is created only once instead of making multiple **CREATE** and **CLEAR** calls\).  
  
 These two issues may clash, and you will have to make some tradeoffs that are based on the actual context in which your code will be used. In this walkthrough, you are not putting the Automation code on the customer card but are isolating it in a separate codeunit. Performance can be improved by putting the code on the customer card because you do not have to open and close Word for each letter that is created in the session.  
  
 You can work around this problem. If Word is already open when it is called from the code, then the running instance is reused. You can manually open Word or do not close Word after creating the first letter.  
  
### Using Word in This Example  
 You will extract and transfer data one customer at a time. You also will initiate this processing and the subsequent processing in Word from the customer card.  
  
 You will insert fields into the Word template and give these fields convenient mnemonic names that correspond to the names of the record fields that you are using.  
  
 To make this work, your C/AL code must make two extra calls to Microsoft Office Word. You must call the ActiveDocument.Fields.Update method before using the fields. After you have transferred all the information, you must call the ActiveDocument.Fields.Unlink method. This ensures that you can successfully use the Word fields as placeholders.  
  
 In addition, while you can name the **Customer** or **Address** fields, you must reference them by indexing into the Fields collection of the document. This can make the C/AL code harder to understand.  
  
##  <a name="CreateTemplate"></a> Creating the Word Template for Use by Automation  
 First, you create a Word template that you will use to create letters to customers that qualify for a discount. To create the template, you add mail merge fields for displaying data that is extracted from [!INCLUDE[navnow](includes/navnow_md.md)] that you want included in the customer letter, such as the customer's name, contact, and total sales.  
  
 You will create and save the template on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], because you will configure the automation object to run on the client.  
  
#### To create the template  
  
1.  On the computer running [!INCLUDE[nav_windows](includes/nav_windows_md.md)], open Word and create a new document.  
  
2.  Choose where you want to insert the fields. Then, on the **Insert** tab, in the **Text** group, choose **Quick Parts**, and then choose **Field**.  
  
3.  In the **Categories** list, select **Mail Merge**.  
  
4.  In the **Field names** list, select **MergeField.**  
  
5.  In the **Field Name** box under **Field Properties**, type **Contact**. This field will display the name of your contact person at the customer site as taken from the **Customer** table.  
  
6.  Choose **OK** to add the field.  
  
7.  Repeat steps 2 through 6 to add the remaining fields as follows:  
  
    |Field name|Description|Underlying table|  
    |----------------|-----------------|----------------------|  
    |Name|The name of the customer.|Customer|  
    |Address|The address of the customer.|Customer|  
    |Sales \(LCY\)|The total amount that the customer has purchased from you.|Customer|  
    |Company Name|The name of your company.|Company Information|  
  
8.  Save the Word document as a template with the name **Discount.dotx** at C:\\Documents and Settings\\All Users\\Templates or a folder of your choice.  
  
## Creating the Codeunit and Declaring the Variables  
 The next step is to create the codeunit that calls Word and creates the letter.  
  
#### To create the codeunit  
  
1.  In Object Designer, choose **Codeunit**, and then choose the **New** button to create a new codeunit.  
  
2.  On the **View** menu, choose **Properties** to open the **Properties** window of the codeunit.  
  
3.  In the **TableNo** field, choose the **AssistEdit** button to open the **Table List** window.  
  
4.  In the **Table List** window, select the **Customer** table, and then choose **OK**.  
  
5.  Close the **Properties** window.  
  
#### To declare the variables  
  
1.  Choose the OnRun Trigger and on the **View** menu, choose **C/AL Locals**, and then choose the **Variables** tab.  
  
2.  On a blank line, type **wdApp** in the **Name** field and set the **Data Type** field to **Automation**.  
  
    > [!NOTE]  
    >  When you create an **Automation** variable, some hidden events are also created for it. If you want to delete the variable, be aware that the events are also not deleted. This can cause issues if you then create a variable with the same name.  
  
3.  In the **Subtype** field, choose the **AssistEdit** button. The **Automation Object List** window is displayed.  
  
4.  In the **Automation Server** field, choose the **AssistEdit** button.  
  
5.  In the **Automation Server List**, select **Microsoft Word 15.0 Object Library** if you are running Word 2013, or select **Microsoft Word 14.0 Object Library** if you are running Word 2010, and then choose **OK**.  
  
6.  From the list of classes in the **Automation Object List**, select the **Application** class, and then choose **OK**.  
  
7.  Repeat steps 2 through 6 to add the following two Automation variables:  
  
    |Name|Data type|Subtype|Class|  
    |----------|---------------|-------------|-----------|  
    |wdDoc|Automation|Microsoft Word 14.0/15.0 Object Library|Document|  
    |wdRange|Automation|Microsoft Word 14.0/15.0  Object Library|Range|  
  
8.  Add the following variables.  
  
    |Name|Data type|Subtype|Length|  
    |----------|---------------|-------------|------------|  
    |CompanyInfo|Record|Company Information||  
    |TemplateName|Text||250|  
  
9. Close the **C/AL Locals** window.  
  
## Writing the C/AL Code  
 Before you start writing the C/AL code that uses Automation, you must do some initial processing. You start by calculating the **Sales \(LCY\)** FlowField. Then, you check whether the customer qualifies for a discount. Finally, you retrieve the information from the **Company Information** and **User** tables that you use to fill in some of the fields in the letter.  
  
#### To write the C/AL code  
  
1.  In the C/AL Editor, add the following lines of code to the **OnRun** section.  
  
    ```  
    CALCFIELDS("Sales (LCY)");  
    CompanyInfo.GET;  
  
    ```  
  
2.  To create an instance of Word before using it, enter the following line of code.  
  
    ```  
    CREATE(wdApp, FALSE, TRUE);  
    ```  
  
     This statement creates the Automation object with the `wdApp` variable.  
  
    -   The first Boolean parameter in the statement \(`FALSE`\) tells the `CREATE` function to try to reuse an already running instance of the Automation server that is referenced by Automation before creating a new instance. If you change this to `TRUE`, then the `CREATE` function always creates a new instance of the Automation server.  
  
    -   The second Boolean parameter in the statement creates the Automation object on the client. This is necessary to use this codeunit on a page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
     For more information, see [CREATE Function \(Automation\)](CREATE-Function--Automation-.md).  
  
3.  Enter the following lines of code to add a new document to Word that uses the template that you designed earlier. If required, replace `C:\Documents and Settings\All Users\Templates` with the correct folder path to the template that you defined in the procedure [Creating the Word Template for Use by Automation](#CreateTemplate).  
  
    ```  
    TemplateName := 'C:\Documents and Settings\All Users\Templates\Discount.dotx';  
    wdDoc := wdApp.Documents.Add(TemplateName);  
    wdApp.ActiveDocument.Fields.Update;  
    ```  
  
     Because the `Add` method of the `Documents` collection requires that you pass the path to the template by reference, you must set up the `TemplateName` variable to hold this information. You will get a compilation error if you put the path into the call as a literal string.  
  
     The `Documents` property returns a Documents collection that represents all open documents. You can also see that the Documents collection object has an Add method, and that the Add method has the following syntax.  
  
     `expression.Add(Template, NewTemplate, Document Type, Visible)`  
  
     `expression` is a required argument, and it must be an expression that returns a Documents object. All the arguments are optional. You will use `Template` to open a new document that is based on your template.  
  
     For the syntax in the C/AL Symbol Menu, note that the Documents property returns an object of type DOCUMENTS, which is a user-defined type. The property returns a Documents class or IDispatch interface. This information helps the compiler perform a better type check during compilation. The following statement can also pass both the compile-time and the run-time type checks.  
  
     `wdDoc := wdApp.Documents.Add(TemplateName);`  
  
     Finally, the `Add` method returns a Document class. While you did not need to declare a C/AL variable for the interim `Documents` class, you have declared a variable for the `wdDoc` return value,.  
  
     The third line contains a call that must be made to ensure that the template works as intended.  
  
     `wdApp.ActiveDocument.Fields.Update;`  
  
## Transferring Data to Word  
 Now you can transfer the actual data from the Customer record to the placeholder fields in the Word document.  
  
 You have set up the first three fields in the template so that they can contain the contact, name, and address of the customer and you can transfer the data.  
  
#### To transfer data to Word  
  
1.  Transfer the data by adding the following lines of code.  
  
    ```  
    wdRange := wdAPP.ActiveDocument.Fields.Item(1).Result;   
    wdRange.Text := Contact;   
    wdRange.Bold := 1;   
    wdRange := wdAPP.ActiveDocument.Fields.Item(2).Result;   
    wdRange.Text := Name;   
    wdRange.Bold := 1;   
    wdRange := wdAPP.ActiveDocument.Fields.Item(3).Result;   
    wdRange.Text := Address;   
    wdRange.Bold := 1;  
    ```  
  
     You cannot use the fields directly as variables and make an assignment such as `Fields.Item(3) := Address`. Instead, you use the `Result` property of the field. This property returns the result of the field as a range. You place this range in the `wdRange` Automation variable that you declared.  
  
     You then set the `Text` property of the range to the desired values, which is the name of your contact person and the name and address of the customer. Finally, you add bold formatting.  
  
     The data you are transferring must be in text format. If it is not in text format, then you get a compilation error. `wdRange.Text` expects arguments to be of type BSTR, which maps to either Text or Code. This means that any data that is not Text or Code must be converted before it is passed to Word. To convert a field to `Text`, you use the `FORMAT` function. All the fields that are transferred in this step are in text format, so no conversion is needed and the `FORMAT` function is not used. However, in this example, you also need to transfer the `Sales (LCY)` field, which is a `Decimal` field. To see how to convert the `Sales (LCY)` field, go to the next step.  
  
2.  To transfer and format the data from the `Sales (LCY)` field, add the following code.  
  
    ```  
    wdRange := wdAPP.ActiveDocument.Fields.Item(4).Result;  
    wdRange.Text := FORMAT("Sales (LCY)");  
    wdRange.Bold := 0;  
    ```  
  
     For more information about the `FORMAT` function, see [FORMAT Function \(Code, Text\)](FORMAT-Function--Code--Text-.md).  
  
3.  To transfer the information from the **Company Information** table, add the following code.  
  
    ```  
    wdRange := wdApp.ActiveDocument.Fields.Item(5).Result;  
    wdRange.Text := CompanyInfo.Name;  
    ```  
  
4.  To complete the processing in Word, add the following code.  
  
    ```  
    wdApp.Visible := TRUE;  
    wdApp.ActiveDocument.Fields.Unlink;  
    ```  
  
     The first statement opens Word and shows you the letter that was created. The second statement makes the fields work as placeholders.  
  
5.  Save and compile the codeunit and give it a number and a name. For this walkthrough, use **Discount Letter**.  
  
### To-Do List  
 Although this code will work, you must add a few things to make it complete:  
  
-   We recommend that you do not use a hardcoded template name. You should keep the template name in a table, and the user should select it from a page. You can then have different templates for different types of letters that you want to send to your customers.  
  
-   You should add some error-handling code. For example, the `CREATE` call fails if the user does not have Word installed or if the installation has been corrupted. You should check the return value of `CREATE` and give an appropriate message if it fails.  
  
-   The user should get a message if the customer does not qualify for the discount. In the example, the codeunit closes without any message.  
  
## Calling the Codeunit from the Customer Card  
 The final task is to ensure that you can call the codeunit from the **Customer Card** page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To call the codeunit from the Customer card page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
1.  Open Object Designer, and then choose **Page**.  
  
2.  Select the **Customer Card** page and then choose **Design**.  
  
3.  On the **View** menu, choose **Page Actions**.  
  
4.  To add a new action, locate the action container with the subtype set to **ActionItems**.  
  
5.  Right-click the next line after the **ActionItems** container, and then choose **New**.  
  
6.  In the **Caption** field of the new line, type **Word Letter**.  
  
7.  Set the **Type** field to **Action**.  
  
8.  With the new action selected, on the **View** menu, choose **Properties**.  
  
9. In the **RunObject** field, type **codeunit Discount Letter**.  
  
    > [!NOTE]  
    >  If you saved the codeunit that you created in the previous procedure under a different name, then substitute **Discount Letter** with the name that you used.  
  
10. Use the arrow buttons to make sure that the new action is indented only once from the **ActionItems** container above it  
  
11. Save and compile the **Customer Card** page.  
  
#### To run the Customer Card and view the Word letter  
  
1.  In Object Designer, choose the **Page** button.  
  
2.  Select the **Customer Card** page, and then choose **Run**.  
  
3.  In the ribbon, on the **Actions** tab, choose the **Word Letter** action.  
  
     The letter document opens in Word.  
  
## Next Steps  
 The letter that you have just created only contains six fields and no body text. Before you can use this letter in an actual situation, you will need to add some more fields, such as the name and address of your own company, the date, and the currency code, and the main text of the letter. It will also need some formatting to make it look more attractive. If you alter the order in which the fields appear in the template, you must change the numbering of the fields in the codeunit to ensure that the correct data is inserted into the appropriate fields.  
  
## See Also  
 [How to: Create an Automation Controller](How-to--Create-an-Automation-Controller.md)   
 [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)   
 [COM Overview](COM-Overview.md)
