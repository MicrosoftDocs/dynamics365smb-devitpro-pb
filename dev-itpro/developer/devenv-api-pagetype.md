---
title: "API Page Type"
description: "Description of the API page type used for exposing web service endpoints."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2019
ms.topic: article
ms.author: solsen
---

# API Page Type

Pages of the type `API` are used to generate web service endpoints and this type of page cannot be displayed in the user interface. When creating this page type, you must specify a number of properties that provide information for the web service endpoint. Use the snippet `tpage - Page of type API` to get the right template and the list of these properties automatically filled in. This page type cannot not be extended by creating a page extension object. Instead, you must create a new API by adding a page object.

## Naming conventions

For the API page type, the following naming convention exists:

- Use camelCase for attributes, tables, as well as APIPublisher, APIGroup, EntityName, and EntitySetName.
- ApiVersion is following vX.Y or beta.
- No special characters in any of the above.


## Example of the API page type
The following page example publishes an API available at:
`../contoso/app1/v2.0/companies({id})/Customers`. The `APIVersion` can be specified as one version, or a list of versions, if the API is supported through multiple versions.

```
page 50120 MyCustomerApi
{
    PageType = API;
    Caption = 'My Customer API';
    APIPublisher = 'contoso';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'Customer';
    EntitySetName = 'Customers';
    SourceTable = Customer;
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Id)
                {
                    Caption = 'ID';
                }
                field(Name; Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}
```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[API Query Type](devenv-api-querytype.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Developing Extensions](devenv-dev-overview.md)  
