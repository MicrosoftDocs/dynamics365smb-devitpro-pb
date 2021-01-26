---
title: "CaptionClass Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CaptionClass Property
> **Version**: _Available or changed with runtime version 1.0._

Controls the caption that is used in the label of a field in a database table or in the label of a control on a page.

## Applies to
-   Table Field
-   Page Label
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
CaptionClass = “3, My awesome caption”;
```

The `CaptionClass` property must be expressed in the format `"<Caption Area>, <Caption Expression>"`. Both `<Caption Area>` and `<Caption Expression>` are alphanumeric strings.

## Remarks

When you set the **CaptionClass property** on a field, users can configure the caption of a text box that is connected to a label or the caption of a check box without having to modify code. The `Caption Class` in the system application layer then translates the `CaptionClass` property into actual captions that will be displayed in the UI. For example, if `CaptionClass = “3, My awesome caption”;` the result caption in the UI will be **My awesome caption**.

> [!NOTE]  
> If you omit the pattern of `"<Caption Area>, <Caption Expression>"`, the caption becomes the value of whatever string has been given to the `CaptionClass` property. This means that you can use an expression such as `CaptionClass = ItemRec.Fieldcaption("Location Code");` as long as the returned data type is Text.

### Caption Class

The `Caption Class` (codeunit 42) in the system application exposes two events; the `OnResolveCaptionClass` and the `OnAfterCaptionClassResolve` event.

For more information, see the system [Caption Class](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Caption%20Class/README.md).

The Caption Class raises an `OnResolveCaptionClass` event for any other value of <Caption Area>. 

```al
[IntegrationEvent(false, false)]
    internal procedure OnResolveCaptionClass(CaptionArea: Text; CaptionExpr: Text; Language: Integer; var Caption: Text; var Resolved: Boolean)
    begin
    end;
```

The `OnAfterCaptionClassResolve` event is used to overwrite the above logic, in case the `CaptionClass` property is not the expected format or if some extra logic needs to be added.

```al
[IntegrationEvent(false, false)]
    internal procedure OnAfterCaptionClassResolve(Language: Integer; CaptionExpression: Text; var Caption: Text[1024])
    begin
    end;
```

The following example shows an implementation of the `OnResolveCaptionClass` event.

```al
codeunit 50000 "MyCaptionClassMgmt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Caption Class", 'OnResolveCaptionClass', '', true, true)]
    local procedure MyOnResolveCaptionClass(CaptionArea: Text; CaptionExpr: Text; Language: Integer; var Caption: Text; var Resolved: Boolean)
    begin
        if CaptionArea = '50000' then begin
            Caption := GetCaption(CaptionExpr);
            Resolved := true;
        end;
    end;

    local procedure GetCaption(CaptionExpr: Text): Text
    var
        CaptionALbl: Label 'Caption a)';
        CaptionBLbl: Label 'Caption b)';
    begin
        if CaptionExpr.Contains('A') then
            exit(CaptionALbl);
        exit(CaptionBLbl);
}
```

## See Also

[CaptionML Property](devenv-captionml-property.md)   
[Caption Property](devenv-caption-property.md)  
[CaptionClassTranslate Method](../methods-auto/system/system-captionclasstranslate-method.md) 