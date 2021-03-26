---
title: "TableConnectionType System Option"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# TableConnectionType Option Type
> **Version**: _Available or changed with runtime version 1.0._

Use variables of this data type to specify the type of connection to an external database.

## Members
|  Member  |  Description  |
|----------------|---------------|
|CRM|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Dynamics 365 for Sales. The table is typically based on an entity in Dynamics 365 for Sales, such as the Accounts entity.|
|ExternalSQL|Specifies the table as a table or view in SQL Server that is not in the Dynamics 365 Business Central database.|
|Exchange|This is for internal use only.|
|MicrosoftGraph|This is for internal use only.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  