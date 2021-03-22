---
title: Get Report Parameters using Virtual Tables
description: A virtual table allows you to generate report parameters, XML string without invoking the report request page. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: ddb133b9-e940-4db8-bf3a-e5f906600188
caps.latest.revision: 24
author: SusanneWindfeldPedersen
---

# Get Report Parameters using Virtual Tables

A few virtual tables are added which can be used to generate the report parameters and XML string without actually invoking the report request page in UI. For more information, see [ReportRequest Page](./methods-auto/report/report-runrequestpage-method.md).  

The following two virtual tables can display more information about request pages and reports:

- All Control Fields (ID 2000000202)
- Report Data Items (ID 2000000203)

## All Control Fields 
This table contains information about page controls on regular pages, as well as on request pages in reports and XMLports. The primary key is **Object Type**, **Object ID**, and **Control ID**, where **Object Type** can be a Report, an XMLport, or a Page.

## Report Data Items 
This table reflects information about individual data items in a report, for example, **Indentation Level**, **Related Table ID**, **Request Filter Fields**, and more.

### Example
The following example shows how to get Report XML parameters which reflects information about report and report request page. 

```AL
codeunit 50103 "Report Xml Parameters Builder"
{
    procedure "Get Report Page Structure As Xml"("Report ID": Integer): XmlDocument
    var
        "Report Metadata": Record "Report Metadata";
        "Xml Parameters": XmlElement;
        "Result": XmlDocument;
    begin
        "Report Metadata".SetRange(ID, "Report ID");
        "Report Metadata".Find('-');

        "Xml Parameters" := XmlElement.Create('ReportParameters');
        "Xml Parameters".SetAttribute('name', "Report Metadata".Caption);
        "Xml Parameters".SetAttribute('id', Format("Report ID"));

        "Xml Parameters".Add("Create Xml Options"("Report ID"));
        "Xml Parameters".Add("Create Xml Data Items"("Report ID"));

        Result := XmlDocument.Create();
        Result.Add("Xml Parameters");

        exit(Result);
    end;

    local procedure "Create Xml Options"("Report ID": Integer): XmlElement
    var
        "All Control Fields": Record "All Control Fields";
        "Xml Options": XmlElement;
        "Xml Field": XmlElement;
    begin
        "All Control Fields".SetRange("Object Type", "All Control Fields"."Object Type"::Report);
        "All Control Fields".SetRange("Object ID", "Report ID");
        "All Control Fields".Find('-');

        "Xml Options" := XmlElement.Create('Options');

        repeat
            "Xml Field" := XmlElement.Create('Field');
            "Xml Field".SetAttribute('name', "All Control Fields"."Source Expression");

            "Xml Options".Add("Xml Field");
        until "All Control Fields".Next() = 0;

        exit("Xml Options");
    end;

    local procedure "Create Xml Data Items"("Report ID": Integer): XmlElement
    var
        "Report Data Items": Record "Report Data Items";
        "Xml Data Items": XmlElement;
        "Xml Data Item": XmlElement;
    begin
        "Report Data Items".SetRange("Report ID", "Report ID");
        "Report Data Items".Find('-');

        "Xml Data Items" := XmlElement.Create('DataItems');

        repeat
            "Xml Data Item" := XmlElement.Create('DataItem');
            "Xml Data Item".SetAttribute('name', "Report Data Items".Name);
            "Xml Data Item".Add(XmlText.Create("Report Data Items"."Data Item Table View"));

            "Xml Data Items".Add("Xml Data Item");
        until "Report Data Items".Next() = 0;

        exit("Xml Data Items");
    end;
}
```

## See Also
[SAVEAS Method](./methods-auto/report/report-saveas-method.md)  
[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)
