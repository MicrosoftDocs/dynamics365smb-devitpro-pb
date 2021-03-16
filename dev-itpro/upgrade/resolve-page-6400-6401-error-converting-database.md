---
title: "Page 6400 and 6401 Errors "
description: "Explains how to resolve the compilation errors that you get forPage 6400 and 6401 when converting a database from Dynamics NAV to Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Page 6400 and 6401 Compilation Errors 
This article explains how to resolve the compilation error that you get for page **6400 Flow Selector** and page **6401 Flow Template Selector** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prod_short.md)].

## Resolution

The resolution requires that you make changes to codeunit 6400, as well as pages 6400 and 6401.

1. In codeunit **6400 Flow Service Management**, make the following changes:

   
   1. Add the following text constants to replace the existing text constant **FlowGraphResourceUrlTxt**:
    
      |Name|ConstValue|
      |----|----------|
      |AzureADGraphResourceUrlTxt|https://graph.windows.net|
      |MicrosoftGraphResourceUrlTxt|https://graph.microsoft.com| 	

   2. Change the value of the **TemplateFilterTxt** text constant to **Microsoft Dynamics 365 Business Central**. 

   3. Add two global functions, one called **GetAzureADGraphhResourceUrl** and the other called **GetMicrosoftGraphhResourceUrl**. 
   
      These will replace the existing function **GetFlowGraphResourceUrl**.
    
      For each function, set the **FunctionVisibility** property to **External** and specify a **Text** type return value. 
          
      Add the code `EXIT(AzureADGraphResourceUrlTxt)` and `EXIT(MicrosoftGraphResourceUrlTxt);` to the functions as shown:

      ```
      [External] GetAzureADGraphhResourceUrl() : Text
        EXIT(AzureADGraphResourceUrlTxt);
  
      [External] GetMicrosoftGraphhResourceUrl() : Text
        EXIT(MicrosoftGraphResourceUrlTxt);
      ```
    4. Add a global function called **GetTemplateFilter** that has a **Text** type return value, and add the code `EXIT(TemplateFilterTxt)` to the function:

      ```
      GetTemplateFilter() : Text
          // Gets the default text value that filters Flow templates when opening page 6400.
          EXIT(TemplateFilterTxt);
      ```
2. In page 6400 and 6401, in the `ControlAddinReady` function, replace the following code:

    ``` 
    CurrPage.FlowAddin.Initialize(
      FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
      AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
      AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowGraphResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE));
    ```
    
    With the following code:
    
    ```
    CurrPage.FlowAddin.Initialize(
            FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE));
    ```
    


## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
