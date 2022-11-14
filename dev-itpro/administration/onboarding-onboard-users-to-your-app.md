---
title: Onboard users to your app
description: Learn how to ensure users can onboard to your app in the easiest way.
ms.date: 08/03/2022
ms.topic: conceptual
author: sorenfriisalexandersen
ms.author: soalex
ms.reviewer: edupont
---

# Onboard users to your app

When customizing or adding to the features of [!INCLUDE [prod_short](../includes/prod_short.md)] with addon apps, consider how to best let the user onboard to the functionality the app provides, so they can help themselves get up and running with the features your app provides.

By using some of the built-in onboarding components, you can ensure a smooth and frictionless experience for your users. Consider how your app provides the following experiences.  

## Setup experience

If the user needs to go through some steps to set up your app, make sure the user is naturally guided to find that setup, both when installing the app or later, at the user's convenience.

You can tell [!INCLUDE [prod_short](../includes/prod_short.md)] which setup objects are brought with your app by adding them as a **Guided Experience Item**. This is done by referencing the Guided Experience codeunit and calling the relevant function for inserting the type of setup you bring. See more about the different types of setup in **Guided Experience Item** here: [**Guided Experience Item**](onboarding-checklist.md#guided-experience-item).

Example:

```al
codeunit 50100 "My App Setup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure InsertIntoAssistedSetupOnRegisterAssistedSetup()
    var
        GuidedExperience: Codeunit "Guided Experience";
        AssistedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
        SetupShortTitle: text[50];
        SetupTitle: text[50];
        SetupDescription: text[50];
        IsPrimarySetup: boolean; 
    begin
        IsPrimarySetup := true;
        GuidedExperience.InsertAssistedSetup(SetupTitle, SetupShortTitle, SetupDescription, 5, ObjectType::Page, Page::"My App Setup Wizard", AssistedSetupGroup::ReadyForBusiness, '', VideoCategory::ReadyForBusiness, '', IsPrimarySetup);
    end;
```

In this example, the page **My App Setup Page** is added to ****Guided Experience Item**** as the primary setup object for the app.  

> [!NOTE]  
> "The Boolean parameter utilized by the IsPrimarySetup variable in the above example becomes available in 2022 release wave 2. Start preparing already now.

You can insert as many setup objects to **Guided Experience Item** as you like. Everything that is part of setting up the app should be added. If no special steps are required to set up the app before using it, nothing needs to be added.

> [!IMPORTANT]  
> There can only be one primary object for the app in Guided Experience. It is your responsibility as an app publisher to make sure that only one exists. For example, if your app is changing the primary setup object over time, you must handle this as part of the upgrade and remove the designation of the primary setup before you add a new one.

Once you have added your app's setup object to **Guided Experience Item**, a user can easily find it when on the **Extensions Management** page. An action and a context menu action, **Set up this app** will open the primary setup object.

## Assisted setup

To guide the user through the steps of setting up your app, consider building an assisted setup guide. An assisted setup guide is a wizard-like page of type *NavigatePage* that is intended to carry users through a step-by-step guide to perform one or more actions. It provides a great way to let the user know about important concepts and required steps needed for your app to work properly. Read more about the **NavigatePage** type here: [Understanding page types](../developer/devenv-page-types-and-layouts.md#understanding-page-types).

## Just-in-time setup

If your app has a lot of setup, consider if all setup must be handled by the wizard, or if some setup can be deferred to when the user needs to perform some action in your app, and trigger the necessary setup action at that point in time. Also consider whether the additional setup actions could be performed by a wizard. For example, your app may need the user to set up certain parameters and enter some master data for your app to work, depending on the nature of your app. Consider if both setups are needed initially, or if something can be deferred.

## Setup that does not belong to your app

The idea with inserting your setup objects into **Guided Experience Item** is that it is easy for [!INCLUDE [prod_short](../includes/prod_short.md)] to list all the setup options brought by your app, and run the primary, when the user chooses. This works because the setup object's record in **Guided Experience Item** is marked with your app's ID in the field **Extension ID**. Sometimes the setup that needs to be performed to use your app does not reside in a new setup page, but in standard setup pages in the base app that your app extends. For example, you may have added more fields to the **Sales & Receivables Setup** page, and you want to make sure the user easily finds that setup as part of setting up your app. There are several complications here: You cannot insert the **Sales & Receivables Setup** page to **Guided Experience Item**, because it is already there and owned by the base app extension. This means that when adding this page to a checklist, the standard base app titles and description are used. It also means that the user does not know that this setup exists, since nothing will be run or listed when the user chooses the **Set up this app** action described above.

To handle this, you must create a custom codeunit that runs the **Sales & Receivables Setup** page. This codeunit can then be inserted into **Guided Experience Item** as described above and contain the desired title and descriptions relevant when inserting it into the checklist. This codeunit would then be run when choosing the **Set up this app** action on **Extensions Management**.

## App installation

When installing AppSource apps through the user interface, a wizard appears that initiates the installation of the app. This wizard will give the user an option to wait for installation to complete and let the user run the primary setup of the app. This works in two steps: First, the user is presented with a page that shows the installation status for the app. When the app installation completes the user is given the option to run the setup brought by the app. If a primary setup is specified as described above, this setup will be run. The same will happen if only one setup object is added by the app. If multiple setup objects are added and no primary is specified, the user will be presented with the list of setup options provided by the app and can run each desired setup from there.

> [!IMPORTANT]  
> The installation guidance to find the primary setup only works for AppSource apps. However, you should still provide **Guided Experience Item**s for the setup objects belonging to your app if it is a Per Tenant Extension. The user will still enjoy easy access to those objects via Extensions Management.  

## First run experience of your app

To make sure the user has a great first-run experience, make sure you use teaching tips to educate the user about key concepts and actions in your app. Read more about teaching tips here: [Teaching tips and in-app tours for onboarding users](onboarding-teaching-tips-tours.md).

## Additional onboarding techniques

Consider which of your app's objects are relevant for being added to a user's Getting started checklist when starting their journey with [!INCLUDE [prod_short](../includes/prod_short.md)], and if your app fits into the initial journey or is added later on. If your app is part of the initial onboarding to [!INCLUDE [prod_short](../includes/prod_short.md)], make sure you expose every relevant page to the checklist by inserting it into the **Guided Experience Item** like described above. 

## Help the user get unblocked

Make sure you provide the best possible help to unblock users when needed. You do this by ensuring proper user of the contextSensitive properties for your app and your pages. This will ensure the user can find links to your documentation in the Help pane. To learn more, see [Dynamics 365 Business Central User Assistance Model](../user-assistance.md).

## See also

[Onboarding experiences in Business Central](onboarding-experiences.md)  
