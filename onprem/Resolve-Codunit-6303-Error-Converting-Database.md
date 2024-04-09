---
title: "Codeunit 6303 Azure AD Auth Flow Error When Converting to Dynamics NAV 2018"
description: "Explains how to resolve the compilation error that you get for Codeunit 6303 Azure AD Auth Flow when converting a database from Dynamics NAV 2017 to 2018."
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
## Resolving Codeunit 6303 Azure AD Auth Flow Compilation Error 
This article explains how to resolve the compilation error that you get for Codeunit **6303 Azure AD Auth Flow** when converting a [!INCLUDE[nav2017](includes/navcorfu_md.md)] database to [!INCLUDE[nav2018_md](includes/nav2018_md.md)].

To resolve this error, you can update Codeunit **6303 Azure AD Auth Flow**  in the converted database to support the latest platform changes by replacing its code with the code that follows: 

1. Copy the code to a text editor, and save it as a .txt file type.
2. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to import and compile the file to the converted database.

> [!NOTE]  
>  If the Codeunit **6303 Azure AD Auth Flow**  object in your database includes custom code, then you might have to resolve conflicts with your custom code.

```
OBJECT Codeunit 6303 Azure AD Auth Flow
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    OnRun=BEGIN
          END;

  }
  CODE
  {
    VAR
      AuthFlow@1000 : DotNet "'Microsoft.Dynamics.Nav.Ncl, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Runtime.ALAzureAdCodeGrantFlow";
      ProviderNotInitializedErr@1001 : TextConst 'ENU=The Azure AD Authentication Flow provider has not been initialized.';

    PROCEDURE CanHandle@11() : Boolean;
    VAR
      AzureADMgtSetup@1000 : Record 6303;
    BEGIN
      IF AzureADMgtSetup.GET THEN
        EXIT(AzureADMgtSetup."Auth Flow Codeunit ID" = CODEUNIT::"Azure AD Auth Flow");

      EXIT(FALSE);
    END;

    PROCEDURE Initialize@1(SecurityId@1000 : GUID;RedirectUri@1001 : Text);
    VAR
      Uri@1002 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
    BEGIN
      IF CanHandle THEN
        AuthFlow := AuthFlow.ALAzureAdCodeGrantFlow(Uri.Uri(RedirectUri))
      ELSE
        OnInitialize(SecurityId,RedirectUri,AuthFlow);
    END;

    PROCEDURE AcquireTokenByAuthorizationCode@2(AuthorizationCode@1000 : Text;ResourceName@1001 : Text) AccessToken : Text;
    BEGIN
      CheckProvider;
      IF CanHandle THEN
        AccessToken := AuthFlow.ALAcquireTokenByAuthorizationCode(AuthorizationCode,ResourceName)
      ELSE
        OnAcquireTokenByAuthorizationCode(AuthorizationCode,ResourceName,AccessToken);
    END;

    PROCEDURE AcquireTokenByAuthorizationCodeWithCredentials@3(AuthorizationCode@1000 : Text;ClientID@1002 : Text;ApplicationKey@1003 : Text;ResourceName@1001 : Text) AccessToken : Text;
    BEGIN
      CheckProvider;
      IF CanHandle THEN
        AccessToken := AuthFlow.ALAcquireTokenByAuthorizationCodeWithCredentials(AuthorizationCode,ClientID,ApplicationKey,ResourceName)
      ELSE
        OnAcquireTokenByAuthorizationCodeWithCredentials(AuthorizationCode,ClientID,ApplicationKey,ResourceName,AccessToken);
    END;

    PROCEDURE AcquireTokenFromCache@4(ResourceName@1000 : Text) AccessToken : Text;
    BEGIN
      CheckProvider;
      IF CanHandle THEN
        AccessToken := AuthFlow.ALAcquireTokenFromCache(ResourceName)
      ELSE
        OnAcquireTokenFromCache(ResourceName,AccessToken);
    END;

    PROCEDURE AcquireTokenFromCacheWithCredentials@5(ClientID@1000 : Text;AppKey@1001 : Text;ResourceName@1002 : Text) AccessToken : Text;
    BEGIN
      CheckProvider;
      IF CanHandle THEN
        AccessToken := AuthFlow.ALAcquireTokenFromCacheWithCredentials(ClientID,AppKey,ResourceName)
      ELSE
        OnAcquireTokenFromCacheWithCredentials(ClientID,AppKey,ResourceName,AccessToken);
    END;

    PROCEDURE GetSaasClientId@15() ClientID : Text;
    BEGIN
      CheckProvider;
      IF CanHandle THEN
        ClientID := AuthFlow.ALGetSaasClientId
      ELSE
        OnGetSaasClientId(ClientID);
    END;

    PROCEDURE CreateExchangeServiceWrapperWithToken@14(Token@1000 : Text;VAR Service@1002 : DotNet "'Microsoft.Dynamics.Nav.EwsWrapper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Exchange.ExchangeServiceWrapper");
    VAR
      ServiceFactory@1003 : DotNet "'Microsoft.Dynamics.Nav.EwsWrapper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Exchange.ServiceWrapperFactory";
    BEGIN
      IF CanHandle THEN
        Service := ServiceFactory.CreateServiceWrapperWithToken(Token)
      ELSE
        OnCreateExchangeServiceWrapperWithToken(Token,Service);
    END;

    LOCAL PROCEDURE CheckProvider@35();
    VAR
      Initialized@1000 : Boolean;
    BEGIN
      IF CanHandle THEN
        Initialized := NOT ISNULL(AuthFlow)
      ELSE
        OnCheckProvider(Initialized);

      IF NOT Initialized THEN
        ERROR(ProviderNotInitializedErr);
    END;

    [Integration]
    LOCAL PROCEDURE OnInitialize@6(SecurityId@1000 : GUID;RedirectUri@1001 : Text;VAR AzureADAuthFlow@1003 : DotNet "'Microsoft.Dynamics.Nav.Ncl, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Runtime.ALAzureAdCodeGrantFlow");
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnAcquireTokenByAuthorizationCode@7(AuthorizationCode@1000 : Text;ResourceName@1001 : Text;VAR AccessToken@1002 : Text);
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnAcquireTokenByAuthorizationCodeWithCredentials@8(AuthorizationCode@1004 : Text;ClientID@1003 : Text;ApplicationKey@1001 : Text;ResourceName@1000 : Text;VAR AccessToken@1002 : Text);
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnAcquireTokenFromCache@9(ResourceName@1000 : Text;VAR AccessToken@1001 : Text);
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnAcquireTokenFromCacheWithCredentials@10(ClientID@1000 : Text;AppKey@1001 : Text;ResourceName@1002 : Text;VAR AccessToken@1003 : Text);
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnGetSaasClientId@16(VAR ClientID@1000 : Text);
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnCreateExchangeServiceWrapperWithToken@13(Token@1000 : Text;VAR Service@1002 : DotNet "'Microsoft.Dynamics.Nav.EwsWrapper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Exchange.ExchangeServiceWrapper");
    BEGIN
    END;

    [Integration]
    LOCAL PROCEDURE OnCheckProvider@12(VAR Result@1000 : Boolean);
    BEGIN
    END;

    BEGIN
    {
      // This codeunit should never be called directly. It should only be called through COD6300.
    }
    END.
  }
}
```

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2017 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2017-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
