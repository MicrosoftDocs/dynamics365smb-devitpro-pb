---
title: Use the Word add-in for Business Central to layout document reports
description: Learn about the Dynamics 365 Business Central add-in for Word. 
author: kennienp
ms.author: kepontop 
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: 
ms.date: 04/01/2026
ms.custom: bap-template
---
# Use the Word add-in for report layouts

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

The Dynamics 365 [!INCLUDE[prod_short](includes/prod_short.md)] Word add-in includes several controls that you can use to change the behavior of Word layouts for document reports. A comment control allows you to add a comment in the layout, which appears in Word while designing the layout but doesn't appear in the rendered report. Other controls let you encode a layout file with conditional visibility of fields, tables, table rows, and table columns based on data.

## Word add-in versions

There are two versions of the Dynamics 365 Business Central Word add-in available:

- **Dynamics 365 Business Central Word Add-in** - The stable release version with core functionality.
- **Dynamics 365 Business Central Word Add-in (preview)** - Includes new features not yet in the stable release. The preview version allows you to try upcoming features and provide feedback. Preview features are subject to change and might not be included in future release versions.

> [!TIP]
> You can install both versions in Word, and switch between them as you like.

## Install the add-in

1. On the **Home** tab, select **Get Add-ins**.
1. In the **Search** field, enter *Dynamics 365 Business Central Word Add-in* to display Business Central add-ins.
1. Select the add-in version you want and then select **Add**.

   The **Business Central** tab appears in the ribbon.

## Export the Word layout from Business Central

1. Sign in to Business Central.
1. [!INCLUDE[open-report-layouts-page](includes/open-report-layouts-page.md)]
1. Select the layout in the **Report Layouts** page.
1. Select the **Actions** > **Update and Export Layout** to download the Word layout file (.docx).

> [!IMPORTANT]
> You must use the **Update and Export Layout** action to ensure the document includes the layout metadata required by the Word add-in. Without it, you get a message about it when you try to use the add-in in Word.

## Add Data

