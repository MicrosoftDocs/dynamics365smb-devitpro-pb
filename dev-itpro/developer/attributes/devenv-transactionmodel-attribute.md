---
title: "TransactionModel Attribute"
description: "Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# TransactionModel Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether data is committed to the database during execution of a test method and whether transactions are rolled back at the end of a test method.


## Applies To

- Method

> [!NOTE]
> The TransactionModel attribute can only be set inside codeunits with the **SubType property** set to Test.

## Syntax

```
[TransactionModel(TransactionModel: TransactionModel)]
```

### Parameters
*TransactionModel*  
&emsp;Type: [TransactionModel](../methods-auto/transactionmodel/transactionmodel-option.md)  
The test transaction model used in the test method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  