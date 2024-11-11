---
title: Developing a custom API
description: Learn how to develop a custom API page by using an AL extension and accessing it to retrieve responses and make updates through the API.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.date: 03/14/2024
ms.topic: conceptual
ms.reviewer: solsen
---

# Developing a custom API

This walkthrough describes how to develop a custom API page by using an AL extension and accessing it to retrieve responses and make updates through the API.

## About this walkthrough

At a high-level, this process involves the following tasks:  

1. Develop an AL extension with a new API page.
2. Add necessary fields, properties, and subpages to the API page.
3. Access the API page and get the response.

> [!TIP]  
> The code in this sample has also been published to the BCTech repo. For more information, see [Introduction to Custom API](https://github.com/microsoft/BCTech/tree/master/samples/CustomAPI).

## Prerequisites

This walkthrough requires the following:  

- [!INCLUDE[prod_short](../includes/prod_short.md)], including the following:  
  - The CRONUS International Ltd. demonstration data.
  - Visual Studio Code with the AL Language extension installed. For more information, see [Get Started with AL](../developer/devenv-get-started.md) and [AL Language Extension Configuration](../developer/devenv-al-extension-configuration.md). The AL Language extension for Visual Studio is free, and you can download it from [Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).

## Creating source tables for the API

To expose data in an API page, the first thing needed is a source table. In this walkthrough, we create a table object that describes the schema for a car brand.

1. Create a new table. For more information, see [Tables Overview](../developer/devenv-tables-overview.md). 
2. Name the table **Car Brand**, and specify **50100** as the table ID.  
3. Add any necessary fields for a car brand as shown in the following code:

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
                Caption = 'Country';
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
> As you can see in field number 5 **"Fuel Type"**, make sure to use Enums instead of Options. When these are used in API pages, Options are generated as type strings in the metadata:
> `<Property Name="fuelType" Type="Edm.String"/>`.
> <br>Whereas Enums have their own types and all available Enum members are generated in the metadata:
> `<Property Name="fuelType" Type="Microsoft.NAV.fuelType"/>`.  
>
>```AL
><EnumType Name="fuelType" Type="Microsoft.NAV.fuelType">
>    <Member Name="Petrol" Value="0"/>
>    <Member Name="Diesel" Value="1"/>
>    <Member Name="Electric" Value="2"/>
></EnumType>
> ```

## Creating API pages

In the following, we'll create two API pages for both **Car Brand** and **Car Model** tables. API pages are specific pages with the `PageType` property set to `API`. For more information, see [API Page Type](devenv-api-pagetype.md).

### To create API pages to display **Car Brand** and **Car Model**

1. Create a new API page.
2. Name the page **API Car Model**, and specify **50101** as the page ID.  
3. Specify the **Car Model**  table as the source table.
4. Specify `APIVersion`, `APIPublisher`, `APIGroup`, `EntityName`, and `EntitySetName` for your API page. These properties will affect your custom endpoint: `https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/<API publisher>/<API group>/<API version>/companies(<company id>)/carModel`. For more information, see [Business Central API endpoints](../api-reference/v2.0/endpoints-apis-for-dynamics.md)<!-- and [Calling the API](devenv-develop-connect-apps.md#calling-an-api)-->.
1. Specify `EntityCaption` and `EntitySetCaption`. These two properties are generated in the entityDefinitions `https://api.businesscentral.dynamics.com/v1.0/<user domain name>/api/<API publisher>/<API group>/<API version>/entityDefinitions` that are localized and translatable. 
1. Make sure to set the `ODataKeyFields` property to `SystemId`. A SystemId field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. For more information, see [System Fields](../developer/devenv-table-system-fields.md).
    ```AL
    page 50101 "API Car Model"
    {
        PageType = API;

        APIVersion = 'v1.0';
        APIPublisher = 'bctech';
        APIGroup = 'demo';

        EntityCaption = 'Car Model';
        EntitySetCaption = 'Car Models';
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

   > [!TIP]
   > We recommend you always specify a single field of type GUID in the `ODataKeyFields` property, as in the example above. Otherwise, some external integrations such as Power Automate and Power Apps will not work with your new API.
   >
   > Only in the case that you're integrating with a system that has different requirements can you specify a list of fields of different types in the `ODataKeyFields` property. For example:
   > ```AL
   > ODataKeyFields = Name, "Brand Id";
   > ```

7. Now, repeat the steps 1-6 for **API Car Brand** page.
8. You can define an **API Car Model** part on the **API Car Brand** page. Make sure to use the SystemId field when defining the SubPageLink. This will generate the **ReferentialConstraints** property in the metadata as below:  

    ```xml
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

        EntityCaption = 'Car Brand';
        EntitySetCaption = 'Car Brands';
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
> Parts are defined as 1-N relationship by default. You can, however, define it to be as 1-0, 1-1 relationship. In order to achieve that add the **Multiplicity=ZeroOrOne;** property in your part as shown below:
>```AL
>part(carModels; "API Car Model")
>    {
>        Multiplicity = ZeroOrOne;
>        EntityName = 'carModel';
>        SubPageLink = "Brand Id" = Field(SystemId);
>    }
> ```
>This will change the **NavigationalProperty** in the metadata from a Collection to an object as shown below:
> 
>```xml
><NavigationProperty Name="carModel" Type="Microsoft.NAV.carModel" ContainsTarget="true">
>       <ReferentialConstraint Property="id" ReferencedProperty="brandId"/>
></NavigationProperty>
>```

## Using carBrand and carModel APIs

Both API pages support create, read, update, and delete operations. If you want to disallow create, update, and delete operations, you can use the **InsertAllowed**, **ModifyAllowed**, and **DeleteAllowed** properties respectively.

Now, we'll create a car brand:

```
POST https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>)/carBrands

{
    "name": "CARBRAND1",
    "description": "Car Brand 1",
    "country": "Italy"
}
```

We can make a `GET` request to retrieve the car brands:

```
GET https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>)/carBrands
```

Which results in the following response:

```
{
   "@odata.context":"https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/$metadata#companies(<company id>)/carBrands",
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
POST https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>))/carBrands(24cafc3a-b1fe-ea11-9306-000d3a482952)/carModels
{
    "name": "MODEL1",
    "description": "Model 1",
    "power": 1700,
    "fuelType": "Petrol"
}
```
### Example 2

``` 
POST https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>))/carModels
{
    "name": "MODEL1",
    "brandId": "24cafc3a-b1fe-ea11-9306-000d3a482952",
    "description": "Model 1",
    "power": 1700,
    "fuelType": "Petrol"
}
```

### Example 3

And the navigational property also allows us to do a deep insert; deep insert is the creation of an entity instance and related entity instances, in a single `POST` request. So, you can combine car brand and car model creation in a single request as illustrated below:

``` 
POST https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>))/carBrands
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
### Example 4

You can also use the navigational property to get car models of a car brand in a single request as illustrated below:

``` 
GET https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/companies(<company id>))/carBrands(<car brand id>)?$expand=carModels
```

Which results in following response:

```
{
   "@odata.context":"https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/bctech/demo/v1.0/$metadata#companies(<company id>)/carBrands/$entity",
   "value":[
      {
         "@odata.etag":"W/\"JzQ0O2c4UTNaRHErODdzODZnVlJxN2tNTkt3SHBwajNBaHNSdStNeEFONGUwVkE9MTswMDsn\"",
         "id":"24cafc3a-b1fe-ea11-9306-000d3a482952",
         "name":"CARBRAND2",
         "description":"Car Brand 2",
         "country":"Italy",
         "carModels": [{
                        "id":"22be13af-b718-425d-ba6e-f1796d509402",
	    			    "name": "MODELA",
		    		    "description": "Model A",
		    		    "brandId": "24cafc3a-b1fe-ea11-9306-000d3a482952",
			    	    "power": 0,
				        "fuelType": "Electric"
			        },
			        {
                        "id":"818e9481-3a41-4344-af09-c897becef44e",
   					    "name": "MODELB",
    				    "description": "Model B",
    				    "brandId": "24cafc3a-b1fe-ea11-9306-000d3a482952",
	    			    "power": 0,
		    		    "fuelType": "Electric"
			        }]
      }
   ]
}
```

> [!NOTE]  
> The sample code is published to the BCTech repo. For more information, see [Introduction to Custom API](https://github.com/microsoft/BCTech/tree/master/samples/CustomAPI).

## General tips for custom APIs

1. Use SystemId as the OData key (defined in the `ODataKeyFields` property).
2. Make sure that all the table fields in TableRelations/SubPageLinks are available in the API pages and make sure to define the relationship multiplicity (1-0/1-1 or 1-N).
    - Doing so enables the platform to generate ReferentialConstraints, that OData consumers can use to understand the relations between entities
    - The platform also creates a bi-directional relationship if possible, allowing consumers to access to the parent by just adding “/parentEntity” in the URI
3. Use Enumerations.
4. Make sure to localize your custom API pages:
    - Use `EntityCaption` and `EntitySetCaption` properties
    - Use captions for fields
    - Use captions for enums
    - All these localizations can be retrieved through `https://api.businesscentral.dynamics.com/v2.0/<environmentName>/api/<API publisher>/<API group>/<API version>/entityDefinitions`

## Replacing ODataEDMType property

The [ODataEDMType property](../developer/properties/devenv-odataedmtype-property.md) was used to create nested JSON objects in the API response. Fields using this property were also called complex types. In [API v2.0](../api-reference/v2.0/index.md), all complex types are replaced with first-level properties or navigation properties. An overview of the API v2.0 changes are documented [here](../api-reference/v2.0/transition-to-api-v2.0.md).

The [ODataEDMType property](../developer/properties/devenv-odataedmtype-property.md) is deprecated and custom API implementations should transition from complex types to first-level properties or navigation properties. This transition will improve API performance significantly since complex fields were calculated in the runtime and added additional compute time.

### ODataEDMType to first-level property

The following example shows an API page with a complex type field using ```ODataEDMType``` ```POSTALADDRESS```.

```al
page 50100 "Customers API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'bctech';
    APIGroup = 'demo';

    EntityCaption = 'Customer';
    EntitySetCaption = 'Customers';
    EntityName = 'customer';
    EntitySetName = 'customers';

    ODataKeyFields = SystemId;
    SourceTable = Customer;

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
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(address; PostalAddressJson)
                {
                    Caption = 'Address';
                    ODataEDMType = 'POSTALADDRESS';

                    trigger OnValidate()
                    begin
                        PostalAddressSet := true;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Customer: Record Customer;
        RecordRef: RecordRef;
    begin
        Rec.Insert(true);
        ProcessPostalAddress();
        Rec.Modify(true);
        SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ProcessPostalAddress();
        Rec.Modify(true);
        SetCalculatedFields();
    end;

    var
        PostalAddressJson: Text;
        PostalAddressSet: Boolean;

    local procedure SetCalculatedFields()
    var
        JObject: JsonObject;
    begin
        JObject.Add('street', Rec.Address + Rec."Address 2");
        JObject.Add('city', Rec.City);
        JObject.Add('state', Rec.County);
        JObject.Add('countryLetterCode', Rec."Country/Region Code");
        JObject.Add('postalCode', Rec."Post Code");
        JObject.WriteTo(PostalAddressJson);
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(PostalAddressJson);
        Clear(PostalAddressSet);
    end;

    local procedure ProcessPostalAddress()
    var
        JObject: JsonObject;
        JToken: JsonToken;
        Address1: Text[100];
        Address2: Text[50];
    begin
        if not PostalAddressSet then
            exit;

        JObject.ReadFrom(PostalAddressJson);

        if JObject.Get('street', JToken) then begin
            SplitStreet(JToken.AsValue().AsText(), Address1, Address2);
            Rec.Validate(Address, Address1);
            Rec.Validate("Address 2", Address2);
        end;

        if JObject.Get('city', JToken) then
            Rec.Validate(City, JToken.AsValue().AsText());

        if JObject.Get('state', JToken) then
            Rec.Validate(County, JToken.AsValue().AsText());
            
        if JObject.Get('countryLetterCode', JToken) then
            Rec.Validate("Country/Region Code", JToken.AsValue().AsText());

        if JObject.Get('postalCode', JToken) then
            Rec.Validate("Post Code", JToken.AsValue().AsText());
    end;
}
```

Removing the complex type field and instead introducing a first-level property results in the following API page. Instead of a complex field that requires a custom logic with slow compute time, several first-level fields are introduced.

```al
page 50100 "Customers API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'bctech';
    APIGroup = 'demo';

    EntityCaption = 'Customer';
    EntitySetCaption = 'Customers';
    EntityName = 'customer';
    EntitySetName = 'customers';

    ODataKeyFields = SystemId;
    SourceTable = Customer;

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
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(addressLine1; Rec.Address)
                {
                    Caption = 'Address Line 1';
                }
                field(addressLine2; Rec."Address 2")
                {
                    Caption = 'Address Line 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(state; Rec.County)
                {
                    Caption = 'State';
                }
                field(country; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(postalCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
            }
        }
    }

    actions
    {
    }
}
```

### ODataEDMType to navigational property

The following example shows an API page with a complex type field using ```ODataEDMType``` ```Collection(DIMENSION)```.

```al
page 5010 "Journal Lines API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'bctech';
    APIGroup = 'demo';

    EntityCaption = 'Journal Line';
    EntitySetCaption = 'Journal Lines';
    EntityName = 'journalLine';
    EntitySetName = 'journalLines';

    ODataKeyFields = SystemId;
    SourceTable = "Gen. Journal Line";

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
                field(lineNumber; Rec."Line No.")
                {
                    Caption = 'Line Number';
                }
                field(dimensions; DimensionsJson)
                {
                    Caption = 'Dimensions';
                    ODataEDMType = 'Collection(DIMENSION)';

                    trigger OnValidate()
                    begin
                        DimensionsSet := true;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Insert(true);
        ProcessDimensions();
        Rec.Modify(true);
        SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        ProcessDimensions();
        Rec.Modify(true);
        SetCalculatedFields();
    end;

    var
        DimensionsJson: Text;
        DimensionsSet: Boolean;

    local procedure SetCalculatedFields()
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        JArray: JsonArray;
        JObject: JsonObject;
    begin
        DimensionSetEntry.SetRange("Dimension Set ID", DimensionSetId);
        if not DimensionSetEntry.FindSet() then
            exit;

        repeat
            Clear(JObject);
            DimensionSetEntry.CalcFields("Dimension Name", "Dimension Value Name");
            JObject.Add('code', DimensionSetEntry."Dimension Code");
            JObject.Add('displayName', DimensionSetEntry."Dimension Name");
            JObject.Add('valueCode', DimensionSetEntry."Dimension Value Code");
            JObject.Add('valueDisplayName', DimensionSetEntry."Dimension Value Name");
            JArray.Add(JObject);
        until DimensionSetEntry.Next() = 0;

        JArray.WriteTo(DimensionsJson);
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(DimensionsJson);
        Clear(DimensionsSet);
    end;

    local procedure ProcessDimensions()
    var
        Dimension: Record Dimension;
        TempDimensionSetEntry: Record "Dimension Set Entry" temporary;
        DimensionManagement: Codeunit "Dimension Management";
        JArray: JsonArray;
        JToken1: JsonToken;
        JToken2: JsonToken;
        DimensionCode: Code[20];
        DimensionValueCode: Code[20];
        NewDimensionSetId: Integer;
    begin
        if not DimensionsSet then
            exit;

        JArray.ReadFrom(DimensionsJson);

        foreach JToken1 in JArray do begin
            if JToken1.AsObject().Get('code', JToken2) then
                DimensionCode := JToken1.AsValue().AsText();

            if JToken1.AsObject().Get('valueCode', JToken2) then
                DimensionValueCode := JToken1.AsValue().AsText();

            if not Dimension.Get(DimensionCode) then
                Error('Dimension does not exist.');

            TempDimensionSetEntry.Init();
            TempDimensionSetEntry."Dimension Set ID" := Rec."Dimension Set ID";
            TempDimensionSetEntry."Dimension Code" := DimensionCode;
            TempDimensionSetEntry."Dimension Value Code" := DimensionValueCode;
            TempDimensionSetEntry.Insert(true);
        end;

        NewDimensionSetId := DimensionManagement.GetDimensionSetID(TempDimensionSetEntry);

        if Rec."Dimension Set ID" <> NewDimensionSetId then begin
            Rec."Dimension Set ID" := NewDimensionSetId;
            DimensionManagement.UpdateGlobalDimFromDimSetID(NewDimensionSetId, Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code");
        end;
    end;
}
```

Removing the complex type field and instead introducing a navigational property results in the following API page. Instead of a complex field that requires a custom logic with slow compute time, an API page part to corresponding entity is introduced.

```al
page 5010 "Journal Lines API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'bctech';
    APIGroup = 'demo';

    EntityCaption = 'Journal Line';
    EntitySetCaption = 'Journal Lines';
    EntityName = 'journalLine';
    EntitySetName = 'journalLines';

    ODataKeyFields = SystemId;
    SourceTable = "Gen. Journal Line";

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
                field(lineNumber; Rec."Line No.")
                {
                    Caption = 'Line Number';
                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Id" = field(SystemId), "Parent Type" = const("Journal Line");
                }
            }
        }
    }

    actions
    {
    }
}
```

## Using an API query type

If you need to generate a web service endpoint that joins data between different tables, then consider using an API query object. This type of API can't be used to display data in the user interface and data can only be read (not updated).

Learn more in [API query type](devenv-api-querytype.md).

## Related information

[Get started with AL](../developer/devenv-get-started.md)  
[API page type](devenv-api-pagetype.md)   
[API query type](devenv-api-querytype.md)   
[APIPublisher property](properties/devenv-apipublisher-page-property.md)  
[APIGroup property](properties/devenv-apigroup-page-property.md)  
[APIVersion property](properties/devenv-apiversion-page-property.md)  
[EntityName property](properties/devenv-entityname-property.md)  
[EntitySetName property](properties/devenv-entitysetname-property.md)  
[Developing extensions](devenv-dev-overview.md)  
