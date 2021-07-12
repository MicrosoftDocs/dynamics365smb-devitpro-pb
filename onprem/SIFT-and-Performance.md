---
title: "SIFT and Performance"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e6de5abc-6a10-4c51-9e31-70dfd1b1aca1
caps.latest.revision: 15
manager: edupont
---
# SIFT and Performance
This topic looks at the factors you must take into consideration when you deal with SIFT and performance.  
  
## Performance Factors to Consider  
 The factors that you must take into consideration when you deal with any performance problems that arise include:  
  
-   Designing your SIFT indexes optimally.  
  
-   Supporting too many SIFT indexes will affect performance.  
  
-   Having unnecessary date fields in the SIFT indexes of the base table will affect performance because they create three times as many entries as an ordinary field.  
  
-   Supporting too many fields in the SIFT indexes will also affect performance.  
  
-   The fields in the SIFT index that are used most regularly in queries must be positioned to the left in the SIFT index. Usually, the field that contains the greatest number of unique values must be placed on the left, with the field that contains the second greatest number of unique values on the right and so on. Integer fields generally contain the greatest number of unique values and Option fields contain a relatively small number of values.  
  
 Consider the costs and the benefits of maintaining SIFT indexes.  
  
|Cost|Benefit|  
|----------|-------------|  
|Updates to the SIFT indexes|Fast calculation of sums|  
|Potential locking conflicts||  
  
 ![SIFT structures.](media/NAV_ADG_22_Diag_21.png "NAV\_ADG\_22\_Diag\_21")  
  
 You can prevent the SIFT indexes from being updated by setting the **MaintainSIFTIndex** property of the index in the base table to **No**. This means that you no longer benefit from SIFT's ability to calculate sums quickly. However, the SIFT functionality is still available. If the base table does not grow or only grows slowly, there is no need to set **MaintainSIFTIndex** to **Yes** for any indexes that contain SumIndexFields. If the base table does grow, you should set **MaintainSIFTIndex** to **Yes** for any indexes that contain SumIndexFields.  
  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], changes have been made to improve performance when accessing the database. One of these changes is that [!INCLUDE[navnow](includes/navnow_md.md)] automatically maintains a count for all SIFT indexes. For more information about how this affects the Count and Average methods on FlowFields, see [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md). For more information about other data access changes, see [Data Access](Data-Access.md).  
  
> [!IMPORTANT]  
>  It is important that you remember to perform tests every time you make any changes to the SIFT structures. You must ensure that the changes that you have made do not cause problems in any other areas of the application. You must also ensure that your changes do not have a negative effect on performance.  
  
## See Also  
 [FlowFields](FlowFields.md)