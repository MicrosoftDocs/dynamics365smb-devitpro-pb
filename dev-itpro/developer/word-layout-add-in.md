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
# Use the Word add-in for report layouts

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

The Dynamics 365 Business Central Word add-in includes several controls that you can use change the behavior Word layouts for document reports. A comment control allows you to add a comment in the layout, which appears in Word while designing the layout but doesn't appear in the rendered report. Other controls let you encode a layout file with conditional visibility of fields, tables, table rows, and table columns based on data.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Install the add-in

1. On the **Home** tab, select **Get Add-ins**.
2. In the **Search** field, enter *Dynamics 365 Business Central Word Add-in*, then select **Add** next to the add-in when it appears.

    The **Business Central (preview)** tab appears in the ribbon.

## Comment control

As a layout creator, you might want to include comments in the layout file to help yourself or the next person who maintains it. Comments don't appear in the document when the report is rendered. You can include text or tables in a comment control.

Use comments for tasks such as describing difficult parts of the layout or adding a change log table to track different versions. Comments are useful when troubleshooting a report issue because it helps to have a copy of both the rendered report and the layout file.

There are two ways to insert a comment:

- Add your content as text and tables first, select the content and then **Business Central (preview)** > **Insert layout comment** to add the comment control. Clicking anywhere within the comment shows the **Hidden Comment** border.
- Place your cursor where you want the comment, select **Business Central (preview)** > **Insert layout comment** to insert a comment control with the text `This text will not be printed in the final report`. Select inside the control and then  the comment.

### Excercise: Add a versioning table in a layout

1. In Business Central, export a Word layout for a report:

   1. Sign in to Business Central.
   1. Search for and open the **Report Layouts** page.
   1. Choose a layout in the list that has the **Type** equal to **Word**.
   1. Select **Export Layout**.
1. In Word, add a comment to the layout:
   1. Open the Word layout file you downloaded.
   1. At the end of the document, insert a table with three columns and two rows like this:

      | Layout description | Version | Date of change |
      |-|-|-|
      |This layout uses a comment| 1.0 | \<todays date\> |

   1. Select the entire table, and then select the **Business Central (preview)** > **Insert layout comment**.

   When you place your cursor somewhere in the table, the control displays a **Hidden Comment** label.

1. In Business Central, import and run the layout:

   1. In the **Report Layouts** page, select the report for the new layout, and then select **New**.
   1. In **Add New Layout for a Report** page, fill in the fields, making sure to set **Format Options** to **Word**.
   1. Select **OK** and upload the layout file.
   1. In the **Report Layouts** page, select **Run Report**. The comment shouldn't be present.

## Hide Field if Zero control

In some reports, you might want to mimic the [BlankZero](properties/devenv-blankzero-property.md) or [BlankNumbers](properties/devenv-blanknumbers-property.md) properties that exist on table and page fields in AL code. That is, for some layouts you want to display field values of 0 as 0, while with other you want to leave the field blank.

For this behavior, you can use the **Hide Field if Zero** control.

1. In Word, select the field, which can be standalone field or included in a repeater.
1. In the **Business Central (preview)** tab, select **Hide if empty** > **Hide Field if Zero**.

When the report is run, zero values to a blank string.

## Hide Empty Table control

If you have a data item in the dataset that might or might not include data, you can enclose the table in a repeater with the **Hide Empty Table** control. If no rows exist when rendering the report at runtime, the table applied with the control is removed from the document.

1. In Word, select the table.

  > [!IMPORTANT]
  > You must apply the **Hide Empty table** control to the table, not the repeater control.

1. In the **Business Central (preview)** tab, select **Hide if empty** > **Hide Empty Table**.

## Hide Empty Table Row control

If you have a data item in the dataset, where field should determine whether the row is shown, you can enclose that field in the repeater with the **Hide Empty Table Row** control. For rows in which this field has no value, the row isn't included in the rendered report at runtime.

1. In Word, select the field.
1. In the **Business Central (preview)** tab, select **Hide if empty** > **Hide Empty Table Row**.

## Hide Empty Table Column control

Suppose you have a data item in the dataset, where no table header and table column should be visible in the absence of data in the field (across all rows in the data item). In this case, you can enclose that field in the table header with the **Hide Empty Table Column** control. For datasets where no values exist for that field, columns that include the filed are removed from the rendered report at runtime.

A use case for this layout control is discounts, where you want to remove the discount column from the invoice if no discount is applied.

1. In Word, select the field in the table header.
1. In the **Business Central (preview)** tab, select **Hide if empty** > **Hide Empty Table Column**.

> [!TIP]
> You can combine **Hide Empty Table Column** with **Hide Field if Zero** to hide columns with zero values. Add the **Hide Field if Zero** to the field in the repeater, and then use **Hide Empty Table Column** on the corresponding field in the table header.

### Exercise: Make a version of the purchase invoice report where discount column is removed

The RDLC layout for report 406 **Purchase - Invoice** has a table with a **Discount %** column. The demonstration data for Cronus company should have plenty of purchase invoices without any discount.

In this exercise, create an empty Word layout for report 406. Then, recreate the table from the RDLC layout but use the **Hide Empty Table Column** control to remove the *Discount %* column in the rendered report no discount is given.

## Related information

[Creating a Word layout report](devenv-howto-report-layout.md)  