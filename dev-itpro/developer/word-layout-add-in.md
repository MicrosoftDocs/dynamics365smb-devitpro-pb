---
title: Use the Word add-in for Business Central to layout document reports
description: Learn about the Dynamics 365 Business Central add-in for Word. 
author: kennienp
ms.author: kepontop 
ms.reviewer: jswymer
ms.topic: conceptual 
ms.collection: 
ms.date: 09/16/2024
ms.custom: bap-template
---
# Use the Word add-in for Business Central to layout document reports

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The Dynamics 365 Business Central Word add-in gives you a way to layout document reports with conditional visibility.

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Install the add-in

1. On the **Home** tab, select **Get Add-ins**.
2. In the **Search** field, enter *Dynamics 365 Business Central Word Add-in*, then select **Add** next to the add-in when it appears.

    The **Business Central (preview)** tab appears in the ribbon.

## Layout controls for document reports

The Word add-in introduces *layout controls* that you use to encode a layout file with conditional visibility of fields, tables, table rows, and table columns based on data. It also includes a way for layout creators to include comments in the layout file. These comments will then be removed from the document when the report is rendered.

## The *comment* control

As a layout creator, you might want to include comments in the layout file to help you or the next person who need to maintain the layout. These comments will then be removed from the document when the report is rendered. You can include text or tables in a comment control.

Use comments for things such as describing difficult parts of the layout, or maybe add a change log table in the end of the file to track different versions of the layout. This could be useful when troubleshooting a report issue (you will need to get both a copy of the rendered report and the layout as the comment will have been removed from the former at runtime).

### Exercise: Add a versioning table

Download any Word layout from Business Central from the Report Layouts page (filter to type *Word* and then use the *Export Layout* action). Navigate to the end of the Word file. Add a table with three columns and two rows like this:

| Layout description | Version | Date of change |
| ------------------ | ------- | -------------- | 
| Layout using a comment | 1.0 | <todays date> |

Then mark the table and choose the *comment* control from the *Layout Controls* menu in the Business Central add-in.

When you place your cursor somewhere in the table, you will notice that the control displays a "Hidden Comment" text. 

Contratulations, you have added your first comment. 

Now, try importing the layout back to Business Central: from the Report Layouts page, make sure you have focus on the report, and then use the *New* action to import the layout. Then use the *Run* action to test the layout. Hopefully, the comment is now gone (from the generated report.)

## Hide if empty: the *Hide Field if Zero* control

In some reports, you might want to mimic the BlankZero or BlankNumbers properties that exist on table and page fields. You can achieve this in the dataset, but what if you don't have control over the AL code? Or if some layouts should show zeros and others blank them out? 

Here, the *Hide Field if Zero* control comes to the rescue: simply apply it to a field (standalone or as part of a repeater). At runtime, the Business Central server will then convert any zero values to a blank string.


## Hide if empty: the *Hide Empty Table* control

If you have a data item in the dataset that might have data and might not, you can enclose the repeater in a table with the *Hide Empty Table* control. If no rows exists when rendering the report at runtime, the Business Central server will then simply cut the enclosing table from the document. 

**Note!** The *Hide Empty table* you have to place on the table itself, not on the repeater.

## Hide if empty: the *Hide Empty Table Row* control

If you have a data item in the dataset, where one field should determine if the row is shown, you can enclose that fields in the repeater with the *Hide Empty Table Row* control. For rows, where that field has no value, when rendering the report at runtime, the Business Central server will then simply cut the row from the table. 


## Hide if empty: the *Hide Empty Table Column* control

If you have a data item in the dataset, where no table header and table column should be visible in the absense of data in the field (across all rows in the dataitem), you can enclose that fields in the table header with the *Hide Empty Table Column* control. For datasets, where that no values exist for that field, when rendering the report at runtime, the Business Central server will then simply cut the column from the table. 

One use case for this layout control is discounts, where you want to remove the discount column from the invoice if no discount has been applied. 

**Note!** You can combine *Hide Empty Table Column* with *Hide Field if Zero* to hide columns with zero values. Just add the *Hide Field if Zero* to the field in the repeater and use *Hide Empty Table Column* on the corresponding field in the table header.

### Exercise: Make a version of the purchase invoice report where discount column is removed

The RDLC layout for report 406, *Purchase - Invoice* has a table with a *Discount %* column. The demo data for Cronus should have plenty of purchase invoices without any discount. 

In this exercise, try to create an empty Word layout for report 406 and then see if you can re-create the table from the RDLC layout, but now in a version where the *Discount %* column is removed if no discount is given.

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
