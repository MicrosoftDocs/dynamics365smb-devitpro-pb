---
title: Extending Application Areas
description: Learn about extending application areas in Business Central.
author: SusanneWindfeldPedersen
ms.topic: concept-article
ms.author: solsen
ms.date: 01/10/2025
ms.reviewer: solsen
---

# Extending application areas

Application areas represent a feature in the system that offers developers, administrators, and users the ability to define differentiated user experiences.

Application areas are mapped to controls to show or hide them on page objects to enable more or fewer business scenarios.

## Extending application areas and the experience tier

In this example you will:

- Add a new application area in the **Application Area Setup** table.
- Enable the application area in the **OnInstallAppPerCompany** trigger.
- Extend the experience tier in the **OnGetExperienceAppArea** event.
- Modify the experience tier (optional).
- Validate the application area in the **OnValidateApplicationAreas**.

> [!IMPORTANT]
> The code used in this example is still under active development and might be subject to change in the future. 

The following example extends the **Customer List** page. The field **ExampleField** is added and it's followed by a series of properties. The **ApplicationArea** property sets the application areas that apply to the control and in this code, **ExampleAppArea** is assigned to it.

> [!IMPORTANT]
> If your extension fails to use **ApplicationArea** in any controls or actions, they won't be visible when you use an experience tier.

The **OnOpenPage** trigger displays the message only if **ApplicationArea** is enabled.  

```AL
pageextension 50100 CustomerListExt extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(ExampleField; "Name 2")
            {
                Caption = 'Example Field';
                ApplicationArea = ExampleAppArea;
                ToolTip = 'This is a field added by an example extension';
                Importance = Promoted;
            }
        }
    }

    trigger OnOpenPage()
    var
        EnableExampleExtension : Codeunit "Enable Example Extension";
    begin
        if EnableExampleExtension.IsExampleApplicationAreaEnabled() then
            Message('App published: Example Extension');
    end;
}
```

## Adding an application area

To add an application area, the **Application Area Setup** table must be extended. A new boolean field is added and the name of this field is used in the attribute that you want to be tagged with this application area. This particular case, in the code example, is an exception, because space is used inside it. Usually, spaces are omitted in the application area attribute. At this point, the extension has an application area but it still needs to be enabled.

> [!IMPORTANT]
> An application area tag must have the format *name*, where *name* is the application area. The name can be any combination of letters (Aa-Zz) and numbers (0-9) without spaces.

```AL
tableextension 50100 "Application Area Setup" extends "Application Area Setup"
{
    fields
    {
        // Spaces in field name are omitted in the ApplicationArea attribute
        // e.g. ApplicationArea = ExampleAppArea;
        field(50100;"Example App Area";Boolean)
        {
        }
    }
}
```

The codeunit **Install Example Extension** is of the subtype Install and it enables the application area inside the **OnInstallAppPerCompany** trigger. 

```AL
codeunit 50101 "Install Example Extension"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        EnableApplicationArea : Codeunit "Enable Example Extension";
    begin
        if(EnableApplicationArea.IsExampleApplicationAreaEnabled()) then
            exit;

        EnableApplicationArea.EnableExampleExtension();

        // Add your code here
    end;
}
```

The registration of the application area inside an experience tier is made inside the **OnGetEssentialExperienceAppArea**. There are different versions of this event, one for each experience tier and in this case, Essential is chosen. This makes the extension visible inside the Essential experience and the event exposes an **Application Area Setup** temporary record; **TempApplicationAreaSetup**, to the **Application Area Setup** table. At this point, to enable the application area, this must be set to true.

> [!NOTE]  
> This event is important because it's called every single time an experience tier is reset, which can happen because of many reasons. 

Another thing that is possible inside these methods is to modify the experience tier. You can also modify other application areas, such as creating an extension that extends the Fixed Assets functionality. 
By subscribing to **OnValidateApplicationAreas**, the application area inside an experience tier is validated. **OnValidateApplicationAreas** is guaranteed to be executed after the events in the **OnGet...ExperienceAppArea** family. The validation is necessary in the presence of extensions concurrently manipulating the same application areas.

In case a needed application area isn't enabled, the suggested action is to show an error and turn off the extension to avoid unintended behavior. However, if the functionality controlled by this application area is of secondary importance and its loss doesn't affect the rest of the extension, it's also appropriate to keep the extension enabled.

