---
title: "Number Sequences"
description: "This topic describes how to create number sequences in AL code in Dynamics 365 Business Central." 
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Number Sequences in [!INCLUDE[prod_short](includes/prod_short.md)]

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]
 
In AL, you can create and manage number sequences that generate numeric identifiers for data and records. [!INCLUDE[prod_short](includes/prod_short.md)] number sequences are built on SQL Server number sequences, which means that they are not associated with any tables. Instead, the application code references the number sequence object and coordinates the values across records.

The numbers in a number sequence are generated in ascending order at a defined interval. Numbers are used sequentially, but numbers can be skipped. This means that numbers used on records in tables can have gaps. These gaps, for example, can occur when transactions are rolled back or numbers are allocated but not used.

## Number sequences and number series in the application

Unlike number sequences, number series are specially designed for scenarios where you have to use a continuous numbering system on transactional records. This typically includes documents such as purchase orders, sales orders, and invoices. The drawback of using continuous numbers is that when a number is requested by a transaction, the **No Series Line** table in the database is locked until the transaction completes. This can potentially block other users from being able to work.

However, number series also include an option called **Allow Gaps in Nos.**. This option actually uses number sequences in the underlying code, and allows you to implement non-continuous, non-blocking numbering. So, if there are no regulatory requirements for using continuous numbering, you can improve performance by allowing gaps and using a number sequence instead. Customer cards, sales quotes, and warehouse activities are examples of entities that typically do not require continuous numbering.

For more information about number series, see [Create Number Series](/dynamics365/business-central/ui-create-number-series?branch=fall-2019#gaps-in-number-series) in the [!INCLUDE[prod_short](includes/prod_short.md)] application help.  


## Creating and managing number sequences in AL

To create and manage number sequences, you use the `NumberSequence` data type and the following methods.

|Method name|Description|
|-----------|-----------|
|[Insert(String[, BigInteger][, BigInteger], [Boolean])](methods-auto/numbersequence/numbersequence-insert-method.md)|Creates a number sequence in the database, with the given parameters.|
|[Exists(String[, Boolean])](methods-auto/numbersequence/numbersequence-exists-method.md)|Checks whether a specific number sequence exists.|
|[Delete(String[, Boolean])](methods-auto/numbersequence/numbersequence-delete-method.md)|Deletes a specific number sequence.|
|[Next(String[, Boolean])](methods-auto/numbersequence/numbersequence-next-method.md)|Retrieves the next value from the number sequence.|
|[Current(String[, Boolean])](methods-auto/numbersequence/numbersequence-current-method.md)|Gets the current value from the number sequence, without doing any increment. The value is retrieved out of transaction. The value will not be returned on transaction rollback.|

### Examples

```AL
// Creates a NumberSequence object that starts with the value '0' and increments by '1'​
NumberSequence.Insert('DefaultSequence');

// Creates a NumberSequence object that starts with the value '10' and increments by '1'​
NumberSequence.Insert('StartsWithTenSequence', 10);

​// Creates a NumberSequence object that starts with the value '0' and increments by '10'​
NumberSequence.Insert('StartsWithZeroIncrementTenSequence', 0, 10); 

​// Creates a NumberSequence object that starts with the value '0', increments by '10', and is company-specific​
NumberSequence.Insert('MyCompanySequence', 0, 1, true); ​
​
// Verifies whether a specific NumberSequence object exists, and if so, deletes it

if NumberSequence.Exists('MySequence', true) then
    NumberSequence.Delete('MySequence',true);​
​
// Gets and returns the current value in a NumberSequence object
number := NumberSequence.Current('MySequence',true);​

// Gets and returns the next value in a NumberSequence object
number := NumberSequence.Next('MySequence',true); ​
```

## See Also  
[Number Sequence data type](methods-auto/numbersequence/numbersequence-data-type.md)  
[SQL Server Sequence Numbers](/sql/relational-databases/sequence-numbers/sequence-numbers?view=sql-server-2017)  
