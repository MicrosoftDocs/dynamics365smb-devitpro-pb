---
title: "Embed App Components"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
[!INCLUDE[embedapp_preview](../developer/includes/embedapp_preview.md)]

# [!INCLUDE[embedapp](../developer/includes/embedapp.md)] Components and Capabilities
Because an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] should provide end-to-end experience for the customers, the partner designing this experience, must be able to affect and control more parts of the [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] service experience.

## Components 
On a high level, an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is a package that consists of the following parts:

-   Library extensions

    This is the functionality of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] that is implemented by the ISV partner in a form of extensions.  
-   Third party extensions 

    These are add-on extensions coming from other ISVs that contribute to and enhance the [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. The extensions are validated to be compatible by the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] owner.  
-   Extended metadata 

    This includes additional [!INCLUDE[embedapp](../developer/includes/embedapp.md)] properties that are specific to this type of app and not otherwise available for other types of apps (see the list below). 
-   Base application and tenant template (optional)  

## Capabilities
The following capabilities are only available for the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] and not for other types of [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] apps (Connect and Add-on).

### Partner Branding
The [!INCLUDE[embedapp](../developer/includes/embedapp.md)] will promote the ISV brand in several places: 
-   Web Client and Web Service URLs  
    -   Client https://[application name].bc.dynamics.com 
    -   Web Services https://[application name].api.bc.dynamics.com 
-   Name, image, and icon on the “provisioning” page of the Fixed Client Endpoint 
-   Splash screen of the Web Client 
-   Title bar of the Web Client (for example, “Fabrikam Apples”) 
-   Dynamics Shell (https://home.dynamics.com) - a dedicated product tile, icon, and short marketing description 
-   In-product messages (such as pop-up errors, warnings, notifications)


 ![Embed App apps](../media/embed-app-apps.png "Embed App apps")  

### Exclusivity
The partner can control which third party apps can be installed for their [!INCLUDE[embedapp](../developer/includes/embedapp.md)].  
-   Whitelisting of the 3rd party apps - no other apps will be possible to install, except the ones explicitly approved by the ISV 
-   App install/uninstall controlled by the ISV 
-   The partner can choose to allow a customer to install other extensions from the AppSource, but this will be an explicit partner decision, not the default behavior 

### Additional settings (metadata): 
-   An [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is the property of the ISV partner, so the customers of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] must be able to find the partner’s own legal, privacy, contact, community and feedback links (not Microsoft links) when they work with the app: 

    ![Embed App contact](../media/embed-app-contact.png "Embed App contact")  
 
-   Whitelisted domains for embedding [!INCLUDE[embedapp](../developer/includes/embedapp.md)] pages into other web sites, including SharePoint (“frame ancestors”) 
-   Target version of [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] platform 
-   Target version of [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] base application (if not included with the [!INCLUDE[embedapp](../developer/includes/embedapp.md)]) 
-   Azure KeyVault account for storing ISV application secrets (for example, accounts for connecting to 1-3rd party services) 
-   Base application + tenant template. This is an optional component of an [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. The partner can choose to include it or simply specify which version of the [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] base application the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] should use as a base application.

At this stage, within the extensions and base application, the ISV partner can work in their own Object ID range. 

## Base Application 
The base application is the [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] application which the partner obtained from Microsoft, customized and extended to fit the needs of the industry the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] supposed to cover.  
Major releases and cumulative updates (CUs) of the base application are publicly available on Microsoft Download and as images on Docker. 
Microsoft Download: https://support.microsoft.com/help/4072483 
Docker Hub: https://hub.docker.com/r/microsoft/dynamics-nav/  
Pre-released versions of the base application are available for participants of the “Ready and Go” program via Microsoft Collaborate. 
Although we recommend always using the latest version of the base application, the ISV partner can choose any version they need. The only requirement is that the ISV partner makes sure that the base application version they include with the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] can run on a supported [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] platform version.  
The base application is an optional part of an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] package. If the partner has implemented all required functionality in their library extensions, they don’t need to include the base application itself with the [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. Instead they should specify, in the metadata of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)], which version of the [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] base application they are targeting.  
ISVs can choose to bring their own code-customized base application for several reasons: 
-   Shortening time-to-market (“lift and shift” approach).

    The ISV's current solution is a significantly customized version of the Microsoft Dynamics NAV application and it will require substantial time and effort to migrate it into extensions. An ISV can lift their solution as-is (upgraded to a supported platform) to [!INCLUDE[d365_bus_central_md](../developer/includes/d365_bus_central_md.md)] service and start offering it to their new and prospective customers. Then, they can gradually start moving their functionality into extensions to achieve the benefits that come with the extension model.  
-   Overcoming the limitations of the current extensions framework.

    Extensions today can support many scenarios and the Microsoft team is working on extending these capabilities even more. However, some customization needs of the partners are not yet possible using the current version of the extensions framework, so partners can choose to do these changes directly in the base application using C/SIDE Development Environment.  
-   Availability of 3rd party add-ins as extensions.

    Some of the add-ins required by the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] might not yet be available as extensions, for the reasons mentioned above. The partner can choose to import these add-ins as FOB files into the base application that they submit with the [!INCLUDE[embedapp](../developer/includes/embedapp.md)].   
-   Usage of .NET interoperability and custom assemblies.

    ISV partners use .NET interoperability in their current application to address multiple business scenarios. Although extensions today allow a number of these scenarios to be implemented in AL, they don’t and cannot cover for all possible scenarios of .NET usage. Therefore, the partner can choose to import the required .NET add-ins into the Add-ins table of the base application, and these add-ins will automatically be deployed into the environment where they will be running.

Microsoft recommends all ISV’s to move towards a model where the code-customization of the base application is not used. In that future state, ISV’s will be able to fully rely on AL and Extensions version 2.0 or later.  
 
## See Also  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md) 
[Microsoft Responsibilities](embed-app-microsoft-responsibilities.md)   
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Managing in Microsoft Lifecycle Services](embed-app-lifecycle-services.md) 
[[!include[prodshort](../developer/includes/prodshort.md)] Platform](embed-app-platform.md)  
[[!include[prodshort](../developer/includes/prodshort.md)] Licensing](embed-app-licensing.md)  
[Customer Signup](embed-app-customer-signup.md)  
[Appsource](embed-app-appsource.md)  
[Sandbox](embed-app-sandbox.md)  
[Ecosystem Features](embed-app-ecosystem.md)  