---
title: "Extending Customer, Vendor, and Item Templates"
description: "How you extend templates in Dynamics 365 Business Central."
author: bholtorf
ms.custom: na
ms.date: 10/14/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: romanz
---

# Extending Customer, Vendor, and Item Templates
You can extend customer, vendor, and item templates, or create your own template and use it for primary tables. The following sections provide examples.

## Example: Extend an existing customer template by adding a field
You can add a field to a customer template, and then include the field when someone uses the template to create a new customer. You just need to add field with the same number, type, and length, to the **Customer** and **Customer Templ.** tables. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] will transfer value from the template to new records.

<!--Do we need code for this example, or is enough to just tell them to "add a field" to the two tables?-->

## Example: Use configuration templates
This example shows how use configuration templates instead of creating new templates. 

<!--
> [!NOTE]
> You are still able to use application code from old template instances until it will be removed. After that, if you still want to use configuration templates you need to copy code to your own objects.
-->
```
codeunit 50102 ConfigTemplateExtMgt
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Templ. Mgt.", 'OnBeforeCreateCustomerFromTemplate', '', false, false)]
    local procedure OnBeforeCreateCustomerFromTemplateHandler(var Customer: Record Customer; var Result: Boolean; var IsHandled: Boolean)
    var
        MiniCustomerTemplate: Record "Mini Customer Template";
    begin
        IsHandled := true;
        Result := MiniCustomerTemplate.NewCustomerFromTemplate(Customer);
    end;
}
```

## Example: Verify the fields you added to extend existing primary template table and template card
This example shows how to verify the fields you added to existing templates with a data and template card. You can run this procedure in tests, for example, to ensure that the fields you added on the Customer Card page also exist on the Customer Template Card page.

```
    procedure CustomerTemplCardControls()
    var
        CustomerCardPageControlField: Record "Page Control Field";
        CustomerTemplCardPageControlField: Record "Page Control Field";
        CustomerTemplField: Record Field;
    begin
        CustomerTemplCardPageControlField.SetRange(PageNo, Page::"Customer Templ. Card");

        CustomerCardPageControlField.SetRange(PageNo, Page::"Customer Card");
        CustomerCardPageControlField.SetFilter(FieldNo, '<>0');
        if CustomerCardPageControlField.FindSet() then
            repeat
                if CustomerTemplField.Get(Database::"Customer Templ.", CustomerCardPageControlField.FieldNo) then begin
                    CustomerTemplCardPageControlField.SetRange(FieldNo, CustomerCardPageControlField.FieldNo);
                    if CustomerTemplCardPageControlField.IsEmpty then
                        Error('%1 should exist on the customer template card.', CustomerCardPageControlField.ControlName);
                end;
            until CustomerCardPageControlField.Next() = 0;
    end;
```

## Example: Create a new template for the primary table
This example shows how to create a template for the Resource table, and then use the template to create a new resource. Let's extend the Resource table by adding a new field named **Extension Field**.

```
tableextension 50101 ResourceExt extends Resource
{
    fields
    {
        field(50101; "Extension Field"; Text[50])
        {
            Caption = 'Extension Field';
        }
    }
}

pageextension 50102 ResourceCardExt extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("Extension Field"; "Extension Field")
            {
                ApplicationArea = All;
            }
        }
    }
}
```

Here's a new template table for resources. <!--Don't understand that sentence, "Note there is one existing in master data field "Resource Group No." and one new field "Extension Field" that also extend the Resource table." -->

```
table 50103 "Resource Template"
{
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(14; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            TableRelation = "Resource Group";
        }
        field(50100; "Template Description"; Text[50])
        {
            Caption = 'Template Description';
        }
        field(50101; "Extension Field"; Text[50])
        {
            Caption = 'Extension Field';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}
```

The following card and list pages for the new template allow you to edit the template, or select it when you create a new resource.

```
page 50104 "Resource Template Card"
{
    PageType = Card;
    SourceTable = "Resource Template";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field("Template Description"; "Template Description")
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                Caption = 'Details';

                field("Resource Group No."; "Resource Group No.")
                {
                    ApplicationArea = All;
                }
                field("Extension Field"; "Extension Field")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

page 50105 "Resource Template List"
{
    Caption = 'Resource Templates';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Resource Template";
    CardPageId = "Resource Template Card";

    layout
    {
        area(Content)
        {
            repeater(Templates)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field("Template Description"; "Template Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
```

The following management codeunit runs the template list page for selecting templates when you create a new resource. It also transfers data from the **Extension Field** and **Resource Group No.** fields from the template to the Resource record.

```
codeunit 50101 TemplateExtMgt
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    var
        ResourceNewMode: Boolean;

    local procedure CreateResourceFromTemplate(var Resource: Record Resource)
    var
        SrcResource: Record Resource;
        ResourceTemplate: Record "Resource Template";
    begin
        if not ResourceNewMode then
            exit;

        ResourceNewMode := false;

        if not SelectResourceTemplate(ResourceTemplate) then
            exit;

        SrcResource.Init();
        SrcResource.Insert(true);

        SrcResource."Resource Group No." := ResourceTemplate."Resource Group No.";
        SrcResource."Extension Field" := ResourceTemplate."Extension Field";
        SrcResource.Modify();

        Resource.Copy(SrcResource);
    end;

    local procedure SelectResourceTemplate(var ResourceTemplate: Record "Resource Template"): Boolean
    var
        ResourceTemplateList: Page "Resource Template List";
    begin
        if ResourceTemplate.Count = 1 then begin
            ResourceTemplate.FindFirst();
            exit(true);
        end;

        if (ResourceTemplate.Count > 1) and GuiAllowed then begin
            ResourceTemplateList.SetTableView(ResourceTemplate);
            ResourceTemplateList.LookupMode(true);
            if ResourceTemplateList.RunModal() = Action::LookupOK then begin
                ResourceTemplateList.GetRecord(ResourceTemplate);
                exit(true);
            end;
        end;

        exit(false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Resource Card", 'OnNewRecordEvent', '', false, false)]
    local procedure OnNewRecordEventHandler()
    begin
        ResourceNewMode := true;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Resource Card", 'OnAfterGetCurrRecordEvent', '', false, false)]
    local procedure OnAfterGetCurrRecordEventHandler(var Rec: Record Resource)
    begin
        CreateResourceFromTemplate(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Resource Card", 'OnBeforeOnAfterGetCurrRecord', '', false, false)]
    local procedure OnBeforeOnAfterGetCurrRecordHandler(sender: Page "Resource Card")
    begin
        sender.Update();
    end;
}
```
## See Also
[Extending Application Areas](devenv-extending-application-areas.md)