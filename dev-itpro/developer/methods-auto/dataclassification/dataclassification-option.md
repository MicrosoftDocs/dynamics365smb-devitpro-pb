---
title: "DataClassification System Option"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# DataClassification Option Type
> **Version**: _Available from runtime version 1.0._

Sets the classification of the data in the table or field.

## Members
|  Member  |  Description  |
|----------------|---------------|
|CustomerContent|Content directly provided/created by admins and users.|
|ToBeClassified|Content that has not yet been given a classification. This is the initial value when table or field is created.|
|EndUserIdentifiableInformation|(EUII) Data that identifies or could be used to identify the user of a Microsoft service. EUII does not contain Customer content.|
|AccountData|Customer billing information and payment instrument information, including administrator contact information, such as tenant administrator’s name, address, or phone number.|
|EndUserPseudonymousIdentifiers|(EUPI) An identifier created by Microsoft tied to the user of a Microsoft service. When EUPI is combined with other information, such as a mapping table, it identifies the end user. EUPI does not contain information uploaded or created by the customer (Customer content or EUII).|
|OrganizationIdentifiableInformation|(OII) Data that can be used to identify a tenant, generally config or usage data. This data is not linkable to a user and does not contain Customer content.|
|SystemMetadata|Data generated while running the service or program that is not linkable to a user or tenant.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  