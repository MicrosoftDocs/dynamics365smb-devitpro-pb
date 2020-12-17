---
title: "Developing a custom API"
description: "Developing a custom API in AL for Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Developing a Custom API

This walkthrough describes how to develop a custom API page by using an AL extension and accessing it to retrieve responses and make updates through the API.

## About this walkthrough

At a high-level, this process involves the following tasks:  

1. Develop an AL extension with a new API page.
2. Add necessary fields, properties, and subpages to the API page.
3. Access the API page and get the response.

## Prerequisites

This walkthrough requires the following:  

- [!INCLUDE[prod_short](../includes/prod_short.md)], including the following:  
  - The CRONUS International Ltd. demonstration data.
  - Visual Studio Code with the AL Language extension installed. For more information, see [Getting Started with AL](../developer/devenv-get-started.md) and [AL Language Extension Configuration](../developer/devenv-al-extension-configuration.md). The AL Language extension for Visual Studio is free, and you can download it from [Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).

## Creating source tables for the API

To expose data in an API page, the first thing needed is a source table. For the purpose of this walkthrough we will create a table object that describes the schema for a car brand.

1. Create a new table. For more information, see [Tables Overview](../developer/devenv-tables-overview.md). 
2. Name the table **Car Brand**, and specify **50100** as the table ID.  
3. Add any necessary fields for a car brand as shown below:

    ```AL
    table 50100 "Car Brand"
    {
        DataClassification = CustomerContent;
        Caption = 'Car Brand';

        fields
        {
            field(1; Name; Text[100])
            {
                Caption = 'Name';
            }
            field(2; Description; Text[100])
            {
                Caption = 'Description';
            }
            field(3; "Country"; Text[100])
            {
                Caption = 'Brand Id';
            }
        }

        keys
        {
            key(PK; Name)
            {
                Clustered = true;
            }
        }
    }
    ```
4. Now, create a new table for **Car Model**, and specify **50101** as the table ID.
5. Add any necessary fields for a car model as shown in the example below. Make sure to have a field for **Brand Id** and that **TableRelation** is set to **"Car Brand".SystemId**.
    ```AL
    table 50101 "Car Model"
    {
        DataClassification = CustomerContent;
        Caption = 'Car Model';
    
        fields
        {
            field(1; Name; Text[100])
            {
                Caption = 'Name';
            }
            field(2; Description; Text[100])
            {
                Caption = 'Description';
            }
            field(3; "Brand Id"; Guid)
            {
                TableRelation = "Car Brand".SystemId;
                Caption = 'Brand Id';
            }
            field(4; Power; Integer)
            {
                Caption = 'Power (cc)';
            }
            field(5; "Fuel Type"; Enum "Fuel Type")
            {
                Caption = 'Fuel Type';
            }
        }

        keys
        {
            key(PK; Name, "Brand Id")
            {
                Clustered = true;
            }
        }
    }

    enum 50100 "Fuel Type"
    {
        Extensible = true;
        value(0; Petrol)
        {
            Caption = 'Petrol';
        }
        value(1; Diesel)
        {
            Caption = 'Diesel';
        }
        value(2; Electric)
        {
            Caption = 'Electric';
        }
    }
    ```
> [!TIP]  
> As it can be seen in field number 5 **"Fuel Type"**, make sure to use Enums instead of Options. When they are used in API pages, Options are generated as type strings in the metadata:
> `<Property Name="fuelType" Type="Edm.String"/>`.
> <br>Whereas Enums have their own types and all available Enum members are generated in the metadata:
> `<Property Name="fuelType" Type="Microsoft.NAV.fuelType"/>`.  
>
>```AL
>< EnumType Name="fuelType" Type="Microsoft.NAV.fuelType">
>            <Member Name="Petrol" Value="0"/>
>            <Member Name="Diesel" Value="1"/>
>            <Member Name="Electric" Value="2"/>
>    </EnumType>
> ```

## Creating API pages

In the following, we will create two API pages for both **Car Brand** and **Car Model** tables. API pages are specific pages with the `PageType` property set to `API`. For more information, see [API Page Type](devenv-api-pagetype.md).

### To create API pages to display **Car Brand** and **Car Model**

