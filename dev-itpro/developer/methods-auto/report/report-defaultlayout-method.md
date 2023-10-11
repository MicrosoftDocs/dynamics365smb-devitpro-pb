---
title: "Report.DefaultLayout(Integer) Method"
description: "Gets the default built-in layout type that is used on a specified report."
ms.author: solsen
ms.custom: na
ms.date: 04/11/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.DefaultLayout(Integer) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the default built-in layout type that is used on a specified report.


## Syntax
```AL
DefaultLayout :=   Report.DefaultLayout(Number: Integer)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to save. If the report that you specify does not exist, then a run-time error occurs.  


## Return Value
*DefaultLayout*  
&emsp;Type: [DefaultLayout](../defaultlayout/defaultlayout-option.md)  
The default built-in layout type that is used on a specified report.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The default layout for a report is specified by the report's [DefaultLayout Property](../../properties/devenv-defaultlayout-property.md).

## Example (using Report::<object identifier> syntax)

As mentioned above, the `Report.DefaultLayout` method will throw a run-time error if no report with the supplied object ID exists. If you know the report object, a safe way to call Report.DefaultLayout is to use the Report::<object identifier> syntax as the compiler will tell you if Report1 doesn't exist.  

```AL
procedure MyProcKnownReport()
var
    layout: DefaultLayout;
begin
    // When you know the report object, this is safe
    // as the compiler will tell you if MyReport does not exist
    layout := Report.DefaultLayout(Report::MyReport);
end;
```

## Example (using a Try function)

As mentioned above, the `Report.DefaultLayout` method will throw a run-time error if no report with the supplied object ID exists. If you don't know the report object in your AL code, then you can wrap the `Report.DefaultLayout` method in a Try function as it doesn't write to the database.

```AL
procedure GetLayout(ObjectId: Integer): DefaultLayout
var
    layout: DefaultLayout;
begin
    if not TryReportDefaultLayout(ObjectId) then begin
        // handle error here
    end
    else // now it is safe to call Report.DefaultLayout
        layout := Report.DefaultLayout(ObjectId);

    exit(layout);
end;

[TryFunction]
// Safe to wrap Report.DefaultLayout in a try function
// as it does not write to the database 
procedure TryReportDefaultLayout(ObjectId: Integer)
var
    layout: DefaultLayout;
begin
    layout := Report.DefaultLayout(ObjectId);
end;
```

## See also

[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)