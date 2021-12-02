---
title: "Technical Validation FAQ"
description: "The technical validation FAQ for Business Central apps"
author: a-emniel
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: a-emniel
---

# Technical Validation FAQ
 

#### How many automated tests do we need to run for validation and how high must the test coverage be?  
Test automation is something we expect you to run, to test your app and to make sure that the quality of your app is high. We do not run tests of your app in our environment, nor do we have a set value i.e., we do not state that you need to have a code coverage of a certain percentage. Instead, we rely on you to test your app properly to give your customers a good experience.     
 
#### Is there a forum, where we can ask questions about AppSource submissions?
Yes, you can join our AppSource group in our Yammer network at [aka.ms/BCYammer](https://aka.ms/bcyammer) (note that you need to be a Microsoft partner to do so). In this group, you will find announcements from Microsoft together with discussions around various AppSource related topics. If you have problems connecting, please email dyn365bep@microsoft.com. 

#### Is it possible to create apps with the same ID several times?  
Each unique codebase have one unique ID. If you have four apps in AppSource, you need to have four unique IDs for these apps. Otherwise you'll get conflicts. 

#### How detailed do the key usage scenarios need to be?  
A general description is OK. You should try to consider what an inexperienced user would need in order to complete the scenario. 

#### When I submit an app to AppSource; do you always make a manual validation based on the provided documentation?  
We don't use the manual with every validation. We reserve the right to do it, but we don't do it for every app. 

#### How can we automatically test apps where there is no Docker Image?  
There are a few options: 
1. Request a runtime package from the AppSource developer and deploy that on your sandbox. 
2. Test your application on an online sandbox. The latest ContainerHelper does support running full CI/CD pipelines using an online sandbox.

#### What if we already have an app on AppSource but we need to create the same app for another country; can we then have the same app ID for two different apps targeting two different countries?  
If they are different apps (different code) they should have different identity. Identity is used in, for example, app management, dependencies, support cases and telemetry. If reused across different apps, identity uniqueness is lost. Another approach could be a common shared (internal/library) app across countries (with one app identity) and localized functionality as extensions on top (with their own identity). 
 
#### How can we issue hotfixes fast once our app is live in AppSource? Let's say we have customers live on our app and we need to deploy something instantly; do we need to wait an entire calendar week for that to be validated?  
We have automated a lot of things and most of the submissions are now processed within one business day. The technical validation of the app is fully automated so you will know within a few minutes (hours in the worst case) if your app passed the validation or not. Once your app has passed the certification stage, it is automatically published to [!INCLUDE[prod_short](../includes/prod_short.md)] and becomes available for your customers. 

Before submitting your apps in Partner Center, our recommendation is to make sure you fulfilled all the requirements in the technical validation checklist, including running the self-validation.

#### What does it mean if I have an app in development that needs another dependency loaded, but I can't get the dependency's codeunits to load in my BC docker instance because it says the dependency's range is outside my range?  
It means that your license doesn't allow you to publish that application. A recommendation would be to either get a runtime package from the developer of that AppSource app, which will allow you to bypass the licensing check or to try and test it on an online sandbox environment where that AppSource app is already installed. 

#### Is there going to be made any changes to the object names character limitation (30 characters) within the near future? 
We would like longer names as well. Introducing namespaces could be one investment. However, such a changes has down-stream breaking impact (any caller needs to qualify calls) and there are SQL constraints on name lengths for tables, which currently include company name, table name, app ID and needs to be maximum 255. Currently a solution will not be available in 2021. 


## See Also

[Marketing Validation Checklist](readiness-checklist-marketing.md)  