1. Create a new API page.
2. Name the page **API Car Model**, and specify **50101** as the page ID.  
3. Specify the **Car Model**  table as the source table.
4. Specify `APIVersion`, `APIPublisher`, `APIGroup`, `EntityName`, and `EntitySetName` for your API page. These properties will affect your custom endpoint: `https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/<API publisher>/<API group>/<API version>/companies(<company id>)/carModel`. For more information, see [Business Central API endpoints](/dynamics-nav/api-reference/v2.0/endpoints-apis-for-dynamics) and [Calling the API](devenv-develop-connect-apps.md#calling-the-api).
5. Specify `EntityCaption` and `EntitySetCaption`. These two properties are generated in the entityDefinitions `https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/<API publisher>/<API group>/<API version>/entityDefinitions` which are localized and translatable. 
6. Make sure to set the `ODataKeyFields` property to `SystemId`. A SystemId field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. For more information, see [Table Object](devenv-table-object.md). 
    ```AL
    page 50101 "API Car Model"
    {
        PageType = API;

        APIVersion = 'v1.0';
        APIPublisher = 'bctech';
        APIGroup = 'demo';

        EntityCaption = 'CarModel';
        EntitySetCaption = 'CarModels';
        EntityName = 'carModel';
        EntitySetName = 'carModels';

        ODataKeyFields = SystemId;
        SourceTable = "Car Model";

        Extensible = false;
        DelayedInsert = true;

        layout
        {
            area(content)
            {
                repeater(Group)
                {
                    field(id; Rec.SystemId)
                    {
                        Caption = 'Id';
                        Editable = false;
                    }
                    field(name; Rec.Name)
                    {
                        Caption = 'Name';
                    }
                    field(description; Rec.Description)
                    {
                        Caption = 'Description';
                    }
                    field(brandId; Rec."Brand Id")
                    {
                        Caption = 'Brand Id';
                    }
                    field(power; Rec.Power)
                    {
                        Caption = 'Power';
                    }
                    field(fuelType; Rec."Fuel Type")
                    {
                        Caption = 'Fuel Type';
                    }
                }
            }
        }
    }
    ```

7. Now, repeat the steps 1-6 for **API Car Brand** page.
8. You can define a **API Car Model** part in **API Car Brand** page. Make sure to use the SystemId field when defining the SubPageLink. This will generate **ReferentialConstraints** property in the metadata as below:  

    ```
    <NavigationProperty Name="carModels" Type="Collection(Microsoft.NAV.carModel)" Partner="carBrand" ContainsTarget="true">
    <ReferentialConstraint Property="id" ReferencedProperty="brandId"/>
    </NavigationProperty>
    ```

    And the **API Car Brand** page:

    ```AL
    page 50100 "API Car Brand"
    {
        PageType = API;

        APIVersion = 'v1.0';
        APIPublisher = 'bctech';
        APIGroup = 'demo';

        EntityCaption = 'CarBrand';
        EntitySetCaption = 'CarBrands';
        EntityName = 'carBrand';
        EntitySetName = 'carBrands';

        ODataKeyFields = SystemId;
        SourceTable = "Car Brand";

        Extensible = false;
        DelayedInsert = true;

        layout
        {
            area(content)
            {
                repeater(Group)
                {
                    field(id; Rec.SystemId)
                    {
                        Caption = 'Id';
                        Editable = false;
                    }

                    field(name; Rec.Name)
                    {
                        Caption = 'Name';
                    }
                    field(description; Rec.Description)
                    {
                        Caption = 'Description';
                    }
                    field(country; Rec.Country)
                    {
                        Caption = 'Country';
                    }
                    part(carModels; "API Car Model")
                    {
                        Caption = 'Car Models';
                        EntityName = 'carModel';
                        EntitySetName = 'carModels';
                        SubPageLink = "Brand Id" = Field(SystemId);
                    }
                }
            }
        }
    }
    ``` 

> [!TIP]  
> Parts are defined as 1-N relationship by default. You can, however, define it to be as 1-0, 1-1 relationship. In order to achieve that add the **CaptionML = ENU = 'Multiplicity=ZeroOrOne';** property in your part as shown below:
>```AL
>part(carModels; "API Car Model")
>    {
>        CaptionML = ENU = 'Multiplicity=ZeroOrOne';
>        EntityName = 'carModel';
>        EntitySetName = 'carModels';
>        SubPageLink = "Brand Id" = Field(SystemId);
>    }
> ```
>This will change the **NavigationalProperty** in the metadata from a Collection to an object as shown below:
> 
>```
><NavigationProperty Name="carModel" Type="Microsoft.NAV.carModel" ContainsTarget="true">
>            <ReferentialConstraint Property="id" ReferencedProperty="brandId"/>
>        </NavigationProperty>
>```

## Using carBrand and carModel APIs

Both API pages support create, read, update, and delete operations. If you want to disallow create, update, and delete operations, you can use the **InsertAllowed**, **ModifyAllowed**, and **DeleteAllowed** properties respectively.

Now, we will create a car brand:

```
POST https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/companies(<company id>)/carBrands

{
    "name": "CARBRAND1",
    "description": "Car Brand 1",
    "country": "Italy"
}
```

We can make a `GET` request to retrieve the car brands:

```
GET https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/companies(<company id>)/carBrands
```

Which will result in following response:

```
{
   "@odata.context":"https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/$metadata#companies(<company id>)/carBrands",
   "value":[
      {
         "@odata.etag":"W/\"JzQ0O2c4UTNaRHErODdzODZnVlJxN2tNTkt3SHBwajNBaHNSdStNeEFONGUwVkE9MTswMDsn\"",
         "id":"24cafc3a-b1fe-ea11-9306-000d3a482952",
         "name":"CARBRAND1",
         "description":"Car Brand 1",
         "country":"Italy"
      }
   ]
}
```

We can now create a car model that belongs to the car brand that we just created. Since the navigational property is defined in the API page as a part, we can create a car model in one of the following different ways:

### Example 1
``` 
POST https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/companies(<company id>))/carBrands(24cafc3a-b1fe-ea11-9306-000d3a482952)/carModels
{
    "name": "MODEL1",
    "description": "Model 1",
    "power": 1700,
    "fuelType": "Petrol"
}
```
### Example 2

``` 
POST https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/companies(<company id>))//carModels
{
    "name": "MODEL1",
    "brandId": "24cafc3a-b1fe-ea11-9306-000d3a482952",
    "description": "Model 1",
    "power": 1700,
    "fuelType": "Petrol"
}
```

### Example 3

And the navigational property also allows us to do a deep insert; deep insert is the creation of an entity instance and related entity instances, in a single `POST` request. So you can combine car brand and car model creation in a single request as illustrated below:

``` 
POST https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/bctech/demo/v1.0/companies(<company id>))//carBrands
{
    "name": "CARBRAND2",
    "description": "Car Brand 2",
    "country": "Germany",
    "carModels": [{
	    			"name": "MODELA",
		    		"description": "Model A",
			    	"power": 0,
				    "fuelType": "Electric"
			    },
			    {
   					"name": "MODELB",
    				"description": "Model B",
	    			"power": 0,
		    		"fuelType": "Electric"
			    }]
}
```

## General tips for custom APIs

1. Use SystemId as the OData primary key.
2. Make sure that all the table fields in TableRelations/SubPageLinks are available in the API pages and make sure to define the relationship multiplicity (1-0/1-1 or 1-N).
    - Doing so enables the platform to generate ReferentialConstraints, that OData consumers can use to understand the relations between entities
    - The platform will also create bi-directional relationship if possible, allowing consumers to access to the parent by just adding “/parentEntity” in the URI
3. Use Enumerations.
3. Make sure to localize your custom API pages:
    - Use `EntityCaption` and `EntitySetCaption` properties
    - Use captions for Enums
    - All these localizations can be retrieved through `https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/<API publisher>/<API group>/<API version>/entityDefinitions`

## See Also

[Getting Started with AL](../developer/devenv-get-started.md)  
[API Page Type](devenv-api-pagetype.md)  
[APIPublisher Property](properties/devenv-apipublisher-page-property.md)  
[APIGroup Property](properties/devenv-apigroup-page-property.md)  
[APIVersion Property](properties/devenv-apiversion-page-property.md)  
[EntityName Property](properties/devenv-entityname-property.md)  
[EntitySetName Property](properties/devenv-entitysetname-property.md)  
[Developing Extensions](devenv-dev-overview.md)  
