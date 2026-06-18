---
title: Use OData to Return and Obtain a Service Metadata Document
description: Using OData to return and obtain a Service Metadata (EDMX) Document.
ms.custom: bap-template
ms.date: 12/23/2025
ms.reviewer: jswymer
ms.topic: how-to
---
# Use OData to return and obtain a service metadata document

The Entity Data Model \(**EDM**\) is a specification for defining the data that is used by applications that are built on the Entity Framework. **EDMX** is an XML-based file format that is the packaging format for the service metadata of a data service. When you interact with an OData service that is published from [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you can request EDM-based proxies, Then, use tools such as LINQ to create data access logic. LINQ is a programming model that developers can use to query data from various data sources, including OData. Learn more in [LINQ \(Language-Integrated Query\)](/previous-versions/bb397926(v=vs.140)).  
  
The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] implementation of EDM follows the [.NET 4.0 WCF Data Service Framework implementation](/dotnet/framework/wcf/).  
  
The following guidelines are implemented for EDM.  
  
- Primary key fields in tables are automatically defined as properties in the service metadata document even if they aren't exposed on a page as controls.  
- [!INCLUDE[prod_short](../developer/includes/prod_short.md)] field names are mapped to EDMX property names by applying the following transformations:
  
  - Spaces are replaced with underscores (`_`)
  - Dots (`.`) are removed (example: `No.` → `No`)
  - Parentheses are removed (example: `Balance (LCY)` → `Balance_LCY`)
  - Slashes (`/`) are replaced with underscores (example: `Country/Region` → `Country_Region`)
  - Apostrophes (`'`) are encoded as `_x0027_` (example: `Don't` → `Don_x0027_t`)
  - Percent signs (`%`) are replaced with `Percent` (example: `Profit %` → `Profit_Percent`)

## Obtain a service metadata \(EDMX\) document  
  
1. You can obtain service metadata documents for either page or query web services. This example uses a page web service. Register and publish a page web service by using the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)]. See [Publishing a Web Service](publish-web-service.md)..  
  
1. Start a supported web browser, such as Microsoft Edge. In the **Address** field, enter a URI in this format:  
  
    ```http  
    https://<Server>:<WebServicePort>/<ServerInstance>/ODataV4/$metadata  
    ```  
  
    If [!INCLUDE[server](../developer/includes/server.md)] is running on the local computer and is using the default [!INCLUDE[server](../developer/includes/server.md)] instance and OData port, then the address is:  
  
    ```http
    https://localhost:7048/<server instance>/ODataV4/$metadata  
    ```  
  
    The browser should now show the complete metadata for the page web service that you published. The beginning of this document looks like this:  

    ```xml
    <edmx:Edmx xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx" Version="4.0">
     <edmx:DataServices>
      <Schema xmlns="http://docs.oasis-open.org/odata/ns/edm" Namespace="NAV">
       <EntityType Name="Media">
        <Key>
          <PropertyRef Name="ID"/>
        </Key>
        <Property Name="ID" Type="Edm.Guid" Nullable="false">
          <Annotation Term="NAV.LabelId" String="ID"/>
          <Annotation Term="NAV.NavType">
            <EnumMember>NAV.NavType/Guid</EnumMember>
          </Annotation>
          <Annotation Term="NAV.AllowEditOnCreate" Bool="true"/>
        </Property>
        ...
    ```
  
## Related information

[OData Web Services](OData-Web-Services.md)  
