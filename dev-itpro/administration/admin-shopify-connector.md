---
title: Test and training scenarios
description: In this walkthrough, we take you through various integration scenarios between Shopify and Business Central.
ms.date: 05/11/2022
ms.topic: article
ms.service: dynamics365-business-central
ms.reviewer: solsen
author: edupont04
ms.author: andreipa
---


# Test and Training Scenarios

This section demonstrates common scenarios and walks you through the steps to test or train the users on the workflow of the integrated [!INCLUDE[prod_short](../includes/prod_short.md)] and Shopify store.

## Preparation

Start by creating an Azure Active Directory tenant and get administration log-in and password. For more information, see [Preparing demonstrations of [!INCLUDE[prod_short](../includes/prod_short.md)]](/dynamics365/business-central/dev-itpro/administration/demo-environment.md), steps 1-6. You can stop once you get the administrator account that you got as part of your demo account, typically something like *admin@CRMbc123456.onmicrosoft.com*.

Navigate to [Shopify](https://www.shopify.com) and use this administrator account to sign up for a free 14-day trial. For more information on how to create and personalize your online store, see [Shopify Help](https://help.shopify.com/).

In the **Shopify Admin** of the created shop, apply following **Settings**:

* Deactivate **Automatically archive the order** in the **Order Processing** section of the [**Checkout**](https://www.shopify.com/admin/settings/checkout) settings in your **Shopify admin**.
* Consider selecting the *Accounts are optional* option in the **Customer accounts** section of the checkout settings.
* Consider selecting the *Company name - Optional* option in the **Customer information** section of the checkout settings.
* Enable the **Show tipping options at checkout** option in the **Tipping** section of the checkout settings, if you plan to demonstrate [Tipping scenario](TBD).
* Activate test payments. You have two options. Start by navigating to [**Payments**](https://www.shopify.com/admin/settings/payments) settings:  
1. *(for testing) Bogus Gateway*. For more information, see [Activate Bogus Gateway for testing](https://help.shopify.com/en/manual/checkout-settings/test-orders#place-a-test-order-by-simulating-a-transaction).
2. *Shopify payments* in test mode. For more information, see [Testing Shopify Payments](https://help.shopify.com/en/manual/payments/shopify-payments/testing-shopify-payments).

* For trial stores, select plan in the [**Plan**](https://www.shopify.com/admin/settings/plan) settings.

> [!Important]  
> To avoid payments, remember to cancel your Shopify trial.

Install the **Dynamics 365 Business Central** app in your Shopify online store.

1. Find [Dynamics 365 Business Central](https://apps.shopify.com/dynamics-365-business-central) app on the [Shopify AppStore](https://apps.shopify.com/).
2. Choose the **Add App** button. Sign in into your Shopify account if prompted.
3. Review privacy and permissions, and then choose the **Install App** button. You can find and open the installed **Dynamics 365 Business Central** app in the Apps section on the sidebar of **Shopify admin**.
4. Choose **Sign up now** to start the [!INCLUDE[prod_short](../includes/prod_short.md)] trial, and then use the administrator account.

In the created [!INCLUDE[prod_short](../includes/prod_short.md)] account, do following steps:

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Shop**, and choose the related link.
2. Choose the **New** action.
3. In the **Code** field, fill *DEMO1*.
4. In the **Shopify URL** field, fill in the URL to the online shop that you want to connect to.
5. Activate the **Enabled** toggle, review and accept the terms and conditions.
6. Choose the **Request Access** action.

Configure the Shopify shop as described below:

1. Enable the **Log Enabled** toggle.
2. Deactivate the **Allow Background Syncs** toggle.
3. Select **To Shopify** in the **Sync Item** field.
4. Select **To Shopify** in the **Sync Item Images** field.
5. Enable the **Sync Item Attributes** toggle.
6. Enable **Inventory Tracked** toggle.
7. Select **Deny** in the **Default Inventory Policy**.
8. Enable the **Auto Create Unknown Customers** toggle.
9. Fill in the **Customer Template Code** field with appropriate template.
10. Fill in the **Shipping Cost Account**, the **Tip Account** with revenue account. For example, in the US use *40100*.
11. Enable the **Auto Create Orders** toggle.

Configure location mapping:

1. Choose the **Locations** action to open **Shopify Shop Locations**.
2. Choose the **Get Shopify Locations** action to import all locations defined in the Shopify.
3. In the **Location Filter**, enter *''|EAST|MAIN*.
4. Deselect toggle from the **Disabled** field to enable inventory sync for selected Shopify location.

## Walkthrough: Start selling products online

### Scenario

Let's say, that you want to try Shopify as an online store without spending much time on setting up things, especially because you already maintain your items in [!INCLUDE[prod_short](../includes/prod_short.md)] properly. Once you launch your Shopify online store, you immediately get new customers, who are happy and satisfied with your shop and their buying experience. So, they decide to leave some tips at checkout.

### Steps

In **[!INCLUDE[prod_short](../includes/prod_short.md)]**

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Products**, and choose the related link.
2. Choose the **Add Items** action.
3. In the the **Shop Code** field, enter *DEMO1*.
4. Set filter *CHAIR* on the **Item Category Code** field (add filter field if necessary).
5. Click **ok** and wait until initial synchronization of items and prices is completed.
6. Choose the **Sync Product Images** action.
7. Choose the **Sync Inventory** action.

In **Shopify online store**, open the product catalog. Notice:

* Product titles, images, and prices.
* Availability indicator (sold out for out-of-stock products).

Choose any product that can be sold, for example *BERLIN Swivel Chair, yellow*. Notice that the description contains item attributes.

Choose the **Buy it now** button and proceed to checkout.

1. Fill *cl@contoso.com* (or email where you want to receive order and shipping confirmations) in **Email or mobile phone number**
2. Fill *Claudia Lawson* in the **First name** and **Last name**.
3. Fill in local address.
4. Enable **Save this information for next time** checkbox.
5. Choose **Continue to shipping** button.
6. Keep *Standard* shipping method and choose **Continue to payment** button.
7. Select 10% tip.
8. Fill *1* in the **Credit Card** field if you use *(for testing) Bogus Gateway*, fill *5555 5555 5555 4444* in the **Credit Card** field if you use *Shopify payments* in test mode.
9. Fill in the **Name on card** field.
10. Fill in the **Expiration date** field with current month/year.
11. Fill *111* in the **Security code**.
12. Choose **Pay now** button.

In **[!INCLUDE[prod_short](../includes/prod_short.md)]**

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Orders**, and choose the related link.
2. Choose the **Sync Orders From Shopify** action.
3. Click ok.

Imported order is ready for processing.

1. Select imported order to open **Shopify Order** window.
2. Notice that new customer and sales order is created.
3. Explore **Risk** and **Shipping Cost** actions.
4. Choose the **Sales Order** action to open **Sales Order** window. Sales order is a demand, that if necessary, can be covered with assembly, production, or by purchase with the help of planning engine. It also supports various warehouse handling processes with complete separation of duties.
5. Choose the **Reopen** action.
6. Fill *DHL* in the **Agent** field.
7. Fill *123456789* in the **Package Tracking No.**.
8. Choose the **Post** action, keep **Ship and Invoice** option, and click **Ok**.

Now physical and financial data is registered in [!INCLUDE[prod_short](../includes/prod_short.md)]. It’s time to notify Shopify about changes.

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Sync Shipments to Shopify**, and choose the related link.
2. Click **Ok**.

In **Shopify Admin**.

Notice that the order is now marked as *Fulfilled*. You can also review Shipment details and see Tracking URL there. If you run **Sync Orders From Shopify** again, order will be archived in both systems.

## Walk-through: Invite your customers to your new online store

### Scenario 

After a successful quick launch of your new online store, you want your current customers to visit it and start placing orders.

### Steps

In **[!INCLUDE[prod_short](../includes/prod_short.md)]**

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Shop**, and choose the related link.
2. Select the *DEMO1* Shop for which you want to synchronize customers to open the **Shopify Shop Card** page.
3. Choose the **Sync Customers** action.

In **Shopify Admin**.

Notice that customers were imported.
Open one of the customers. Notice that the first and last names of the customer are coming from the **Contact Name** field of the **Customer Card**. The company name can be found in the default address, linked to the customer.
Choose **Send account invite** to invite customer.

## Walk-through: Fine tuning of item management

### Scenario 

You'll like to add more flexibility and control to your processes around items management. You want to improve product description and like to add more review steps before products become available to end-customer.

### Steps

In **[!INCLUDE[prod_short](../includes/prod_short.md)]**

Prepare data.

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Customer Price Group**, and choose the related link.
2. Add new price group. Fill *SHOPIFY* in the **Code** field.
3. Close the **Customer Price Group** window.

4. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Items**, and choose the related link.
5. Select item *1896-S, Athens Desk*.
6. Choose **Variants** action, and add two variants *PREMIUM, Athens Desk, Premium edition* and *ESSENTIAL, Athens Desk, Essential edition*.
7. Choose **Extended Text**, create new extended text valid for all language codes. Fill *Shopify* in the **Description** field.
8. Add following description with HTML tags: `<b>Simple stylish design</b> blends with any ensemble. <i>Available in two editions.</i>`
9. Choose **Sales Prices**, and add new prices:

|Line|**Sales Type**|**Sales Code**|Type|Code|Variant Code<br>(add field via personalization)|Unit Price|
|------|------------|------------|------------|------------|------------|------------|
|1|Customer Price Group|SHOPIFY|Item|1896-S|ESSENTIAL|700|
|2|Customer Price Group|SHOPIFY|Item|1896-S|PREMIUM|1000|

10. Choose **Sales Discounts**, and add new discount:

* **Sales Type** *Customer Disc. Group*
* **Sales Code** *RETAIL*
* **Type** *Item*
* **Code** *1896-S*
* **Unit of Measure Code** *PCS*
* **Line Discount %** *10*

11. Choose **Item References** and add lines

|Line|**Reference Type**|**Reference No.**|Variant Code|
|------|------------|------------|------------|
|1|Barcode|77777777|ESSENTIAL|
|2|Barcode|11111111|PREMIUM|

12. Close **Item Card**.

13. Select item *1920-S, ANTWERP Conference Table*.
14. Choose **Adjust Inventory** and fill *100* in the **New Inventory** field for locations *EAST* and *WEST*. Choose Ok.
15. Close **Item Card**.

Adjust synchronization settings.

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Shop**, and choose the related link.
2. Select the *DEMO1* Shop for which you want to synchronize items to open Shopify Shop Card page.
3. Select *SHOPIFY* in the **Customer Price Group** field.
4. Select *RETAIL* in the **Customer Discount Group** field.
5. Enable the **Sync Item Extended Text** field.
6. Select *Item No.+ Variant Code* in the **SKU Mapping** field.
7. Select **Draft** in the **Status for Created Products** field.
8. Select **Status to Archived** in the **Action for Removed Product** field.

Execute sync.

1. Go to the search ![Lightbulb that opens the Tell Me feature.](../media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Shopify Shop**, and choose the related link.
2. Select the *DEMO1* Shop for which you want to synchronize items to open the **Shopify Shop Card** page.
3. Choose the **Products** action to open **Shopify Products** window.
4. Choose the **Add Items** action.
5. Set filter *TABLE* on the **Item Category Code** field.
6. Choose the **Sync Product Images** action.
7. Choose the **Sync Inventory** action.

Products are added. Notice status is set to *Draft*, hence items aren't visible in the Shopify online store.

1. Select line with item *1920-S, ANTWERP Conference Table*. Fill *Rectangular meeting table Antwerp, 10 seats, black* in the **SEO Title**.
2. Select *Active* in the **Status** field.
3. Select line with item *1906-S, ATHENS, Mobile Pedestal* and choose the **Delete** action.

In **Shopify Admin**.

Notice that all products have different statuses.

* *ANTWERP Conference Table* is *Active* because we changed status in **Shopify Product** window.
* *ATHENS Desk* is *Draft* because we configured default status for all added products to be *Draft*.
* *ATHENS Mobile Pedestal* is *Archived* because we configured shop to automatically assign status *Archived* for deleted products.

Notice that Inventory for ANTWERP Conference Table is 100, because we configured system to use inventory only from two locations MAIN and EAST. Inventory on other locations (WEST) is ignored.

Open *ANTWERP Conference Table*, notice **Custom Type**, **Vendor**, **Weight**, **Cost per item** fields, and **Search engine listing preview** section.
Open *Athens Desk*, scroll down to **Variants** section, notice how **SKU** is populated.
Choose **Edit** to review barcode and prices.
Change status of *Athens Desk* to *Active* and choose **Preview** action.

In **Shopify online store**.

Open product catalog, find *ATHENS Desk*  product. Notice that different options are available. For different options, prices are different. Pay attention to discount information.

## See Also