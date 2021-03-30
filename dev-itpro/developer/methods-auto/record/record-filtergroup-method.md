---
title: "Record.FilterGroup Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.FilterGroup Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the filter group that is applied to a table.


## Syntax
```
[Group := ]  Record.FilterGroup([Group: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Group*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


## Return Value
*Group*
&emsp;Type: [Integer](../integer/integer-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
A filter group can contain a filter for a Record that has been set earlier with the [SetFilter Method (Record)](record-setfilter-method.md) or the [SetRange Method (Record)](record-setrange-method.md). The total filter applied is the combination of all the filters set in all the filtergroups.  
  
When you select a filter group, subsequent filter settings by the [SetFilter Method (Record)](record-setfilter-method.md) or the [SetRange Method (Record)](record-setrange-method.md) apply to that group.  
  
All groups are active at all times. The only way to turn off a group is to remove the filters set in that group.  
  
Filters in different groups are all effective simultaneously. For example, if in one group, a filter is set on customer numbers 1000 to 2000, while in another group, a filter is set on customer numbers 1800 to 3000, then only numbers in the range 1800 to 2000 are visible.  
  
[!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] uses the following filter groups internally.  
  
|Number      |Name      |Description|  
|------------|----------|-----------------|  
|-1|Cross-column|Used to support the cross-column search.|  
|0|Std|The default group where filters are placed when no other group has been selected explicitly. This group is used for filters that can be set from the filter dialogs by the end user.|  
|1|Global|Used for filters that apply globally to the entire application.|  
|2|Form|Used for the filtering actions that result from the following:<br /><br /> - [SetTableView Method (XMLport)](../xmlport/xmlportinstance-settableview-method.md), [SetTableView Method (Page)](../page/page-settableview-method.md)<br/>- [SourceTableView Property](../../properties/devenv-sourcetableview-property.md)<br/>-   [DataItemTableView Property](../../properties/devenv-dataitemtableview-property.md).|  
|3|Exec|Used for the filtering actions that result from the following:<br /><br /> - [SubPageView Property](../../properties/devenv-subpageview-property.md)<br />- [RunPageView Property](../../properties/devenv-runpageview-property.md)|  
|4|Link|Used for the filtering actions that result from the following:<br /><br /> - [DataItemLink Property (Reports)](../../properties/devenv-dataitemlink-reports-property.md)<br />-   [SubPageLink Property](../../properties/devenv-subpagelink-property.md)|  
|5|Temp|Not currently used.|  
|6|Security|Used for applying security filters for user permissions.|  
|7|Factboxes|Used for clearing the state of factboxes.|  
  
A filter set in a group different from filter group 0 cannot be changed by a user that uses a filter dialog to set a filter. If, for example, a filter has been set on customer numbers 1000 to 2000 in group 4, then the user can set a filter that delimits this selection further, but cannot widen it to include customer numbers outside the range 1000 to 2000.  
  
> [!NOTE]  
> It is possible to use one of the internally used groups. If you do this, you replace the filter that [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] assumes is in this group. If, for example, you use filter group 4 in a page, you will replace the filtering that is actually the result of applying the [SubPageLink Property](../../properties/devenv-subpagelink-property.md). This could seriously alter the way pages and subpages interact.  
  
> [!IMPORTANT]  
> Using filter group 7 may cause factboxes to not work as intended.  
  
### Reset filter
To reset the filters in filter group 1, you add an empty filter to the group. To add an empty filter, to filter group 1, you must first set the filter group.  
  
```al
Rec.FilterGroup(1);  
```  
 
Then, for each field in the table that to which the Rec variable refers, set an empty filter.  
  
```al
Rec.SetFilter(<field>,'');  
```  
  
## Example 1

The following example uses the [SetFilter Method (Record)](record-setfilter-method.md) to set a filter that selects records with No. field between 10000 and 20000. Then the **FilterGroup** method returns the number for the filter group. No filter group was selected explicitly so the filter is set in filter group 0. This value is stored in the `varOrigGroup` variable and displayed in a message box. Next, the **FilterGroup** method changes the filter group to 100. The new value is stored in the `varCurrGroup` variable and displayed in a message box.  
  
```al
var
        Customer: Record Customer;
        varOrigGroup: Integer;
        varCurrGroup: Integer;
        Text000: Label 'The original filtergroup is: %1';
        Text001: Label 'The current filtergroup is: %1';
begin  
    Customer.SetFilter("No.", '10000..20000');  
    varOrigGroup := Customer.FilterGroup;  
    Message(Text000, varOrigGroup);  
    varCurrGroup := Customer.FilterGroup(1);  
    Message(Text001, varCurrGroup);  
end;
```  
  
## Example 2

The following example finds all customers where the Customer Name or Contact Name contains the string **John**.  
 
```al
var
    SearchString: Text;
begin
    Customer.FilterGroup := -1;  
    SearchString := '@*John*';  
    Customer.SetFilter(Customer.Name, SearchString);  
    Customer.SetFilter(Customer.Contact, SearchString);  
end;
```  

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)