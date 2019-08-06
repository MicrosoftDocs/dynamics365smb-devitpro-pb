---
title: "XMLport Object"
description: "Description of the XMLport object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/06/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
--- 

# XMLport Object
XMLports are used to export and import data between an external source and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Sharing data between different computer systems is seamless when it is shared in XML format. Working with XML files can be tedious so the details of how the XML file is handled are encapsulated in XMLports.

To use an XMLport to import or export data, you first create an XMLport object. You can run the XMLport from a page or codeunit object. 

> [!NOTE]  
> In the [!INCLUDE[prodlong](includes/prodlong.md)] Web client, Request pages are not supported. Request pages are dialog boxes that enables the user to set a filter on the data, sort the data, or choose whether to export or import the data. If you try to run an XMLport with a Request page from the Web client, you receive an error that the XMLport page type is not supported.

## XMLport example
The following example shows a page extension of the **Permission Sets** page that adds an action to the specified page calling the XMLport **ExportPermissionSet**. The XMLport exports the permission set data to an XML file. 

```
pageextension 50111 PermissionSetExporter extends "Permission Sets"
{
    actions
    {
        addafter(Permissions)
        {
            action(ExportPermissionSet)
            {
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction();
                begin
                    Xmlport.Run(50112, false, false);
                end;
            }
        }
    }
}

xmlport 50112 ExportPermissionSet
{
    Format = xml;

    schema
    {
        textelement(PermissionSets)
        {
            tableElement(PSet; "Aggregate Permission Set")
            {
                SourceTableView = WHERE ("App Name" = FILTER (<> ''));
                XmlName = 'PermissionSet';
                fieldattribute(RoleID; pset."Role ID") { }
                fieldattribute(RoleName; pset.Name) { }
                tableelement(P; "Tenant Permission")
                {
                    XmlName = 'Permission';
                    LinkTable = pset;
                    LinkFields = "Role ID" = FIELD ("Role ID");

                    textelement(ObjectType)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Object Type";
                            ObjectType := format(int);
                        end;
                    }
                    textelement(ObjectID)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Object ID";
                            ObjectID := format(int);
                        end;
                    }
                    textelement(ReadPermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Read Permission";
                            ReadPermission := format(int);
                        end;
                    }
                    textelement(InsertPermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Insert Permission";
                            InsertPermission := format(int);
                        end;
                    }
                    textelement(ModifyPermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Modify Permission";
                            ModifyPermission := format(int);
                        end;
                    }
                    textelement(DeletePermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Delete Permission";
                            DeletePermission := format(int);
                        end;
                    }
                    textelement(ExecutePermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Execute Permission";
                            ExecutePermission := format(int);
                        end;
                    }
                    textelement(SecurityFilter)
                    {
                        trigger onbeforePassvariable();
                        begin
                            SecurityFilter := format(p."Security Filter");
                        end;
                    }
                }
            }
        }
    }
}
```

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Report Object](devenv-report-object.md)  
[XMLport Design Overview](devenv-xmlport-overview.md)