---
title: "IncludeCaption Property"
description: "Sets whether to include the caption of a field in the data set of a report."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IncludeCaption Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether to include the caption of a field in the data set of a report.

## Applies to
-   Report Column

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** includes the caption in the report dataset; otherwise **false**. The default value is **false**.  

## Remarks  

If `IncludeCaption` is set to **True** on a column in a dataitem, then a corresponding label called 
*{column name}Caption* is included in the dataset. The structure of where labels are available depends on the layout type (Excel, Word, or RDLC). For more information, see [Report labels](../devenv-report-object.md#report-labels).

If you want to use the Caption or CaptionML values of a field as a label on a report layout, then you must include the caption in the dataset. If you do not include the caption in the dataset, then in a multilanguage application, you cannot use the multilanguage captions as labels in the report.  

## Example

In this example, the report has a dataitem based on the **Item table**. The dataitem has a column **No_Item** based on the field **No.** from the **Item** table, and the caption of this column should be included as a label in the report dataset.

```AL
...
dataset
{
    dataitem(Item; Item)
    {
        column(No_Item; "No.")
        {
            IncludeCaption = true;
        }
}
```

The corresponding label in the dataset will then be called *No_ItemCaption*.

## See Also  

[Defining a report dataset](../devenv-report-dataset.md)   
[Report labels](../devenv-report-object.md#report-labels)  
[Caption Property](devenv-caption-property.md)  