```AL
codeunit 50100 "Enable Example Extension"
{
    // Extend and modify Essential experience tier with "Example App Area"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", 'OnGetEssentialExperienceAppAreas', '', false, false)]
    local procedure RegisterExampleExtensionOnGetEssentialExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup."Example App Area" := true;
        // Modify other application areas here
    end;

    // Validate that application areas needed for the extension are enabled
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", 'OnValidateApplicationAreas', '', false, false)]
    local procedure VerifyApplicationAreasOnValidateApplicationAreas(ExperienceTierSetup: Record "Experience Tier Setup"; TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        if ExperienceTierSetup.Essential then
            if not TempApplicationAreaSetup."Example App Area" then
                Error('Example App Area should be part of Essential in order for the Example Extension to work.');
    end;

    // Helpers ................................................................
    procedure IsExampleApplicationAreaEnabled() : Boolean
    var
        ApplicationAreaSetup: Record "Application Area Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(ApplicationAreaSetup, CompanyName()) then
            exit(ApplicationAreaSetup."Example App Area");
    end;

    procedure EnableExampleExtension()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        ApplicationAreaMgmtFacade.RefreshExperienceTierCurrentCompany();
    end;
}
```

## Adding Advanced application area to the Essentials and Premium experiences using an extension

If you're familiar with [!INCLUDE[navnow_md](includes/navnow_md.md)] you'll have noticed that [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] isn't exposing all the controls/actions that you find in [!INCLUDE[navnow_md](includes/navnow_md.md)]. These controls have been hidden so far by using the application area **Advanced**, which isn't assigned to any experiences. For more information, see [FAQ](/dynamics365/business-central/across-faq).

Most of these fields become available/visible soon, but until then you have to create an extension to get (almost) the same experience as you have in [!INCLUDE[navnow_md](includes/navnow_md.md)]. See the [example](#to-enable-advanced-in-an-extension) below.

> [!IMPORTANT]  
> Adding the application area **Advanced** to the experience means that you lose some of the simplification made to pages. For example, you see more actions duplicated on many pages, compared to [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] where the experience is intended to be simpler than in [!INCLUDE[navnow_md](includes/navnow_md.md)]. You must also consider that we plan to re-tag the **Advanced** actions/controls and add them to the **Essentials** and/or **Premium** experiences in a future release.

### To enable Advanced in an extension

Depending on which experience you want to enable **Advanced** for you can subscribe to `OnGetEssentialExperienceAppAreas` or `OnGetPremiumExperienceAppAreas`. If you've defined your own experience, you must subscribe to `OnSetExperienceTier`.

The experiences are additive so you only need to subscribe to one of the events. For example, to enable **Essentials** and 
**Premium** experiences you only need to subscribe to `OnGetEssentialExperienceAppAreas`. 

```AL
codeunit 50102 EnableAdvancedApplicationArea
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt. Facade", 'OnGetEssentialExperienceAppAreas', '', false, false)]
    local procedure EnableAdvancedApplicationAreaOnGetEssentialExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup.Advanced := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt. Facade", 'OnGetPremiumExperienceAppAreas', '', false, false)]
    local procedure EnableAdvancedApplicationAreaOnGetPremiumExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup.Advanced := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt. Facade", 'OnSetExperienceTier', '', false, false)]
    local procedure EnableAdvancedApplicationAreaOnSetExperienceTier(ExperienceTierSetup: Record "Experience Tier Setup"; var TempApplicationAreaSetup: Record "Application Area Setup" temporary; var ApplicationAreasSet: Boolean)
    begin
        TempApplicationAreaSetup.Advanced := true;
    end;
}

```

## Application areas advantages and disadvantages

If you decide to code application areas as an extension, there are some aspects that must be considered. Application areas enable hiding entire business scenarios and you can have the same code base, which makes it possible to quickly modify the UI for different business scenarios or audiences. However, tagging errors as missing tags or incorrect tags occur and every single control must be tagged. 

## Related information

[Module System Application](/dynamics365/business-central/application/system-application/module/system-application/)    
[Module Base Application](/dynamics365/business-central/application/base-application/module/base-application)    
[ApplicationArea Property](properties/devenv-applicationarea-property.md)    
[ApplicationArea Method](./methods-auto/library.md)    
[AccessByPermission Property](properties/devenv-accessbypermission-property.md)    
[Properties](properties/devenv-properties.md)
