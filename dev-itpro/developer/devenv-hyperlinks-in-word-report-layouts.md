---
title: "Setting up Hyperlinks in Word Report Layouts"
description: Learn how to create links from text and pictures fields in Word report layouts
ms.author: jswymer
ms.date: 11/22/2021
ms.topic: conceptual
ms.tgt_pltfrm: na
---

# Setting up Hyperlinks in Word Report Layouts

In a Word report layout, you can set up hyperlinks on text and picture fields. Suppose you want to add a link on invoice reports that targets the URL of a payment service. To make the link, you add a field to the Customer table for storing payments URLs. Then, you modify the report dataset and layout to include a link to payment services URL. You can set up the following types of links:  
  
- A text link that uses either the URL as its display name \(for example, `https://www.contuso.com/payments`) or some custom text \(for example, *Select here to make a payment*\).  
  
- A logo of the payment service that links to the payments services URL.  
  
This feature relies on specific naming convention for the columns for the URL data in the report dataset.  
  
## Set up a text link that uses the URL as the display name
  
1. In the source table for the report, add a text data type field for storing URLs.  
  
2. In the report dataset, add a column for the field that stores the URL. Give the column a name that ends in **\_Url**, such as *PaymentService\_Url*. You can use any valid name as long as it ends in **\_Url** \(this value is case sensitive\).  
  
3. In the Word report layout, add a text control for the "**\_Url**" column.  
  
## Set up a text link that uses custom text as the display name

Follow these guidelines:  
  
1. In the source table for the report, add the following fields:  
  
    - A text data type field for storing the URLs.  
  
    - A text data type field for storing the text strings to use as the links to the URLs.  
  
     There are no special requirements for these names, apart from the standard conventions.  
  
2. In the report dataset, add the following columns:  
  
    - A column for field that stores the URL. Give the column a name that ends with the text **\_Url**, such as *PaymentService\_Url*. You can use any valid name, as long as it ends with **\_Url** \(this value is case-sensitive\).  
  
    - A column for the field that stores the link text strings. Give the column a name that ends with the text **\_UrlText**, such as *PaymentService\_UrlText*. You can use any name, as long as it ends with **\_UrlText** \(this value is case-sensitive\).  
  
3. In the Word report layout, add a text control for the "**\_Url**" column.  
  
    You don't add a control in the layout for the "**\_UrlText**" column. This column is only used as a container for the link text. When the report is generated, the text from the "**\_UrlText**" column will be extracted and rendered in the "**\_Url**" column control.  
  
## Set up a link on a picture

1. In the source table for the report, include the following fields:  
  
    - A text data type field for storing the URLs.  
  
    - A BLOB data type field for storing pictures.  
  
2. In the report dataset, add the following columns:  
  
    - A column whose source is the field that stores the picture. You give this column any valid name that you want, such as *Picture*.  
  
    - A column whose source is the field that stores the URL. The name of the column must start with the name of the column for the picture source and followed by/ending with **\_Url**. **\_Url** is case-sensitive. For example, if the picture source column is called **Picture**, this column must be named **Picture\_Url**.  
  
3. In the Word report layout, add a picture control for the picture source column.  
  
## See Also  

[Creating a Word Layout Report](devenv-howto-report-layout.md)  
