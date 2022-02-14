---
title: "About Dates in Business Central"
description: "About dates and time zones in Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/14/2022
ms.reviewer: 
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# About Dates in Business Central

Working with dates and time zones in Business Central, the following provides a list of what's good to know.

- Every Business Central user has a timezone specified on the page **User Settings**.
- When a user logs into Business Central for the first time, this timezone is set using settings from the browser.
- Business Central stores **all** `DateTime` fields as UTC and in the UI layer, we convert this to the timezone, specified by the user on the **User Settings** page.
- Two users might see a timestamp differently, but the point-in-time is the same.
- The **Time Zone** field on the **User Settings** page is in the UI and as such is only known by the client. You cannot set a time zone per user on the **User Card** page in Business Central.
- Web Services connections are running using the UTC timezone and all DateTime’s transferred in OData include a time zone as well. 
- The places in Business Central, where you still see `Date` fields are there because these fields don’t represent a timestamp. Instead, they represent a date for financial reporting or similar.
- `Date` fields are never converted per time zone, a date value stays as it was entered.
- The posting date is entered by the user in the UI and as such represents the date on which this line is posted in the journal.
- The problem comes when the posting date field is defaulted in code using the TODAY function or a conversion from a datetime to a date. This conversion uses the users timezone and here comes the problem…
- With the current settings we have no way of guessing what the right date for a conversion like this is. Today we use UTC which for Businesses in the US and Australia will surface immediately. I am afraid that any change in this behavior might work for some customers but would cause a breaking change for other customers. This is not a bug, which we can issue a quick fix for.

## See also