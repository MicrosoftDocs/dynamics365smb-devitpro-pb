---
title: "Bulk Inserts"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6bbe737c-305f-48d2-8cd3-857c7efb9866
caps.latest.revision: 21
manager: edupont
---
# Bulk Inserts
By default, [!INCLUDE[navnow](includes/navnow_md.md)] automatically buffers inserts in order to send them to Microsoft SQL Server at one time.  

 By using bulk inserts, the number of server calls is reduced, thereby improving performance.  

 Bulk inserts also improve scalability by delaying the actual insert until the last possible moment in the transaction. This reduces the amount of time that tables are locked; especially tables that contain SIFT indexes.  

 Application developers who want to write high performance code that utilizes this feature should understand the following bulk insert constraints.  

## Bulk Insert Constraints  
 If you want to write code that uses the bulk insert functionality, you must be aware of the following constraints.  

 Records are sent to SQL Server when the following occurs:  

-   You call `COMMIT` to commit the transaction.  

-   You call `MODIFY` or `DELETE` on the table.  

-   You call any `FIND` or `CALC` methods on the table.  

 Records are not buffered if any of the following conditions are met:  

-   The application is using the return value from an `INSERT` call; for example, "`IF (GLEntry.INSERT) THEN`".  

-   The table that you are going to insert the records into contains any of the following:  

    -   BLOB fields  

    -   Fields with the **AutoIncrement** property set to **Yes**  

 The following code example cannot use buffered inserts because it contains a `FIND` call on the **GL/Entry** table within the loop.  

```  
IF (JnlLine.FIND('-')) THEN BEGIN  
  GLEntry.LOCKTABLE;  
  REPEAT  
    IF (GLEntry.FINDLAST) THEN  
      GLEntry.NEXT := GLEntry."Entry No." + 1  
    ELSE  
      GLEntry.NEXT := 1;  
    // The FIND call will flush the buffered records.  
    GLEntry."Entry No." := GLEntry.NEXT ;  
    GLEntry.INSERT;  
  UNTIL (JnlLine.FIND('>') = 0)  
END;  
COMMIT;  
```  

 If you rewrite the code, as shown in the following example, you can use buffered inserts.  

```  
IF (JnlLine.FIND('-')) THEN BEGIN  
  GLEntry.LOCKTABLE;  
  IF (GLEntry.FINDLAST) THEN  
    GLEntry.Next := GLEntry."Entry No." + 1  
  ELSE  
    GLEntry.Next := 1;  
  REPEAT  
    GLEntry."Entry No.":= GLEntry.Next;  
    GLEntry.Next := GLEntry."Entry No." + 1;  
    GLEntry.INSERT;  
  UNTIL (JnlLine.FIND('>') = 0)  
END;  
COMMIT;  
// The inserts are performed here.  
```  

## Disabling Bulk Inserts  
 Disabling bulk inserts can be helpful when you are troubleshooting failures that occur when inserting records. To disable bulk inserts, you set the *BufferedInsertEnabled* parameter in the CustomSettings.config file of the [!INCLUDE[nav_server](includes/nav_server_md.md)] to **FALSE**. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

## See Also  
 [Data Access](Data-Access.md)   
 [Table Keys and Performance](Table-Keys-and-Performance.md)   
 [C/AL Database Functions and Performance on SQL Server](C-AL-Database-Functions-and-Performance-on-SQL-Server.md)   
 [Query Objects and Performance](Query-Objects-and-Performance.md)
