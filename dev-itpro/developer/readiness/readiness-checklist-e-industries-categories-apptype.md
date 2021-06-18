---
title: "App type, contact type, and customer leads"
description: "Guidelines on app type, contact type, and customer leads."
author: a-emniel
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: a-emniel
---

# App type, contact type, and customer leads

## App type

| Type of app| Description |
|-------------|--------------|
|Add-on app | An add-on app extends the experience and the existing functionality of Microsoft Dynamics 365 Business Central. Add-on apps can be used in multiple scenarios, whether it is integrating to online services, making custom web services, adding business functionality, or extending the user interface. An add-on app can be a standalone app or an app with dependencies. Dependent add-on apps will automatically be installed together with your app. |
Connect app | A connect app is used in the scenario where there must be established a point-to-point connection between Microsoft Dynamics 365 Business Central and a 3rd party solution or service. With connect apps, data and app functionality lives in a service outside Business Central. The listing type of connect apps is always ‘Contact Me’, as they require external setup to work. Note: If your app cannot integrate with Business Central through API, or require substantial coding in AL, submit the app as an add-on app for AppSource instead.  .

## Contact type

If your app is an add-on app you can choose between the two contact types 'Free' or 'Free Trial', whereas if your app is a connect app, you can choose the 'Contact Me' option.  


|Contact type | Description | Button in AppSource | 
|-----------|--------------|--------------|
|'Free'|Customers get the offer free of charge | A 'Get It Now' button will appear on your offer's storefront. |
|'Free Trial'| Customers can try your offer for a short period of time on AppSource | A 'Free Trial' button will appear in the storefront.|
|'Contact Me' | Customers will have to leave their contact information, and you will be able to contact them | A 'Contact Me' button will appear on your offer's storefreont.|


## Customer leads

Provide connection details to the CRM system where you would like us to send customer leads. Read more about configuring customer leads
[here](/azure/marketplace/partner-center-portal/commercial-marketplace-get-customer-leads#connect-to-your-crm-system).
