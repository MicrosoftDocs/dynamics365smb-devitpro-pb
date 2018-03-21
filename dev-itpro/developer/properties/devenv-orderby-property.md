---
title: "OrderBy Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5e093f0e-7e9c-4bb0-af90-ec8dc9ea5595
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# OrderBy Property
Sorts rows in the resulting dataset of a query in ascending or descending order by a column or columns.  
  
## Applies to  
 Query objects  
  
## Property Value  
 *Column*=**Ascending**&#124;**Descending**  
  
-   *Column* is the name of the query column as specified by its [Name Property](devenv-name-property.md).  
  
-   **Ascending** sorts the column from lowest value to the highest value (A to Z, 0 to 9).  
  
-   **Descending** sorts the column from highest value to the lowest value (Z to A, 9 to 0).  
  
> [!NOTE]  
>  Separate multiple columns with a comma.  
  
## Remarks  
 To access the **OrderBy** property, in Query Designer, select the first blank line, and then, on the **View** menu, choose **Properties**.  
  
 To modify the **OrderBy** property, you can choose the **AssistEdit** button next to the property. In the **Order By** window, you add a column and set its direction to ascending or descending. You can sort on multiple columns by adding additional columns to the **Order By** window. The query will sort the results by the first column in the **Order By** window, then the second column, and so on.  
  
 You can also type values directly in the **Value** column of the **OrderBy** property in the **Properties** window. To sort on multiple columns, separate each column with a comma.  
  
> [!NOTE]  
>  You cannot sort on the same column more than once.  
  
 The **OrderBy** property corresponds to the Order By clause in SQL select statements.  
  
## Example  
 This following table shows the results of a query that retrieves the quantity of items in every open sales order for each customer.  
  
|Customer|Quantity|  
|--------|--------|  
|The Cannon Group|50|  
|New Concepts|15|  
|New Concepts|30|  
|Selangerian Ltd.|20|  
|Selangerian Ltd.|60|  
  
 To sort the **Customer** column in ascending order and the **Quantity** column to descending order, you set the OrderBy property to `Name=Ascending,Quantity=Descending`. The following table shows the results of the query after sorting.  
  
|Customer|Quantity|  
|--------------|--------------|  
|New Concepts|30|  
|New Concepts|15|  
|Selangerian Ltd.|60|  
|Selangerian Ltd.|20|  
|The Cannon Group|50|  
  
 The following is the Order By clause in SQL that corresponds to the OrderBy property in this example.  
  
```  
OrderBy Name,Quantity  
```