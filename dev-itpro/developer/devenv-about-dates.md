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

Working with dates and time zones in [!INCLUDE[prod_short](../includes/prod_short.md)], the following provides a list of what's good to know.

- Every [!INCLUDE[prod_short](../includes/prod_short.md)] user has a timezone specified on the page **User Settings**.
- When a user logs into [!INCLUDE[prod_short](../includes/prod_short.md)] for the first time, this timezone is set using settings from the browser.
- [!INCLUDE[prod_short](../includes/prod_short.md)] stores **all** `DateTime` fields as UTC and in the UI layer, we convert this to the timezone, specified by the user on the **User Settings** page.
- Two users might see a timestamp differently, but the point-in-time is the same.
- The **Time Zone** field on the **User Settings** page is in the UI and as such is only known by the client. You cannot set a time zone per user on the **User Card** page in Business Central.
- Web Services connections are running using the UTC timezone and all `DateTime` types transferred in OData include a time zone as well. 
- The places in [!INCLUDE[prod_short](../includes/prod_short.md)], where you still see `Date` fields are there because these fields don’t represent a timestamp. Instead, they represent a date for financial reporting or similar.
- `Date` fields are never converted per time zone, a date value stays as it was entered.
- The posting date is entered by the user in the UI and as such represents the date on which this line is posted in the journal.

> [!NOTE]  
> Issues can occur when the posting date field is defaulted in code using the `Today` method or using a conversion from a `DateTime` to `Date`. This conversion uses the user's timezone. Based on the current settings, it is not possible to guess what the right date for a conversion like that is. Today UTC is used, which for businesses in the US and Australia will surface immediately.

## See also

[DateTime Data Type](methods-auto/datetime/datetime-data-type.md)  
[Date Data Type](methods-auto/date/date-data-type.md)
