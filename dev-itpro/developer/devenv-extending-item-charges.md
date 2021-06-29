---
title: "Extending Item Charges Distribution Methods"
description: "How you extend item charges in Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: grobyns
---

# Extending Item Charge Distribution Methods 
To ensure correct valuation, your inventory items must carry any added costs, such as freight, physical handling, insurance, and transportation that you incur when purchasing or selling the items.

Users can add these costs by adding a Charge (Item) line to the involved purchase or sales document. For more information, see [Use Item Charges to Account for Additional Trade Costs](/dynamics-nav-app/payables-how-assign-item-charges) in application help. 

Item charges are distributed over other item lines in the document according to a distribution method. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] offers four distribution methods out of the box: **Equally**, **By Amount**, **By Weight**, and **By Volume**. This article explains how to remove or add item charge distribution methods. The article describes the method for purchases. The steps are similar for sales, except the events are located in codeunit 5807, **Item Charge Assgnt. (Sales)**.

To enable extension of item charges distribution methods, two events can be found in codeunit 5805, **Item Charge Assgnt. (Purch.)**. The work consists of the following two tasks:

1. In the **OnBeforeShowSuggestItemChargeAssignStrMenu** event, you manipulate the options that are presented to users. You can remove, add, and change the order of the options.

    - Keep in mind that other extensions may also manipulate the options. 
    - You should not assume that an option will exist, nor should you write code that may remove an option added by another extension. 

2. In the **OnAssignItemCharges** event, you distribute the item charge amount over the item lines according to your new distribution method.

    - You must verify that the option selected by the user is your new option. If it is not, then exit without taking action. 
    - When you have distributed the amount over the lines, you must set the ItemChargesAssigned boolean to true. If you do not set this boolean to true, an error will occur.

The following procedures show how to extend the item charges distribution methods: 

1. Add a new option to the item charges distribution methods in the **OnBeforeShowSuggestItemChargeAssignStrMenu** event. 
2. Add a new distribution method for item charges.
3. Call the new distribution method in the **OnAssignItemCharges** event.

The procedures are based on an example where the **By Fairy Dust** option is added to the string menu (STRMENU) and added to the CASE statement.

> [!NOTE]  
> To complete this example you will have to add a new field **Fairy Dust** to the **Purchase Line** table and other relevant tables and pages.

## To add a new option to the item charges distribution methods

Create a new codeunit and add an event subscriber to the **OnBeforeShowSuggestItemChargeAssignStrMenu** event.

```AL
codeunit 50100 "Item Ch. Assign by Fairy Dust"
{
    var
        ByFairyDustTok: Label 'By Fairy Dust';

    local procedure AssignByFairyDustMenuText(): Text
    begin
        exit(ByFairyDustTok)
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Charge Assgnt. (Purch.)", 'OnBeforeShowSuggestItemChargeAssignStrMenu', '', false, false)]
    local procedure AddByFairyDustOnBeforeShowSuggestItemChargeAssignStrMenu(PurchLine: Record "Purchase Line"; var SuggestItemChargeMenuTxt: Text; var SuggestItemChargeMessageTxt: Text; var Selection: Integer)
    begin
        // if 'By Fairy Dust' is not in the menu options, add it at the end
        if StrPos(SuggestItemChargeMenuTxt, AssignByFairyDustMenuText) = 0 then begin
            SuggestItemChargeMenuTxt += ',' + AssignByFairyDustMenuText;
            // make the last option ('By Fairy Dust') the default selection
            Selection := StrLen(DelChr(SuggestItemChargeMenuTxt, '=', DelChr(SuggestItemChargeMenuTxt, '=', ','))) + 1;
        end;
    end;
}
```

## To add a new distribution method for item charges
In the new codeunit, add functions to distribute the charges over the item lines.

