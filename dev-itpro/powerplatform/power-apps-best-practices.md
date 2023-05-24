---
title: Best practices for Power Apps with Business Central
description: Learn how to best develop Power Apps for Business Central
author: andersgMSFT
ms.author: andersg
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.date: 04/24/2023
ms.custom: bap-template
---
# Best practices for Power Apps with Business Central (preview)

[!INCLUDE[general_preview](../developer/includes/general_preview.md)]

This article provides some best practices for developing canvas apps for Business Central using Power Apps.

## Working with multiple environments

When you add a Business Central connection to Power Apps, the connection information, such as the environment name and company ID, gets hard-coded into the Power App source code. This condition means that if you transfer a Power App between tenants with different Business Central environments or companies, you must update all the data connections.

While Power Automate flows allow the use of environment variables to store the connection information, facilitating the move between environments, Power Apps currently lacks this functionality.

We've updated our Al-Go for GitHub template with the functionality to update the connection information in the Power Apps source code. So, if you've defined your Business Central environment name and company ID in the Al-go-settings file, your Power Apps (and flows) will be updated to point to the correct environment when you use the GitHub actions that are part of the Al-Go-PTE template. If your flow is using environment variables, no changes are made.

> [!NOTE]
> This functionality is only available as part of the AL-Go PTE template.

## Telemetry 

You can add telemetry to your Power App by configuring the instrumentation key and using the trace function. Telemetry data helps you better understand how your app is operating and debug issues.  

For more information, see [Trace function in Power Apps](/power-platform/power-fx/reference/function-trace).

## Error handling

There are multiple ways of catching errors in Power Apps. To learn more, see [Error, IfError, IsError, IsBlankOrError functions in Power Apps](/power-platform/power-fx/reference/function-iferror).

