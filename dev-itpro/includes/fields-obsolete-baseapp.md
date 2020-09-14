---
author: edupont04

ms.service: dynamics365-business-central
ms.topic: include
ms.date: 09/14/2020
ms.author: edupont
---
A number of fields that are related to pictures are no longer in use, because the pictures are now stored in Image fields that are of type *Media*. The fields are marked as ObsoleteState:Pending.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|18|Customer|89|Picture|Will be removed in a later release.|
|23|Vendor|89|Picture|Will be removed in a later release.|
|130|Incoming Document|20|URL2|Will be removed in a later release.|
|130|Incoming Document|21|URL3|Will be removed in a later release.|
|130|Incoming Document|22|URL4|Will be removed in a later release.|
|156|Resource|52|Picture|Will be removed in a later release.|
|167|Job|57|Picture|Will be removed in a later release.|
|270|Bank Account|89|Picture|Will be removed in a later release.|
|5050|Contact|89|Picture|Will be removed in a later release.|
|5200|Employee|19|Picture|Will be removed in a later release.|
|5600|Fixed Asset|22|Picture|Will be removed in a later release.|

For more information about Media Data Type, see [Media Data Type](../developer/methods-auto/media/media-data-type.md) reference documentation.

A field that is related to VAT Registration Number validation is no longer in use, because the feature was replaced EU VAT Registration No. Validation Service Setup [!INCLUDE[prodshort](prodshort.md)]. The field is marked as ObsoleteState:Pending.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|98|General Ledger Setup|161|VAT Reg. No. Validation URL|Will be removed in a later release.|

For more information about validation of VAT Registration Numbers, see [Setting Up Calculations and Posting Methods for Value-Added Tax ](/dynamics365/business-central/finance-setup-vat#to-verify-vat-registration-numbers) documentation.

A flow field that was used to calculate Balance in My Account page is no longer in use in [!INCLUDE[prodshort](prodshort.md)] and has been replaced with Account Balance field to improve performance. The field is marked as ObsoleteState:Pending. 

|Table ID|Field ID|Comments|
|--------|--------|--------|
|9153|My Account|4|Balance|Will be removed in a later release.|

A number of fields that are related to product groups are no longer in use, because the feature was replaced by item categories in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. The fields are marked as ObsoleteState:Pending.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|5723|All|Deprecated. Do not use.|
|27|5704|Will be removed in a later release.|
|32|5707|Will be removed in a later release.|
|37|5712|Will be removed in a later release.|
|83|5707|Will be removed in a later release.|
|111|5712|Will be removed in a later release.|
|113|5712|Will be removed in a later release.|
|115|5712|Will be removed in a later release.|
|123|5712|Will be removed in a later release.|
|125|5712|Will be removed in a later release.|
|246|5705|Will be removed in a later release.|
|753|5707|Will be removed in a later release.|
|5108|5712|Will be removed in a later release.|
|5110|5712|Will be removed in a later release.|
|5741|5712|Will be removed in a later release.|
|5745|5707|Will be removed in a later release.|
|5747|5707|Will be removed in a later release.|
|5902|5712|Will be removed in a later release.|
|5991|5712|Will be removed in a later release.|
|5993|5712|Will be removed in a later release.|
|6651|5712|Will be removed in a later release.|
|6661|5712|Will be removed in a later release.|

For more information about the impact, see [The new Item Categories feature replaced the Product Group feature in Dynamics NAV 2017](https://blogs.msdn.microsoft.com/nav/2017/03/30/the-new-item-categories-feature-replaced-the-product-group-feature-in-dynamics-nav-2017/) on the Dynamics NAV team blog. For more information about item categories, see [How to: Categorize Items](/dynamics365/business-central/inventory-how-categorize-items) in the [!INCLUDE[d365fin_long](../developer/includes/d365fin_long_md.md)] documentation.