```AL
    local procedure AssignByFairyDust(var ItemChargeAssignmentPurch: Record "Item Charge Assignment (Purch)"; Currency: Record Currency; TotalQtyToAssign: Decimal; TotalAmtToAssign: Decimal);
    var
        TempItemChargeAssgntPurch: Record "Item Charge Assignment (Purch)" temporary;
        LineArray: array[2] OF Decimal;
        TotalFairyDust: Decimal;
        QtyRemaining: Decimal;
        AmountRemaining: Decimal;
    begin
        // copy lines to temp variable and calculate total Fairy Dust
        repeat
            if not ItemChargeAssignmentPurch.PurchLineInvoiced then begin
                TempItemChargeAssgntPurch.Init();
                TempItemChargeAssgntPurch := ItemChargeAssignmentPurch;
                TempItemChargeAssgntPurch.Insert(false);
                GetItemValues(TempItemChargeAssgntPurch, LineArray);
                TotalFairyDust := TotalFairyDust + (LineArray[2] * LineArray[1]);
            end;
        until ItemChargeAssignmentPurch.Next = 0;

        if TempItemChargeAssgntPurch.Findset(true) then
            repeat
                // Calculate Fairy Dust to assign to the line
                GetItemValues(TempItemChargeAssgntPurch, LineArray);
                if TotalFairyDust <> 0 then
                    TempItemChargeAssgntPurch."Qty. to Assign" :=
                      (TotalQtyToAssign * LineArray[2] * LineArray[1]) / TotalFairyDust + QtyRemaining
                else
                    TempItemChargeAssgntPurch."Qty. to Assign" := 0;

                // Assign Fairy Dust to the line and calculate the remaining Fairy Dust to assign
                ItemChargeAssignmentPurch.Get(
                  TempItemChargeAssgntPurch."Document Type",
                  TempItemChargeAssgntPurch."Document No.",
                  TempItemChargeAssgntPurch."Document Line No.",
                  TempItemChargeAssgntPurch."Line No.");
                ItemChargeAssignmentPurch."Qty. to Assign" := Round(TempItemChargeAssgntPurch."Qty. to Assign", 0.00001);
                ItemChargeAssignmentPurch."Amount to Assign" :=
                  ItemChargeAssignmentPurch."Qty. to Assign" * ItemChargeAssignmentPurch."Unit Cost" + AmountRemaining;
                AmountRemaining := ItemChargeAssignmentPurch."Amount to Assign" -
                  Round(ItemChargeAssignmentPurch."Amount to Assign", Currency."Amount Rounding Precision");
                QtyRemaining := TempItemChargeAssgntPurch."Qty. to Assign" - ItemChargeAssignmentPurch."Qty. to Assign";
                ItemChargeAssignmentPurch."Amount to Assign" :=
                  Round(ItemChargeAssignmentPurch."Amount to Assign", Currency."Amount Rounding Precision");
                ItemChargeAssignmentPurch.Modify(false);

            until TempItemChargeAssgntPurch.Next = 0;
        TempItemChargeAssgntPurch.DeleteAll(false);
    end;

    procedure GetItemValues(TempItemChargeAssgntPurch: Record "Item Charge Assignment (Purch)" temporary; var DecimalArray: Array[2] OF Decimal);
    var
        PurchaseLine: Record "Purchase Line";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        ReturnShptLine: Record "Return Shipment Line";
        TransferRcptLine: Record "Transfer Receipt Line";
        SalesShptLine: Record "Sales Shipment Line";
        ReturnRcptLine: Record "Return Receipt Line";
    begin
        // Get the Fairy Dust for the line
        Clear(DecimalArray);
        with TempItemChargeAssgntPurch do
            case "Applies-to Doc. Type" of
                "Applies-to Doc. Type"::Order,
                "Applies-to Doc. Type"::Invoice,
                "Applies-to Doc. Type"::"Return Order",
                "Applies-to Doc. Type"::"Credit Memo":
                    begin
                        PurchaseLine.Get("Applies-to Doc. Type", "Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := PurchaseLine.Quantity;
                        DecimalArray[2] := PurchaseLine."Fairy Dust";
                    end;
                "Applies-to Doc. Type"::Receipt:
                    begin
                        PurchRcptLine.Get("Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := PurchRcptLine.Quantity;
                        DecimalArray[2] := PurchRcptLine."Fairy Dust";
                    end;

                "Applies-to Doc. Type"::"Return Receipt":
                    begin
                        ReturnRcptLine.Get("Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := ReturnRcptLine.Quantity;
                        DecimalArray[2] := ReturnRcptLine."Fairy Dust";
                    end;
                "Applies-to Doc. Type"::"Return Shipment":
                    begin
                        ReturnShptLine.Get("Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := ReturnShptLine.Quantity;
                        DecimalArray[2] := ReturnShptLine."Fairy Dust";
                    end;
                "Applies-to Doc. Type"::"Transfer Receipt":
                    begin
                        TransferRcptLine.Get("Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := TransferRcptLine.Quantity;
                        DecimalArray[2] := TransferRcptLine."Fairy Dust";
                    end;
                "Applies-to Doc. Type"::"Sales Shipment":
                    begin
                        SalesShptLine.Get("Applies-to Doc. No.", "Applies-to Doc. Line No.");
                        DecimalArray[1] := SalesShptLine.Quantity;
                        DecimalArray[2] := SalesShptLine."Fairy Dust";
                    end;
            end;
    end;
```

## To call the new distribution method
In the new codeunit, add a subscriber to the **OnAssignItemCharges** event.

```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Charge Assgnt. (Purch.)", 'OnAssignItemCharges', '', false, false)]
    local procedure AssignByFairyDustOnAssignItemCharges(SelectionTxt: Text; var ItemChargeAssignmentPurch: Record "Item Charge Assignment (Purch)"; Currency: Record Currency; PurchaseHeader: Record "Purchase Header"; TotalQtyToAssign: Decimal; TotalAmtToAssign: Decimal; VAR ItemChargesAssigned: Boolean);
    begin
        // if item charges are already assigned, exit
        if ItemChargesAssigned then
            exit;
        // if the user did not choose 'By Fairy Dust', exit
        if not (SelectionTxt = AssignByFairyDustMenuText) then
            exit;
        // assign item charges by fairy dust
        AssignByFairyDust(ItemChargeAssignmentPurch, Currency, TotalQtyToAssign, TotalAmtToAssign);
        // charges have been assigned
        ItemChargesAssigned := true;
    end;
```


## See Also
[Extending Application Areas](devenv-extending-application-areas.md)  
 
