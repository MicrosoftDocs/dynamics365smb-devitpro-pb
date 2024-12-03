---
title: "Page 9626 New Page Patterns List Part Error When Converting to Dynamics NAV 2018"
description: "Explains how to resolve the compilation error that you get for Page 9621 Add Page Fields when converting a database from Dynamics NAV 2017 to 2018."
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
## Resolving Page 9626 New Page Patterns List Part Compilation Error 
This article explains how to resolve the compilation error that you get for page **9626 New Page Patterns List Part** when converting a [!INCLUDE[nav2017](includes/navcorfu_md.md)] database to [!INCLUDE[nav2018_md](includes/nav2018_md.md)].

Page **9626 New Page Patterns List Part** has been removed in [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. To resolve this error, you can update page **9626 New Page Patterns List Part** with the code that follows: 

1. Copy the code to a text editor, and save it as a .txt file type.
2. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to import and compile the file to the converted database.

> [!NOTE]  
>  If the page **9626 New Page Patterns List Part** object in your database includes custom code, then you might have to resolve conflicts with your custom code.

```
OBJECT Page 9626 New Page Patterns List Part
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    CaptionML=ENU=New Page Patterns List Part;
    InsertAllowed=No;
    DeleteAllowed=No;
    ModifyAllowed=No;
    DelayedInsert=No;
    PageType=ListPart;
  }
  CONTROLS
  {
    { 1   ;    ;Container ;
                Name=Containers;
                CaptionML=ENU=Container;
                ContainerType=ContentArea }

    { 2   ;1   ;Group     ;
                GroupType=Repeater }

    { 3   ;2   ;Field     ;
                ApplicationArea=#All;
                SourceExpr="Display Name" }

    { 4   ;2   ;Field     ;
                ApplicationArea=#All;
                SourceExpr=Description }

  }
  CODE
  {
    VAR
      "Display Name"@1000 : Text;
      Description@1001 : Text;

    BEGIN
    END.
  }
}
```

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2017 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2017-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
