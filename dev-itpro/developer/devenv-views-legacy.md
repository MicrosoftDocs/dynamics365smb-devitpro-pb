---
title: "Migrating to modern list views"
description: "Explains how to move from legacy views to modern list views in Business Central."
author: jswymer
ms.custom: na
ms.date: 08/09/2022
ms.topic: conceptual
ms.author: jswymer
---

# Migrating from Legacy Views to Modern Views

> [!IMPORTANT]
> Legacy views have been [deprecated](../upgrade/deprecated-features-platform.md#views) and will be removed in [!INCLUDE[prod_short](includes/prod_short.md)] 2023 release wave 2 (version 23). You can experience this change already in 2022 release wave 2 (version 21) by enabling **Legacy list views are hidden** on the **Feature Management** page. Learn more at [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).  
 
Modern views were introduced with [!INCLUDE[prod_short](includes/prod_short.md)] April 2019 release wave and are the recommended design going forward. Legacy views are list views that were created by developers in previous versions of [!INCLUDE[prod_short](includes/prod_short.md)] by placing them on the Role Center page object. [!INCLUDE[prod_short](includes/prod_short.md)] displays legacy views side by side with modern views directly on the list page. But legacy views offer a degraded experience and fewer options compared to modern views.  
 
## How can developers migrate to modern views? 

If your solution or customizations use legacy views, it's recommended you migrate your code to modern views before any environments are upgraded to version 23. To plan your approach, consider that legacy views originate from two distinct sources: 

1. Role center actions 

   These actions are defined in the `area(sections)`, `area(embedding)`, and `area(processing)` sections of the code. The actions run a list page and specify filters or sorting by using the [RunPageView](/properties/devenv-runpageview-property.md). Developers must remove legacy views from role center page code, and reimplement them as modern views on the target list page instead.

   The following code illustrates the AL code pattern on role center pages to look for and replace:

   ```al
   actions
    {
        area(sections|embedding|processing)
        {
            action(<action_name>)
            {
                Caption = '<page_caption>';                
                RunObject = Page "<page_name>";
                RunPageView = <filters_and_sorting>;

    ```

   For example, here's a code snippet of a role center page action that adds a legacy view on the **Sales Order List** page:

   ```al
   actions
    {
        area(embedding)
        {
            action(SalesOrdersShptNotInv)
            {
                Caption = 'Shipped Not Invoiced';
                RunObject = Page "Sales Order List";
                RunPageView = WHERE("Shipped Not Invoiced" = CONST(true));
            }
   ```

2. Role Center cue tiles 

   When you add a cue to a Role Center and the cue's value is based on a filtered list, a view based on the filters is automatically included on the list page. This behavior is done for backwards compatibility purposes. For example, a cue on the **Sales Order Processor** role center that displays delayed orders will also display a legacy view named **Delayed** on the **Sales Orders** list page. Microsoft will remove backward compatibility with version 23. If these automatically created views are valuable, we recommend developers implement them as modern views on the target list page.

   The following code illustrates the AL code pattern that creates legacy views for role center cues. For more information about cues, see [Creating Cues on Role Centers](devenv-cues-action-tiles.md).

   ```al
    table <ID> "<cue_table_name>"
    {
        fields
        {
            field(5; <cue_data_field>; Integer)
            {
                // Filters that make up the view on the drill-down page
                CalcFormula = Count("<source_table>" WHERE(<filters>));
            }
   ```    

   ```al
     page <ID> "<role_cue_page_part>"
    {
        SourceTable = "<cue_table_name>";
    
       layout
        {
            area(content)
            {
                cuegroup("<cue_group_name>")
                {
                    field(<cue_data_field>; Rec.<cue_data_field>)
                    {
                        // List page that opens from cue
                        DrillDownPageID = "<list page>";
                    }
   ```

   <!-- 
   The following code is a snippet of the AL code that creates the cue and legacy view described above, and illustrates the AL code pattern for role center cues that creates legacy views. For more information about cues, see [Creating Cues on Role Centers](devenv-cues-action-tiles.md).


    ```al
    table 9053 "Sales Cue"
    {
        ...    
        fields
        {
            field(5; Delayed; Integer)
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                CalcFormula = Count("Sales Header" WHERE("Document Type" = const(Order),
                                                          Status = const(Released),
                                                          "Completely Shipped" = CONST(false),
                                                          "Shipment Date" = FIELD("Date Filter"),
                                                          "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                          "Late Order Shipping" = const(true)));
                Caption = 'Delayed';
                Editable = false;
                FieldClass = FlowField;
            }
         ...
    ```
    ```al
    page 9060 "SO Processor Activities"
    {
        Caption = 'Activities';
        PageType = CardPart;
        SourceTable = "Sales Cue";
        ...

        layout
        {
            area(content)
            {
                ...
                cuegroup("Sales Orders Released Not Shipped")
                {
                    ...
                    field(DelayedOrders; DelayedOrders)
                    {
                        Caption = 'Delayed';
                        DrillDownPageID = "Sales Order List";
    
                        trigger OnDrillDown()
                        begin
                            Rec.ShowOrders(Rec.FieldNo(Delayed));
                        end;
                    }
                ...
    ```-->

For more information, see [Views](devenv-views.md).

## Can end-users benefit from modern capabilities before developers migrate legacy views?

Users can overcome limitations of legacy views simply by using the **Save as...** option to save a copy of the legacy view as a modern, personal view. Similarly, administrators can customize a user role and save the legacy view as a new role-specific view. While this method is quick and practical, it duplicates views on the list page, and doesn't convert the legacy view. 

## Why switch to modern views? 

Benefits for developers: 

* Benefit from a more declarative model where the view is implemented directly on the list page that it filters. 
* Add the view only once, instead of having to add it to all Role Center pages that happen to navigate to the list page, while still being able to define role-specific views. 
* Opportunity to define a unique column layout per view. 
* Developers benefit from future enhancements to views. 

Benefits for end-users: 

* Users will be able to personalize their workspace by hiding, showing, and reordering these views in the **Filter** pane. Similarly, this task can be done once for all users of a particular role.  
* The user experience is simple and consistent when the list page doesn't contain a mix of legacy and modern views, and performance is improved slightly. 
* Users receive a consistent choice of views no matter how they navigate to the list page: from the Role Center navigation menu, by searching for the page, through a browser favorite or shared link, or on other form factors.
* Customers benefit from future enhancements to working with views.


## See Also

[List Views FAQ](/dynamics365/business-central/ui-views-faq)  
[Business Central April '19 release plans - List Views](/business-applications-release-notes/April19/dynamics365-business-central/list-views)  
[Business Central April '19 release plans - Save and personalize list views](/business-applications-release-notes/April19/dynamics365-business-central/list-views)  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
