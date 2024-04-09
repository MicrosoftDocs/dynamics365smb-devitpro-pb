---
title: "Codeunit 131015 Library - Azure AD Auth Flow Error When Converting to Dynamics NAV 2018"
description: "Explains how to resolve the compilation error that you get for Codeunit 131015 Library - Azure AD Auth Flow when converting a database from Dynamics NAV 2017 to 2018."
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
## Resolving Codeunit 131015 Library - Azure AD Auth Flow Compilation Error 
This article explains how to resolve the compilation error that you get for Codeunit **131015 Library - Azure AD Auth Flow** when converting a [!INCLUDE[nav2017](includes/navcorfu_md.md)] database to [!INCLUDE[nav2018_md](includes/nav2018_md.md)].

To resolve this error, you can update Codeunit **131015 Library - Azure AD Auth Flow**  in the converted database to support the latest platform changes by replacing its code with the code that follows: 

1. Copy the code to a text editor, and save it as a .txt file type.
2. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to import and compile the file to the converted database.

> [!NOTE]  
>  If the Codeunit **131015 Library - Azure AD Auth Flow**  object in your database includes custom code, then you might have to resolve conflicts with your custom code.

```
OBJECT Codeunit 131015 Library - Azure AD Auth Flow
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    EventSubscriberInstance=Manual;
    OnRun=BEGIN
          END;

  }
  CODE
  {
    VAR
      TokenAvailable@1000 : Boolean;
      TokenByAuthCodeTxt@1001 : TextConst '@@@={Locked};ENU=TokenByAuthCode';
      TokenByAuthCodeWithCredsTxt@1002 : TextConst '@@@={Locked};ENU=TokenByAuthCodeWithCreds';
      TokenFromCacheTxt@1003 : TextConst '@@@={Locked};ENU=TokenFromCache';
      TokenFromCacheWithCredentialsTxt@1004 : TextConst '@@@={Locked};ENU=TokenFromCacheWithCredentials';
      SaasClientIdTxt@1005 : TextConst '@@@={Locked};ENU=11111111-1111-1111-1111-111111111111';
      CachedTokenAvailable@1007 : Boolean;
      ClientIdAvailable@1006 : Boolean;

    LOCAL PROCEDURE CanHandle@7() : Boolean;
    VAR
      AzureADMgtSetup@1000 : Record 6303;
    BEGIN
      IF AzureADMgtSetup.GET THEN
        EXIT(AzureADMgtSetup."Auth Flow Codeunit ID" = CODEUNIT::"Library - Azure AD Auth Flow");

      EXIT(FALSE);
    END;

    [EventSubscriber(Codeunit,6303,OnInitialize)]
    LOCAL PROCEDURE OnInitialize@1(SecurityId@1000 : GUID;RedirectUri@1001 : Text;VAR AzureADAuthFlow@1002 : DotNet "'Microsoft.Dynamics.Nav.Ncl, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Runtime.ALAzureAdCodeGrantFlow");
    VAR
      Uri@1003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
    BEGIN
      IF CanHandle THEN
        AzureADAuthFlow := AzureADAuthFlow.ALAzureAdCodeGrantFlow(Uri.Uri(RedirectUri));
    END;

    [EventSubscriber(Codeunit,6303,OnAcquireTokenByAuthorizationCode)]
    LOCAL PROCEDURE OnAcquireTokenByAuthorizationCode@2(AuthorizationCode@1000 : Text;ResourceName@1001 : Text;VAR AccessToken@1002 : Text);
    BEGIN
      IF CanHandle AND TokenAvailable THEN
        AccessToken := TokenByAuthCodeTxt;
    END;

    [EventSubscriber(Codeunit,6303,OnAcquireTokenByAuthorizationCodeWithCredentials)]
    LOCAL PROCEDURE OnAcquireTokenByAuthorizationCodeWithCredentials@3(AuthorizationCode@1000 : Text;ClientID@1001 : Text;ApplicationKey@1002 : Text;ResourceName@1003 : Text;VAR AccessToken@1004 : Text);
    BEGIN
      IF CanHandle AND TokenAvailable THEN
        AccessToken := TokenByAuthCodeWithCredsTxt;
    END;

    [EventSubscriber(Codeunit,6303,OnAcquireTokenFromCache)]
    LOCAL PROCEDURE OnAcquireTokenFromCache@4(ResourceName@1000 : Text;VAR AccessToken@1001 : Text);
    BEGIN
      IF CanHandle AND CachedTokenAvailable THEN
        AccessToken := TokenFromCacheTxt;
    END;

    [EventSubscriber(Codeunit,6303,OnAcquireTokenFromCacheWithCredentials)]
    LOCAL PROCEDURE OnAcquireTokenFromCacheWithCredentials@5(ClientID@1000 : Text;AppKey@1001 : Text;ResourceName@1002 : Text;VAR AccessToken@1003 : Text);
    BEGIN
      IF CanHandle AND CachedTokenAvailable THEN
        AccessToken := TokenFromCacheWithCredentialsTxt;
    END;

    [EventSubscriber(Codeunit,6303,OnGetSaasClientId)]
    LOCAL PROCEDURE OnGetSaasClientId@9(VAR ClientID@1000 : Text);
    BEGIN
      IF CanHandle AND ClientIdAvailable THEN
        ClientID := SaasClientIdTxt;
    END;

    [EventSubscriber(Codeunit,6303,OnCheckProvider)]
    LOCAL PROCEDURE OnCheckProvider@6(VAR Result@1000 : Boolean);
    BEGIN
      IF CanHandle THEN
        Result := TRUE;
    END;

    [EventSubscriber(Codeunit,6303,OnCreateExchangeServiceWrapperWithToken)]
    LOCAL PROCEDURE OnCreateExchangeServiceWrapperWithToken@10(Token@1000 : Text;VAR Service@1001 : DotNet "'Microsoft.Dynamics.Nav.EwsWrapper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Exchange.ExchangeServiceWrapper");
    VAR
      ServiceFactory@1002 : DotNet "'Microsoft.Dynamics.Nav.EwsWrapper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Exchange.ServiceWrapperFactory";
    BEGIN
      IF CanHandle THEN
        Service := ServiceFactory.CreateServiceWrapper2013;
    END;

    PROCEDURE SetTokenAvailable@8(Available@1000 : Boolean);
    BEGIN
      TokenAvailable := Available;
    END;

    PROCEDURE SetCachedTokenAvailable@11(Available@1000 : Boolean);
    BEGIN
      CachedTokenAvailable := Available;
    END;

    PROCEDURE SetClientIdAvailable@13(Available@1000 : Boolean);
    BEGIN
      ClientIdAvailable := Available;
    END;

    BEGIN
    END.
  }
}
```

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2017 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2017-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
