---
title: "Technical Validation FAQ"
description: "The technical validation FAQ for Business Central apps"
author: EmmaNielsson
ms.custom: na
ms.date: 02/17/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: ENielsson
---

# Technical Validation FAQ
 

### How many automated tests do we need to run for validation? How high must the test coverage be?  
Test automation is something we expect you to run, to test your app and to make sure that the quality of your app is high. We do not run tests of your app in our environment nor do we have a set value i.e., we do not state that you need to have a code coverage of a certain percentage. Instead, we rely on you to test your app properly to give your customers a good experience.     
 
### Is there a forum, where we can ask questions about AppSource submissions and get information about what's new when it comes to AppSource apps and validation? 
Yes, you can join our AppSource group in our Yammer network at [aka.ms/BCYammer](http://aka.ms/bcyammer) (note that you need to be a Microsoft partner to do so). In this group, you will find announcements from Microsoft together with discussions around various AppSource related topics. If you are having problems connecting, please email dyn365bep@microsoft.com 


### Can we create apps with the same ID several times?  
Each unique codebase have one unique ID. If you have four apps in AppSource, you need to have four unique IDs for these apps. Otherwise you'll get conflicts. 

### What if we already have an app on AppSource but we need to create the same app for another country; can we then have the same app ID for two different apps targeting two different countries?  
If they are different apps (different code) they should have different identity. Identity is used in e.g., app management, dependencies, support cases and telemetry. If reused across different apps, identity uniqueness is lost. Another approach could be a common shared (internal/library) app across countries (with one app identity) and localized functionality as extensions on top (with their own identity). 
 
### How can we issue hotfixes fast once our app is live in AppSource? Let's say we have customers live on our app and we need to deloy something instantly; do we need to wait an entire calendar week for that to be validated?  
Normally it will not take an entire calendar week. We are typically way faster and we will generally be much faster at passing an app than failing an app. We run the app trough automated testing and if an app passes, it's just a few clicks and it will be live within 6 hours after it has been passed. Our recommendation is to make sure your app passes (you fulfilled all the requirements inclucing self-validation), then it will be a fast experience. From the moment we receive the app it takes between 30 min to 5 hours to validate (depending on the number of countries you are targetting) and then it takes about 6 hours until it reaches production. In case you need to deploy an urgent hotfix you should email d365val@microsoft.com and we can try to expedite the submission.
In the future, we aim to offer you full control and visibility over the validation process so that you can upload your app to production, see the validation status and then push it to the environments that are waiting for the hotfix, but this is within the next 2-3 releases timeline.

### Why do we need to offer add-on apps as "free" or "free trial". Why can add-on apps not be listed as "contact me"?  
We have had some good discussions about this interally. We do want to open up for this eventually, but we need to add proper guidance for it. We want you to know that the "contact me" option is not attractive to prospects - there's a bad conversion rate on this. Note that if you take free trial you also get a 'contact me' form so people will have to register anyway. We've seen a lot of apps having a lot of different approaches to getting registrations; some are intrusive and some are very nice. So you can do a lot of great things instead of 'contact me'. 'Contact me' is like the easy way out, not necessarily the best way. Therefore, think about how you list your app!

### hej

### hej

### hej

### hej



## See Also

[Marketing Validation Checklist](readiness-checklist-marketing.md)  