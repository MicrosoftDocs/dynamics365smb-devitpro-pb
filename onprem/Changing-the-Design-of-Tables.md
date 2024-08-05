---
title: "Changing the Design of Tables"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 438060d0-650a-46e6-8eb9-135dd7624e83
caps.latest.revision: 6
---
# Changing the Design of Tables
When you design the tables in your database, you determine which fields they contain. But you will often need to modify the design of some of the tables after they have been in use for a while. Typically you will want to add or delete fields, or make changes to field names or data types.  
  
## Rules for Changing Tables  
 You can modify tables that do not contain data at any time. However, when the table contains data, a number of restrictions apply. The following table lists some general rules.  
  
|Modification|Rule|  
|------------------|----------|  
|Change a field name|You can always change the name of a field.|  
|Change a field number|You can always change the number of a field. This causes [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] to run through all the application objects in order to update all the references to this field. This can be a time consuming process.|  
|Change a field data type|You can change the data type for a field only if there is no data in this field for any of the records in the table. There is one exception to this rule—you can change the data type of a field from **Code** to **Text** even if the field contains data for some records.|  
|Add a field to a table|You can always add a field to a table.|  
|Delete a field|To delete a field, you must delete all data from the field in all records in the table. You must also remove all references to the field from other tables, pages, and reports.|  
|Change the length of a **String** field|You can always increase the length of a **String** field. Whether you can decrease the length of a **String** field depends on the contents of all the values in the column in the table. The minimum length of a **String** field is determined by the longest string in the column.|  
  
## See Also  
 [How to: Add Fields to a Table](How-to--Add-Fields-to-a-Table.md)   
 [How to: View or Modify Properties on a Table or Field](How-to--View-or-Modify-Properties-on-a-Table-or-Field.md)