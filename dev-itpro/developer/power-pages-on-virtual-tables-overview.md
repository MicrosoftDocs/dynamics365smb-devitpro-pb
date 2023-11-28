---
title: Power Pages on virtual tables 
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 11/22/2023
ms.custom: bap-template #Required; don't change.
---

# Power Pages on virtual tables (preview)

[!INCLUDE[general_preview](includes/general_preview.md)]

Data virtualization is part of the fabric of the tools to integrate Business Central online with Microsoft Dataverse. To learn more about Dataverse integration, consult [Business Central & Dataverse integration](https://github.com/microsoft/d365bcdv/blob/main/Review%20of%20Business%20Central%20and%20Dataverse%20integration.pdf). Data virtualization allows users with Business Central licenses and entitlements to access data stored in Business Central online by performing (**C**reate/**R**ead/**U**pdate/**D**elete) API operations on Business Central tables that are available as virtual tables in Dataverse.  

![Diagram of the interaction between Dataverse and Business Central.](media/virtual-table-inbound-interaction.png)

These licensed users are considered as internal users to the organizations or companies that purchase the licenses. They're in employee-like relationships with the companies and perform business processes on the companies' behalf. They can access data stored in Business Central online using Power Apps and Power Automate, which operate on virtual tables in Dataverse.

Business Central 2023 release wave 1, version 23.1, introduced Power Pages on virtual tables feature. This feature allows unlicensed external users to access data stored in Business Central online by using Power Pages that operates on virtual tables in Dataverse.  For more info on internal and  external users, consult the [Dynamics 365 licensing guide](https://go.microsoft.com/fwlink/?LinkId=866544&clcid=0x409) and refer to the **Licensing requirements for external users** and **Multiplexing** sections.

External users are typically users from the customer or vendor organizations of companies that purchase Business Central licenses.  In some commerce or collaboration scenarios, these users might need to participate in processes that involve data stored in Business Central online, such as customer onboarding, vendor bidding, and so on&mdash;even if they aren’t Business Central users. This new feature enables those companies to build business-to-business (B2B) portals using Power Pages that serve their customers and vendors, so external users can have anonymous and authenticated access to data stored in Business Central online.  

Anonymous access via Power Pages allows external users to perform API operations on Business Central tables without signing in. Authenticated access via Power Pages requires external users to sign in to perform API operations on Business Central tables or rows that are accessible to them. Business Central admins can select only the necessary API operations, tables, and rows to be enabled for anonymous and authenticated access by external users. Additionally, this feature also enables authenticated access via Power Pages for internal and existing Business Central users, similar to authenticated access via Power Apps and Power Automate. 

This article highlights the new feature of Power Pages on virtual tables, the prerequisites and step-by-step instructions to preview it, its current limitations, and future improvements.

## Prerequisites and step-by-step instructions

To preview the new feature of Power Pages on virtual tables, complete the following tasks:

1. Create or upgrade a Business Central environment with Dynamics 365 Business Central 2023 release Wave 2 (version 23.1 or later).
1. In Business Central, use the assisted setup gudie to connect your Business Central environment to a Dataverse environment in which you want to make your Business Central tables available as virtual tables. This guides you to install the **Business Central Virtual Table** app from AppSource.

   For more information, go to [Connect Business Central online to Dataverse](#connect) in this article.
1. In Business Central, admins can assign permission sets to the built-in app and service-to-service (S2S) users that will access data stored in Business Central online via Power Pages on behalf of anonymous and authenticated external users.  
   
   For more information, go to [Assign permission sets to anonymous and authenticated external users](#s2s) in this article.
1. In Power Apps maker portal, launch the *Business Central Configuration* app to select virtual Business Central tables, such as *Customer*/*Item*/*Sales Order*/*Sales Invoice*/*Sales Shipment*/*Vendor* tables, and make them visible.

   For more information, go to [Make virtual Business Central tables visible on Dataverse](#visible) in this article.
1. In Power Apps maker portal, open the native Dataverse *Contact* table and add lookup columns to the virtual Business Central *Customer*/*Vendor* tables.

   For more information, go to [Add lookup columns on Dataverse Contact table](#lookup) in this article.
1. In the **Business Central Configuration** app, create synthetic relations between the native Dataverse **Contact** table and virtual Business Central tables, such as **Sales Order**, **Sales Invoice**, and **Sales Shipment**.

   For more information, go to [Create synthetic relations for Dataverse Contact table](#synthetic) in this article.
1. In Power Pages maker portal, create pages for anonymous access of external users.

   For more information, go to [Enable anonymous access for external users via Power Pages](#anonymous) in this article.
1. In Power Pages maker portal, create pages for authenticated access of external users.

   For more information, go to [Enable authenticated access for external users via Power Pages](#authenticated) in this article.
1. (Optional) In Power Pages maker portal, create pages for authenticated access of internal users.

   For more information, go to [Enable authenticated access for internal users via Power Pages](#internal) in this article.
1. (Optional) In Power Pages maker portal, make virtual Business Central tables editable as Power Pages lists.
  
   For more information, go to [Enable edit mode on Power Pages lists](#editlist) in this article.
1. (Optional) In Power Pages maker portal, make virtual Business Central tables editable as Power Pages subgrids.

   For more information, go to [Enable edit mode on Power Pages subgrids](#editsubgrid) in this article.

## <a name="connect"></a>Connect Business Central online to Dataverse

To connect your Business Central environment to a Dataverse environment, in which you want to make your Business Central tables available as virtual tables, complete the following steps:

1. Sign in to [Business Central](https://businesscentral.dynamics.com/).
1. Select **Settings** icon > **Assisted setup** > **Set up a connection to Dataverse** to open the **Dataverse Connection Setup** assisted setup guide.  
1. Turn on the **Enable virtual tables and events** switch and then select **Next**.

   ![Screenshot of the Dataversie Connection Setup page in Business Central.](media/dataverse-connection-setup.png)

1. Review the terms and conditions, If you want to accept, turn on the **I accept** switch, and then select **Next**.
1. Specify your Dataverse environment URL, sign in as an administrator user, and then select  **Next**.
1. Install the *Business Central Virtual Table* app from AppSource, and then select the **Finish** button.

   ![Screenshot of the Business Central Virtual Table app from AppSource installation.](media/virtual-table-plugin.png)

## <a name="s2s"></a>Assign permission sets to anonymous and authenticated external users

Because external users have no Business Central license or entitlements, we've created built-in app/S2S users to access data stored in Business Central online on their behalf. Permission sets can be assigned to these app/S2S users to control data access by external users.  To do so, complete the following steps:

1. In [Business Central](https://businesscentral.dynamics.com/), search for and open the *Microsoft Entra Applications* page.

   There are three built-in app/S2S users:
   
   - *Dynamics 365 Business Central for Virtual Tables* for accessing data stored in Business Central online via Power Apps/Automate/Pages by personifying authenticated internal users.
   - *Power Pages Anonymous External Users* for accessing data stored in Business Central online via Power Pages on behalf of anonymous external users.
   - *Power Pages Authenticated External Users* for accessing data stored in Business Central online via Power Pages on behalf of authenticated external users.

   ![Screenshot of the Microsoft Entra Applications page in Business Central.](media/power-pages-microsoft-entra-applications.png)

1. Open the *Power Pages Anonymous External Users* card, select *Enabled* for the **State** property, and assign permission sets with the appropriate scope for anonymous external users, for example read-only for certain tables and LOGIN permission set as a minimum.

   ![Screenshot of the Power Pages Anonymous External Users card in Business Central.](media/power-pages-microsoft-entra-application-for-anonymous-access.png)

1. Open the *Power Pages Authenticated External Users* card, select *Enabled* for the **State** property, and assign permission sets with the appropriate scope for authenticated external users, for example read-write for certain tables and LOGIN permission set as a minimum.

   <!--![Screenshot](media/power-pages-microsoft-entra-application-for-authenticated-access.png)-->

## <a name="visible"></a>Make virtual Business Central tables visible on Dataverse

To make virtual Business Central tables visible on Dataverse, follow these steps:

1. In [Power Apps maker portal](https://make.powerapps.com/), select the **Apps** section, and launch the *Business Central Configuration* app.

   ![Screenshot of the Power Apps configuration page.](media/power-apps-business-central-configuration.png)

1. In the *Business Central Configuration* app, select the **Available Tables** section, virtual Business Central tables to be made visible, such as *Customer*/*Item*/*Sales Order*/*Sales Invoice*/*Sales Shipment*/*Vendor* tables, **Edit** button, **Visible** check box, and **Save** button.

   ![Screenshot of the Business Central table configuration page in Power Apps.](media/power-apps-business-central-configuration-available-tables.png)
 
## <a name="lookup"></a>Add lookup columns on Dataverse Contact table

Because Power Pages authentication is linked to Dataverse **Contact** table, external users who sign in as contacts from customer/vendor organizations should only access their customer- or vendor-specific data.  This can be done by first adding lookup columns on Dataverse **Contact* table to the virtual Business Central *Customer*/*Vendor* tables.  To do so, follow these steps:
1. On [Power Apps maker portal](https://make.powerapps.com/), select the **Tables** section, *Contact* table, **Columns** icon, and **+ New column** button.
1. Enter a descriptive display name for the lookup column, for example *BC Customer*/*BC Vendor*, select *Lookup* for the **Data type** property, *Customer*/*Vendor* for the **Related table** property, and the **Save** button.

   ![Screenshot of the New Column pane in Power Apps.](media/power-apps-contact-table-add-lookup-columns.png)

## <a name="synthetic"></a>Create synthetic relations for Dataverse Contact table

Since Power Pages authentication is linked to Dataverse *Contact* table, external users who sign in as contacts from customer/vendor organizations should only access their customer/vendor -specific data.  Only rows in virtual Business Central tables that are associated with the signed-in contacts should be shown.  This can be done by creating synthetic relations between the native Dataverse *Contact* table and virtual Business Central tables, such as *Sales Order*/*Sales Invoice*/*Sales Shipment* tables.  To do so, follow these steps:
1. On [Power Apps maker portal](https://make.powerapps.com/), first add lookup columns on Dataverse Contact table, see [Add lookup columns on Dataverse Contact table](#lookup) section above.
1. Select the **Tables** section, *Contact* table, **Keys** icon, and **+ New key** button.
1. Enter a descriptive display name for your key, for example *bccustomerkey*/*bcvendorkey*, select 
*BC Customer*/*BC Vendor* for the **Columns** property, and the **Save** button.  If multiple contacts are associated with one customer/vendor, you can select more columns, such as *Business Phone*/*Email*, to show only rows in virtual Business Central tables that are associated with the specific signed-in contacts.

   ![Screenshot of the Key pane in Power Apps.](media/power-apps-contact-table-add-keys.png)

1. Select the **Apps** section, and launch the *Business Central Configuration* app.

   ![Screenshot of the Power Apps configuration page.](media/power-apps-business-central-configuration.png)

1. On the *Business Central Configuration* app, select the **Table Relations** section, and **+ New** button.
1. On the **General** tab, enter the appropriate property values.  For example, to create a synthetic relation between the native Dataverse *Contact* table and virtual Business Central *Sales Order* table, enter a descriptive display name for the **Relation Name** property, for example *dyn365bc_contact2salesorder*, *contact* for the **Native Table** property, the schema name of your key for the **Native Table Key** property, for example *cr7b3_bccustomerkey*, and *dyn365bc_salesorder_v2_0* for the **Virtual Table** property.

   ![Screenshot of the Business Central Table Relations page in Power Apps.](media/power-apps-business-central-configuration-table-relations-general.png)

1. On the **Mappings** tab, enter the schema names of **Native columns** that map to those of **Virtual columns**.  For example, *cr7b3_bccustomerkey* that maps to *dyn365bc_customer_customerid*.

   ![Screenshot of the Business Central Table Relations Mappings page in Power Apps.](media/power-apps-business-central-configuration-table-relations-mappings.png)

1. Select the **Save & Close** button.

## <a name="anonymous"></a>Enable anonymous access for external users via Power Pages

To create pages for anonymous access of external users, follow these steps:

1. On [Power Pages maker portal](https://make.powerpages.microsoft.com/), create a new B2B portal by selecting a template from the **Templates** section, and select the **Done** button.
1. Select the **Edit** button for your portal.
1. Select the **+ Page** button, enter a descriptive display name for your page, for example *BC Items* for a page showing the virtual Business Central *Item* table, and select the **Add** button.
   
   ![Screenshot of adding a page in Power Apps.](media/power-pages-add-page.png)
   
1. Drag & drop *BC Items* under the **Pages** section.
1. Select the **List** item and **+ New list** button.

   ![Screenshot of adding a page section in Power Apps.](media/power-pages-add-list.png)
   
1. Search and select the virtual Business Central *Item* table.
1. Select the **All Items** view and **Done** button.

   ![Screenshot of adding a list in Power Apps.](media/power-pages-add-list2.png)
   
1. Select the **Permission** button, **All Items** permission, and **Global access** type.
1. Add the **Read** permission and **Anonymous Users** role.  This enables external users to visit your portal without signing in and *Business Central Virtual Table* plugin will use *Power Pages Anonymous External Users* app/S2S user to access data stored in Business Central online on their behalf.

   ![Screenshot of adding a permissions to items in Power Apps.](media/power-pages-add-anonymous-permission.png)
   
1. Select the **Save** and **Sync** buttons.
1. Select the **Preview** button to check that external users can see the *Item* table from Business Central without signing in.

   ![Screenshot of the Company Name list for anonymous permissions in Power Apps.](media/power-pages-anonymous-preview.png)

## <a name="authenticated"></a>Enable authenticated access for external users via Power Pages

To create pages for authenticated access of external users, follow these steps:
1. On [Power Pages maker portal](https://make.powerpages.microsoft.com/), create a new B2B portal by selecting a template from the **Templates** section, and select the **Done** button.
1. Select the **Edit** button for your portal.
1. Select the **+ Page** button, enter a descriptive display name for your page, for example *BC Sales Orders* for a page showing the virtual Business Central *Sales Order* table, and select the **Add** button.
1. Drag & drop *BC Sales Orders* under the **Pages** section.
1. Select the **List** item and **+ New list** button.
1. Search and select the virtual Business Central **Sales Order** table.
1. Select the **All Sales Orders** view and **Done** button.
1. Select the **Permission** button, **All Sales Orders** permission, **Contact access** type, and a synthetic relation between the native Dataverse *Contact* table and virtual Business Central *Sales Order* table, for example *dyn365bc_contact2salesorder*.
1. Add all except **Delete** permissions and **Authenticated Users** role.  This enables external users to sign in to your portal with their contact user identity and *Business Central Virtual Table* plugin will use *Power Pages Authenticated External Users* app/S2S user to access data stored in Business Central online on their behalf.

   ![Screenshot of adding permissions to the Sales Orders list in Power Automate.](media/power-pages-add-authenticated-permission.png)
   
1. Select the **Save** and **Sync** buttons.
1. Select the **Preview** button to check that external users can see the **Sales Order** table from Business Central after signing in.

   ![Screenshot of the Company Name list for authenticated permissions in Power Apps.](media/power-pages-authenticated-preview.png)

## <a name="internal"></a>Enable authenticated access for internal users via Power Pages

To create pages for authenticated access of internal users, follow the same steps as [Enable anonymous access for external users via Power Pages](#anonymous)/[Enable authenticated access for external users via Power Pages](#authenticated) sections above and add **Administrators** role.  This enables internal users to sign in to your portal with their Microsoft Entra user identity and *Business Central Virtual Table* plugin will personify them using *Dynamics 365 Business Central for Virtual Tables* app/S2S user to access data stored in Business Central online.

## <a name="editlist"></a>Enable edit mode on Power Pages lists

To enable edit mode on Power Pages lists, follow these steps:
1. On [Power Pages maker portal](https://make.powerpages.microsoft.com/), select the **Edit** button for your portal, **...** button below **Set up** section, and **Power Pages Management** option that opens Power Pages Management portal in another tab.
1. On Power Pages Management portal, select the **Basic Forms** section and **+ New** button.
1. Enter a descriptive display name for the **Name** property, for example *YourAlias Sales Order Basic Form*, and *id* for the **Record ID Parameter Name** property.
1. Select *Sales Order (dyn365bc_salesorder_v2_0)* for the **Table Name** property, *Information* for the **Form Name** property, *Edit* for the **Mode** property, *Query String* for the **Record Source Type** property, your portal name for the **Website** property, and **Save** button.

   ![Screenshot of the Power Pages basic form.](media/power-pages-basic-form.png)
   
1. Select the **List** section, **All Sales Orders** list, **Options** tab, **+ Edit** button in **Grid configuration** section, *Basic Form* for the **Target Type** property, *YourAlias Sales Order Basic Form* for the **Basic Form** property, and **Save** button.

   ![Screenshot of the Power Pages Management page in Power Apps.](media/power-pages-basic-form-list.png)
   
1. Since the default sales order form has been designed to include a subgrid of sales order lines, authenticated users also need to be assigned all except **Delete** permissions to access the virtual Business Central *Sales Order Line* table.

   ![Screenshot of adding authenticated permissions to the Sales Orders list in Power Automate.](media/power-pages-add-authenticated-permission2.png)

1. Select the **Save** and **Sync** buttons.
1. Select the **Preview** button to check that external users can edit the Sales Order lists from Business Central after signing in.

   ![Screenshot of editing the company n Power Automate.](media/power-pages-authenticated-preview-edit-list.png)

## <a name="editsubgrid"></a>Enable edit mode on Power Pages subgrids

To enable edit mode on Power Pages subgrids, follow these steps:
1. On [Power Pages maker portal](https://make.powerpages.microsoft.com/), select the **Edit** button for your portal, **...** button below **Set up** section, and **Power Pages Management** option that opens Power Pages Management portal in another tab.
1. On Power Pages Management portal, select the **Basic Forms** section and **+ New** button.
1. Enter a descriptive display name for the **Name** property, for example *YourAlias Sales Order Line Basic Form*, and *id* for the **Record ID Parameter Name** property.
1. Select *Sales Order Line (dyn365bc_salesorderline_v2_0)* for the **Table Name** property, *Information* for the **Form Name** property, *Edit* for the **Mode** property, *Query String* for the **Record Source Type** property, your portal name for the **Website** property, and **Save** button.
1. Select *YourAlias Sales Order Basic Form*, **Basic Form Metadata** tab, **+ New Basic Form Metadata** button, *Subgrid* for the **Type** property, *Subgrid_new_1* for the **Subgrid Name** property, **+ Edit** button in **Grid configuration** section, *Basic Form* for the **Target Type** property, and *YourAlias Sales Order Line Basic Form* for the **Basic Form** property.

   ![Screenshot of Power Pages Management basic form metadata page.](media/power-pages-basic-form-metadata.png)
   
1. Select the **Save** and **Sync** buttons.
1. Select the **Preview** button to check that external users can edit the Sales Order Line subgrids linked to Sales Order lists from Business Central after signing in.

   ![Screenshot of edit pane in Power Pages Management.](media/power-pages-authenticated-preview-edit-subgrid.png)

## Current limitations and future improvements

These are the current limitations for Power Pages on virtual tables that will be removed/improved in the near future:
1. Anonymous access for external users via Power Pages supports read-only for now.
1. Authenticated access for external users via Power Pages supports only lookups to customers/vendors of Business Central company configured in the virtual table global settings for now.