We recommend wrapping calls in an `ifError` function call. This way mimics the syntax of the well-known try/catch pattern. The following code snippet shows an example from the [Warehouse Helper app](power-apps-samples.md#warehouse-helper-app):

```javascript
IfError(Set(varScannedItem, LookUp('warehouseItemsWithImage', GTIN = varScannedCode ))
   , 
   UpdateContext({ctxErrorOnItemLookup: true});
   Trace("Error trying to lookup item: "& varScannedCode, NotificationType.Error, FirstError);
)
```

## Explicit column selection

Explicit column selection is a Power Apps feature that is turned on by default for new Power Apps. When this feature is enabled, only the data columns that are used in the app get loaded. This behavior can cause problems if the columns are used indirectly or in a way the app can't predict.  

You can use the ShowColumns function to make sure the columns you need in your app are loaded. For more information, see [AddColumns, DropColumns, RenameColumns, and ShowColumns functions in Power Apps](/power-platform/power-fx/reference/function-table-shaping).

## Set up multi-language support with Business Central

Power Apps offers a couple of different ways of adding multi-language support to your Power App, which you learn more about at [Build a multi-language app](/power-apps/maker/canvas-apps/multi-language-apps).

But when working with Power Apps and Business Central, the pattern we recommend is to add a Business Central API that returns the relevant strings. This approach lets you store the localization inside your AL extension and use your normal localization processes. You can choose to map all the language resources into a global object inside the Power App for easy consumption.  

You can check out the [Warehouse Helper app](https://github.com/microsoft/businesscentralsamples-warehousehelper) or the [Take order app](https://github.com/microsoft/businesscentralsamples-takeorder) for examples about how it can be done. For example, in the Warehouse Helper app, consider the following points:

- The [WareHouseLanguageResources.api.al](https://github.com/microsoft/businesscentralsamples-warehousehelper/blob/main/ALApp/AppCode/APIs/WareHouseLanguageResources.api.al) file is the API that exposes the localized labels for Warehouse Helper.
- The [Loading Screen.fx.yaml](https://github.com/microsoft/businesscentralsamples-warehousehelper/blob/main/WarehouseHelper/CanvasApps/src/new_bcwarehousehelper_290e3/Src/Loading%20Screen.fx.yaml) file is where we do the mapping inside Power Apps.

## Setup localized currency support with Business Central

To ensure the currency format in your canvas app matches the setup in Business Central, we recommend that you expose an API endpoint that provides the locale information to your Power Apps. 

We use this pattern throughout the Take Order sample app. Once you have the locale information, you can pass in a current format pattern along with your locale to ensure that the format is correct.  

For example, in the Take Order app, we use the following pattern:

```javascript
Text(ctxItemDetails.'Unit Price', "$#,##0.00", varBcLocale)
```

> [!NOTE]
> `$` currency is just a placeholder and will be replaced by the Power Apps platform with the correct symbol based on the locale. To learn more about the text formatting options, refer to [Text function in Power Apps](/en-us/power-platform/power-fx/reference/function-text).

## Working with Business Central images

Power Apps supports working with images from Business Central. But there are a few caveats to be aware of:  

### Updating/Uploading an image

Uploading images from Power Apps to Business Central isn't currently supported by using the standard connector. Instead, we recommend you build a simple Power Automate flow, send the image from the Power App to the flow, and use the flow's Business Central connector to upload the image.  

The following code snippet shows an example that gets an image from the mixed-reality control and uploads it to the flow:

```javascript
// Call flow to upload images
Set(varImageContent, Last(ViewInMR1.Photos).ImageURI);
If(Not(IsBlankOrError(varImageContent)),
    UploadImageToSalesOrder.Run(varCreatedSalesOrder.Id, {
                                    file:{
                                       name:GUID() & ".png",
                                       contentBytes:varImageContent
                                    }
                                 }
   );
);
```

:::image type="content" source="../developer/media/best-practices-1-ptw-app.png" alt-text="Shows a screen shot of a Power Automate flows that takes an image from Power apps and uploads it to Business Central":::

### Parsing the media type field

If the data you're using from Business Central has a field of the type `media field` that you want to expose to Power Apps, you need to load the data from the media field into a blob and return the blob. Otherwise, Power Apps will just receive an internal string referencing the blob in Business Central.

You can see an example in the **ItemsWithImages.api.al** file of the Take Order sample app.

### Automatic image element size

Image controls in Power Apps don't support dynamic sizes in a fit-to-content model. The recommended approach is to include image height and width settings in API information that's returned from Business Central. This way, they can be used to set the image element height and width.

We're using this approach in the Warehouse helper app.

You can get the image dimensions in AL using the following pattern: 

```javascript
TenantMedia.SetAutoCalcFields(Content);
if not TenantMedia.Get(MediaID) then
   exit;

TenantMedia.Content.CreateInStream(InStr);
CopyStream(OutStr, InStr);

PictureWidth := TenantMedia.Width;
PictureHeight := TenantMedia.Height;
```

## When should you consider Power Apps?

There are no rules for when you should consider using Power Apps. What we found useful is to highlight some Power Apps functionality that compliments Business Central well. If you find yourself implementing a scenario that could benefit from the following functionality, you should consider using Power Apps:

### Fully customizable UI

Power Apps canvas apps offer full control over the UI. If you're building a single purpose process or a scenario where the Business Central UI patterns don't fit well, Power Apps could be a good solution for you.  

### Device capabilities

Power Apps has many device capabilities that are wrapped in easy-to-use components. If you need access to a barcode scanner, camera measurements, or other device capabilities, we recommend that you check out Power Apps to see it already offers a component that wraps the functionality you need. For more information, see [Create a canvas app with the barcode reader control](/power-apps/maker/canvas-apps/how-to/create-app-barcode-scanner).  

### Mixed reality (MR) and intelligence (AI)

Power Apps offer native integration with MR and AI through the UI components and AI Builder integration. For more information, see:

- [Working with MR in Power Apps](/power-apps/maker/canvas-apps/mixed-reality-component-view-mr)
- [Working with AI Builder in Power Apps](/ai-builder/overview) 

### Working with external data

The core of Power platform is working with data. Through the connector ecosystem, you get access to more than 1000 connectors that let you connect to Microsoft data sources like SharePoint, OneDrive, Business Central, and more. You can also connect to non-Microsoft data sources like Dropbox, MailChimp, Adobe, DocuSign, and more.

You can see the full list of supported connectors at [Power Automate Connectors](https://powerautomate.microsoft.com/en-us/connectors/).

## Coding standard with building Power Apps 

Using a uniform set of rules when building Power Apps makes the project more manageable and reduces the change of coding mistakes. For some general best practice resources for building Power Apps, see the following links:

- [Power Apps canvas app coding standards and guidelines](https://pahandsonlab.blob.core.windows.net/documents/PowerApps%20canvas%20app%20coding%20standards%20and%20guidelines.pdf)
- [Power Apps Community Call](https://www.youtube.com/watch?v=cJzomM29vNI&t=39s)
- [Tips and best practices to improve performance of canvas apps](/power-apps/maker/canvas-apps/performance-tips)  

## See also

[Business Central and Power Apps](power-apps-overview.md)  
[Application lifecycle management for Power Apps in Business Central](power-apps-alm.md)  
[Sample Power Apps for Business Central](power-apps-samples.md)  