[!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

The Word add-in includes a task pane that lets you insert mapped fields from a report dataset, such as data, labels, and report information, in a layout. Use this task pane for an intuitive interface instead of the XML Mapping pane.

1. In the **Business Central** tab, select **Add Data** to open the **Business Central** data task pane.
1. Expand the collapsible tree to view data, labels, and report information:

   | Node| Description|
   |---|---|
   |**Data**|Includes nodes for table (data item) and its underlying source fields (columns) defined in the report's dataset. Use the table node to add a *repeater*, which repeats a row of columns for each record in a dataset.<br><br>Add a repeater when you want to display a section that lists records in the table, displaying the same fields for each record. For example, if you want a list of customers, the repeater repeats the same layout for each customer&mdash;showing their number, name, salesperson, and balance.<br><br> Learn more in the [exercise that follows](#exercise-create-a-simple-customer-list-layout).  |
   |**Labels**|Includes text strings for titles, headings, and captions in report.|
   |**Report information**|Includes fields that contain information about the report, like its ID, and requests to run the report, like the date and time (for example, *Report Date* or *Report ID*). This information is often referred to as *metadata*.|

1. To add a field or repeater, place the cursor in the Word document where you want it.
1. In the **Business Central** task pane, select the field or table, and then select **Add field** or **Add repeater**.

   > [!TIP]
   > A repeater is a layout control that renders a collection of records as repeating rows, where each row represents one record and each column represents a field. It's the core control used to show lists of data.

### Exercise: Create a simple customer list layout

In this exercise, you create a Word layout that lists customers. This exercise creates the layout based on report 101 Customer List. The layout lists customers in a table with columns for customer number, customer name, salesperson code, and balance.

#### Step 1: Create and export a blank layout in Business Central

1. In [!INCLUDE[prod_short](includes/prod_short.md)], create a blank Word layout for a report 101 Customer List.

   1. [!INCLUDE[open-report-layouts-page](includes/open-report-layouts-page.md)]
   1. Select **New**.
   1. In the **Add New Layout for a Report** dialog box, set the following fields.

      | Field | Value | 
      |---|---|
      | Report ID | 101 |
      | Layout Name | Enter a brief descriptive name for the layout to help you easily identify it. |
      | Format Options | **Word**|

   1. Turn on the **Create a blank layout from the report object** option.
   1. Select **OK**.
1. Export the new layout.

   1. Select the layout in the **Report Layouts** page.
   1. Select the **Actions** > **Update and Export Layout** to download the Word layout file (.docx).

#### Step 2: Customize the layout using the Word add-in

If you're using the Dynamics 365 Business Central Word Add-in (preview) version, there are two ways to complete this task. If you're not using the preview version, use the data task pane.  

# [Using data task pane](#tab/taskpane)

1. Open the downloaded document in Word.
1. Insert a table with two rows and four columns in the desired location in the document.

   The first is for defining the column headings. The second row is for the data for each customer (this row repeats).
1. Select **Add Data** to open the **Business Central** data task pane.
1. In the first row, add the following text in the columns: **No.**, **Name**, **Salesperson code**, **Balance**.
1. Define the repeater on the second row for listing the customers:

   1. In the **Business Central** tab, select **Add Data** to open the Word add-in task pane.
   1. In the task pane, expand the `Data` node, and then the `Customer` node.
   1. In the document, select the entire second row.
   1. In the task pane, select the `Customer` node and then **Add repeater**. The repeater is applied to the selected row.
  
1. Add fields to the repeater row:

   1. In the second row of the table, place the cursor in the first cell (the **No.** column of the table).
   1. In the task pane, select `Customer_No_` and then **Add field**.
   1. Repeat steps 1 and 2 to add:

      - `CustAddr_1_` in the **Name** column
      - `Customer__Salesperson_Code` in the **Salesperson code** column
      - `Customer_Balance_LCY` in the **Balance** column.
1. Save the Word file.

# [Using insert table control (preview only)](#tab/inserttable)

[This feature is only available in Dynamics 365 Business Central Word Add-in (preview). This is prerelease documentation and is subject to change.]

1. Open the downloaded document in Word.
1. Place your cursor in the document where you want the table, and then select **Insert table**.

   The **Create table** page appears.
1. Set **Data source** to **Customer**.
1. Under **Repeater fields**, add the columns for the list

   1. Set **Field** to `Customer_No_` and **Headline** to `None`.
   1. Select **Add Column** to add new columns for `CustAddr_1_`, `Customer__Salesperson_Code`, and `Customer_Balance_LCY` fields.

   :::image type="icon" source="media/word-add-in-insert-table.png":::

   **Include header row** adds a header row in the table with headlines. **Auto-select headline** automatically sets column headlines by matching field labels that end with "Caption".
1. Select **Create table** to insert the table in the layout.
1. Save the Word file.

---

#### Step 3: Import and test the layout in Business Central

1. In [!INCLUDE[prod_short](includes/prod_short.md)], return to the **Report Layouts** page,
1. Select the layout you created for the customer list, and then select the **Replace Layout** action.
1. Browse for the Word layout document you modified and select **Open** to import the layout.
1. Select the **Run Report** > **Print** to test the layout.

## Insert Table (preview)

[This feature is only available in Dynamics 365 Business Central Word Add-in (preview) version. This is prerelease documentation and is subject to change.]

The **Insert table** control provides an easier alternative to the task pane for displaying records in rows. Instead of creating the table manually, adding a repeater, and then adding field controls to each column, the **Insert table** control lets you design the table from a single dialog, where you:

- Specify the data source and column headings (with an option to generate headings automatically by matching on caption fields)
- Add a footer
- Reorder columns by dragging

Learn how to use this control in [Step 2: Customize the layout using the Word add-in](#step-2-customize-the-layout-using-the-word-add-in) of the previous example. 

## Insert Layout Comment

As a layout creator, you might want to include comments in the layout file to help yourself or the next person who maintains it. Comments don't appear in the document when the report is rendered. You can include text or tables in a comment control.

Use comments for tasks such as describing difficult parts of the layout or adding a change log table to track different versions. Comments are useful when troubleshooting a report issue because it helps to have a copy of both the rendered report and the layout file.

There are two ways to insert a comment:

- Add your content as text and tables first, select the content and then **Business Central** > **Insert layout comment** to add the comment control. Clicking anywhere within the comment shows the **Hidden Comment** border.
- Place your cursor where you want the comment, select **Business Central** > **Insert layout comment** to insert a comment control with the text `This text will not be printed in the final report`. Select inside the control and then edit the comment.

### Exercise: Add a versioning table in a layout

1. In [!INCLUDE[prod_short](includes/prod_short.md)], export a Word layout for a report:

   1. Sign in to [!INCLUDE[prod_short](includes/prod_short.md)].
   1. Search for and open the **Report Layouts** page.
   1. Choose a layout in the list that has the **Type** equal to **Word**.
   1. Select **Export Layout**.
1. In Word, add a comment to the layout:
   1. Open the Word layout file you downloaded.
   1. At the end of the document, insert a table with three columns and two rows like this:

      | Layout description | Version | Date of change |
      |-|-|-|
      |This layout uses a comment| 1.0 | \<todays date\> |

   1. Select the entire table, and then select the **Business Central** > **Insert layout comment**.

   When you place your cursor somewhere in the table, the control displays a **Hidden Comment** label.

1. In [!INCLUDE[prod_short](includes/prod_short.md)], import and run the layout:

   1. In the **Report Layouts** page, select the report for the new layout, and then select **New**.
   1. In **Add New Layout for a Report** page, fill in the fields, making sure to set **Format Options** to **Word**.
   1. Select **OK** and upload the layout file.
   1. In the **Report Layouts** page, select **Run Report**. The comment shouldn't be present.

## Hide Field if Zero

In some reports, you might want to mimic the [BlankZero](properties/devenv-blankzero-property.md) or [BlankNumbers](properties/devenv-blanknumbers-property.md) properties that exist on table and page fields in AL code. That is, for some layouts you want to display field values of 0 as 0, while for others, you want to leave the field blank.

For this behavior, you can use the **Hide Field if Zero** control.

1. In Word, select the field, which can be standalone field or included in a repeater.
1. In the **Business Central** tab, select **Hide if empty** > **Hide Field if Zero**.

When the report is run, zero values are converted to a blank string.

## Hide Empty Table

If you have a data item in the dataset that might or might not include data, you can enclose the table in a repeater with the **Hide Empty Table** control. If no rows exist when rendering the report at runtime, the table applied with the control is removed from the document.

1. In Word, select the table.

   > [!IMPORTANT]
   > You must apply the **Hide Empty table** control to the table, not the repeater control.

1. In the **Business Central** tab, select **Hide if empty** > **Hide Empty Table**.

## Hide Empty Table Row

If you have a data item in the dataset, where field should determine whether the row is shown, you can enclose that field in the repeater with the **Hide Empty Table Row** control. For rows in which this field has no value, the row isn't included in the rendered report at runtime.

1. In Word, select the field.
1. In the **Business Central** tab, select **Hide if empty** > **Hide Empty Table Row**.

## Hide Empty Table Column

Suppose you have a data item in the dataset, where no table header and table column should be visible in the absence of data in the field (across all rows in the data item). In this case, you can enclose that field in the table header with the **Hide Empty Table Column** control. For datasets where no values exist for that field, columns that include the field are removed from the rendered report at runtime.

A use case for this layout control is discounts, where you want to remove the discount column from the invoice if no discount is applied.

1. In Word, select the field in the table header.
1. In the **Business Central** tab, select **Hide if empty** > **Hide Empty Table Column**.

> [!TIP]
> You can combine **Hide Empty Table Column** with **Hide Field if Zero** to hide columns with zero values. Add the **Hide Field if Zero** to the field in the repeater, and then use **Hide Empty Table Column** on the corresponding field in the table header.

### Exercise: Make a version of the purchase invoice report where discount column is removed

The RDLC layout for report 406 **Purchase - Invoice** has a table with a **Discount %** column. The demonstration data for Cronus company should have plenty of purchase invoices without any discount.

In this exercise, create an empty Word layout for report 406. Then, recreate the table from the RDLC layout but use the **Hide Empty Table Column** control to remove the *Discount %* column in the rendered report when no discount is given.

## Related information

[Creating a Word layout report](devenv-howto-report-layout.md)  
