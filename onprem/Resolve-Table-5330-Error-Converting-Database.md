---
title: "Resolving Table 5330 CRM Connection Setup Error When Converting a Database"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ea75b39-cf7d-4c88-868b-86fa0be2426b
caps.latest.revision: 4
author: jswymer
---
## Resolving Table 5330 CRM Connection Setup Error When Converting a Database
This article explains how to resolve the compilation error that you get for Table **5330 CRM Connection Setup** when converting a [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] database to [!INCLUDE[nav2017](includes/nav2017.md)].

To resolve this error, you must update Table **5330 CRM Connection Setup**  to support the latest Microsoft Dynamics 365 for Sales Software Development KIT (SDK). You can do this by replacing Table **5330 CRM Connection Setup** in the converted database by using the code that follows.
1. Copy the code to a text editor, and save it as a .txt file type.
2.  Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to import the file to the converted database, which replaces the existing table.

```
OBJECT Table 5330 CRM Connection Setup
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    Permissions=TableData 1261=rimd;
  }
  FIELDS
  {
    { 1   ;   ;Primary Key         ;Code20         }
    { 2   ;   ;Server Address      ;Text250       ;OnValidate=BEGIN
                                                                CRMIntegrationManagement.CheckModifyCRMConnectionURL("Server Address");
                                                              END;

                                                   CaptionML=ENU=Dynamics CRM URL }
    { 3   ;   ;User Name           ;Text250       ;OnValidate=BEGIN
                                                                "User Name" := DELCHR("User Name",'<>');
                                                              END;
                                                               }
    { 4   ;   ;User Password Key   ;GUID           }
    { 60  ;   ;Is Enabled          ;Boolean       ;OnValidate=BEGIN
                                                                EnableCRMConnection;
                                                                UpdateIsEnabledState;
                                                                RefreshDataFromCRM;
                                                              END;
                                                               }
    { 61  ;   ;Is User Mapping Required;Boolean   ;OnValidate=BEGIN
                                                                UpdateAllConnectionRegistrations;
                                                                UpdateIsEnabledState;
                                                                "Is User Mapped To CRM User" := IsCurrentUserMappedToCrmSystemUser;
                                                              END;

                                                   CaptionML=ENU=Dynamics NAV Users Must Map to Dynamics CRM Users }
    { 62  ;   ;Is User Mapped To CRM User;Boolean  }
    { 63  ;   ;CRM Version         ;Text30         }
    { 66  ;   ;Is S.Order Integration Enabled;Boolean }
    { 67  ;   ;Is CRM Solution Installed;Boolean   }
    { 68  ;   ;Is Enabled For User ;Boolean        }
    { 69  ;   ;Dynamics NAV URL    ;Text250       ;OnValidate=BEGIN
                                                                CRMIntegrationManagement.SetCRMNAVConnectionUrl("Dynamics NAV URL");
                                                              END;
                                                               }
    { 70  ;   ;Dynamics NAV OData URL;Text250     ;OnValidate=BEGIN
                                                                CRMIntegrationManagement.SetCRMNAVODataUrlCredentials(
                                                                  "Dynamics NAV OData URL","Dynamics NAV OData Username","Dynamics NAV OData Accesskey");
                                                              END;
                                                               }
    { 71  ;   ;Dynamics NAV OData Username;Text250;OnValidate=VAR
                                                                User@1000 : Record 2000000120;
                                                              BEGIN
                                                                User.SETRANGE("User Name","Dynamics NAV OData Username");
                                                                IF User.FINDFIRST THEN
                                                                  UpdateODataUsernameAccesskey(User)
                                                                ELSE BEGIN
                                                                  "Dynamics NAV OData Username" := '';
                                                                  "Dynamics NAV OData Accesskey" := '';
                                                                END;
                                                              END;

                                                   OnLookup=VAR
                                                              User@1000 : Record 2000000120;
                                                            BEGIN
                                                              IF PAGE.RUNMODAL(PAGE::Users,User) = ACTION::LookupOK THEN
                                                                UpdateODataUsernameAccesskey(User);
                                                            END;
                                                             }
    { 72  ;   ;Dynamics NAV OData Accesskey;Text250 }
    { 75  ;   ;Default CRM Price List ID;GUID      }
  }
  KEYS
  {
    {    ;Primary Key                             ;Clustered=Yes }
  }
  FIELDGROUPS
  {
  }
  CODE
  {
    VAR
      CRMIntegrationManagement@1055 : Codeunit 5330;
      AllowNewUncoupledItemsToBeSynchronizedQst@1012 : TextConst '@@@="%1 = Page 5338 Caption";ENU=Full Synchronization completed.\See the %1 window for details.\\Do you want to allow all scheduled synchronization jobs to create new records?';
      CantRegisterDisabledConnectionErr@1001 : TextConst 'ENU=A disabled connection cannot be registered.';
      ConnectionErr@1009 : TextConst '@@@=%1 Error message from the provider (.NET exception message);ENU=The connection setup cannot be validated. Verify the settings and try again.\Detailed error description: %1.';
      ConnectionStringFormatTok@1000 : TextConst '@@@={Locked};ENU="Url=%1; UserName=%2; Password=%3; authtype=Office365"';
      ConnectionSuccessMsg@1008 : TextConst 'ENU=The connection test was successful. The settings are valid.';
      ConnectionSuccessNotEnabledForCurrentUserMsg@1007 : TextConst '@@@="%1 = Current User ID, %2 - product name";ENU=The connection test was successful. The settings are valid.\\However, because the %2 Users Must Map to Dynamics CRM Users field is set, Dynamics CRM integration is not enabled for %1.';
      ConnectionWithCallerIdStringFormatTok@1002 : TextConst '@@@={Locked};ENU="Url=%1; UserName=%2; Password=%3; CallerID=%4"';
      CannotResolveUserFromConnectionSetupErr@1013 : TextConst 'ENU=The Dynamics CRM user that is specified in the CRM connection setup does not exist.';
      DetailsMissingErr@1006 : TextConst 'ENU=A Dynamics CRM URL, user name and password are required to enable a connection.';
      MissingUsernameTok@1003 : TextConst '@@@={Locked};ENU={USER}';
      MissingPasswordTok@1005 : TextConst '@@@={Locked};ENU={PASSWORD}';
      ProcessDialogMapTitleMsg@1011 : TextConst '@@@=@1 Progress dialog map no.;ENU=Synchronizing @1';
      ThereIsNoCRMUserErr@1010 : TextConst '@@@="%1 = User Email address";ENU=Cannot find a Dynamics CRM user with the email address %1, so the mapping of the user accounts is disabled. Specify the email address of a Dynamics CRM user in the Authentication Email field, and then enable the mapping again.';

    PROCEDURE CountCRMJobQueueEntries@30(VAR ActiveJobs@1000 : Integer;VAR TotalJobs@1001 : Integer);
    VAR
      JobQueueEntry@1002 : Record 472;
    BEGIN
      IF NOT "Is Enabled" THEN BEGIN
        TotalJobs := 0;
        ActiveJobs := 0;
      END ELSE BEGIN
        IF "Is CRM Solution Installed" THEN
          JobQueueEntry.SETFILTER("Object ID to Run",'%1|%2',CODEUNIT::"Integration Synch. Job Runner",CODEUNIT::"CRM Statistics Job")
        ELSE
          JobQueueEntry.SETRANGE("Object ID to Run",CODEUNIT::"Integration Synch. Job Runner");
        TotalJobs := JobQueueEntry.COUNT;

        JobQueueEntry.SETFILTER(Status,'%1|%2',JobQueueEntry.Status::Ready,JobQueueEntry.Status::"In Process");
        ActiveJobs := JobQueueEntry.COUNT;
      END;
    END;

    PROCEDURE HasPassword@8() : Boolean;
    BEGIN
      EXIT(GetPassword <> '');
    END;

    PROCEDURE SetPassword@1(PasswordText@1000 : Text);
    VAR
      ServicePassword@1002 : Record 1261;
    BEGIN
      IF ISNULLGUID("User Password Key") OR NOT ServicePassword.GET("User Password Key") THEN BEGIN
        ServicePassword.SavePassword(PasswordText);
        ServicePassword.INSERT(TRUE);
        "User Password Key" := ServicePassword.Key;
      END ELSE BEGIN
        ServicePassword.SavePassword(PasswordText);
        ServicePassword.MODIFY;
      END;
    END;

    PROCEDURE UpdateAllConnectionRegistrations@4();
    BEGIN
      UNREGISTERTABLECONNECTION(TABLECONNECTIONTYPE::CRM,GETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM));

      UnregisterConnection;
      IF "Is Enabled" THEN
        RegisterUserConnection;
    END;

    PROCEDURE UpdateIsEnabledState@34();
    BEGIN
      "Is User Mapped To CRM User" := IsCurrentUserMappedToCrmSystemUser;
      "Is Enabled For User" :=
        "Is Enabled" AND
        ((NOT "Is User Mapping Required") OR ("Is User Mapping Required" AND "Is User Mapped To CRM User"));
    END;

    LOCAL PROCEDURE UpdateODataUsernameAccesskey@43(User@1000 : Record 2000000120);
    VAR
      IdentityManagement@1001 : Codeunit 9801;
    BEGIN
      "Dynamics NAV OData Username" := User."User Name";
      "Dynamics NAV OData Accesskey" := IdentityManagement.GetWebServicesKey(User."User Security ID");

      CRMIntegrationManagement.SetCRMNAVODataUrlCredentials(
        "Dynamics NAV OData URL","Dynamics NAV OData Username","Dynamics NAV OData Accesskey");
    END;

    PROCEDURE RegisterConnection@17();
    BEGIN
      RegisterConnectionWithName("Primary Key");
    END;

    PROCEDURE RegisterConnectionWithName@12(ConnectionName@1000 : Text);
    BEGIN
      REGISTERTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName,ConstructConnectionString);
      SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName);
    END;

    PROCEDURE UnregisterConnection@5() : Boolean;
    BEGIN
      EXIT(UnregisterConnectionWithName("Primary Key"));
    END;

    [TryFunction]
    PROCEDURE UnregisterConnectionWithName@20(ConnectionName@1000 : Text);
    BEGIN
      UNREGISTERTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName);
    END;

    PROCEDURE ConstructConnectionString@3() : Text;
    BEGIN
      IF "User Name" = '' THEN
        EXIT(STRSUBSTNO(ConnectionStringFormatTok,"Server Address",MissingUsernameTok,MissingPasswordTok));

      EXIT(STRSUBSTNO(ConnectionStringFormatTok,"Server Address","User Name",GetPassword));
    END;

    LOCAL PROCEDURE ConstructConnectionStringWithCalledID@16(CallerID@1000 : Text) : Text;
    BEGIN
      EXIT(STRSUBSTNO(ConnectionWithCallerIdStringFormatTok,"Server Address","User Name",GetPassword,CallerID));
    END;

    PROCEDURE RegisterUserConnection@6();
    VAR
      User@1002 : Record 2000000120;
      CallerID@1001 : GUID;
    BEGIN
      RegisterConnection;

      IF NOT User.GET(DATABASE.USERSECURITYID) THEN
        EXIT;

      IF User."Authentication Email" <> '' THEN
        IF NOT TryGetSystemUserIdFromEmail(User."Authentication Email",CallerID) THEN
          IF "Is User Mapping Required" THEN
            ERROR(ThereIsNoCRMUserErr,User."Authentication Email");

      IF NOT ISNULLGUID(CallerID) THEN BEGIN
        UnregisterConnection;
        RegisterConnectionWithCallerID(CallerID);
      END ELSE
        IF "Is User Mapping Required" THEN
          UnregisterConnection;
    END;

    LOCAL PROCEDURE RegisterConnectionWithCallerID@11(CallerID@1000 : Text);
    BEGIN
      IF NOT "Is Enabled" THEN
        ERROR(CantRegisterDisabledConnectionErr);

      REGISTERTABLECONNECTION(TABLECONNECTIONTYPE::CRM,"Primary Key",ConstructConnectionStringWithCalledID(CallerID));
      IF "Primary Key" = '' THEN
        SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,"Primary Key");
    END;

    PROCEDURE GetIntegrationUserID@7() IntegrationUserID : GUID;
    VAR
      CRMConnectionSetup@1000 : Record 5330;
      CRMSystemuser@1001 : Record 5340;
    BEGIN
      CRMConnectionSetup.SETRANGE("Is Enabled",TRUE);
      CRMConnectionSetup.FINDFIRST;
      CRMSystemuser.SETRANGE(InternalEMailAddress,CRMConnectionSetup."User Name");
      IF CRMSystemuser.FINDFIRST THEN
        IntegrationUserID := CRMSystemuser.SystemUserId;
      IF ISNULLGUID(IntegrationUserID) THEN
        ERROR(CannotResolveUserFromConnectionSetupErr);
    END;

    LOCAL PROCEDURE GetPassword@2() : Text;
    VAR
      ServicePassword@1000 : Record 1261;
    BEGIN
      IF NOT ISNULLGUID("User Password Key") THEN
        IF ServicePassword.GET("User Password Key") THEN
          EXIT(ServicePassword.GetPassword);
    END;

    PROCEDURE PerformTestConnection@19();
    BEGIN
      VerifyTestConnection;

      IF "Is User Mapping Required" AND "Is Enabled" THEN
        IF NOT IsCurrentUserMappedToCrmSystemUser THEN BEGIN
          MESSAGE(ConnectionSuccessNotEnabledForCurrentUserMsg,USERID,PRODUCTNAME.SHORT);
          EXIT;
        END;

      MESSAGE(ConnectionSuccessMsg);
    END;

    PROCEDURE VerifyTestConnection@21() : Boolean;
    BEGIN
      IF ("Server Address" = '') OR ("User Name" = '') OR NOT HasPassword THEN
        ERROR(DetailsMissingErr);

      CRMIntegrationManagement.ClearState;

      IF NOT TestConnection THEN
        ERROR(ConnectionErr,CRMIntegrationManagement.GetLastErrorMessage);

      EXIT(TRUE);
    END;

    PROCEDURE TestConnection@9() Success : Boolean;
    VAR
      TestConnectionName@1000 : Text;
    BEGIN
      IF IsTestConnection THEN
        EXIT(TRUE);

      TestConnectionName := FORMAT(CREATEGUID);
      UnregisterConnectionWithName(TestConnectionName);
      RegisterConnectionWithName(TestConnectionName);
      SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,TestConnectionName,TRUE);
      Success := TryReadSystemUsers;

      UnregisterConnectionWithName(TestConnectionName);
    END;

    PROCEDURE IsTestConnection@22() : Boolean;
    BEGIN
      EXIT(STRPOS("Server Address",'@@') = 1);
    END;

    LOCAL PROCEDURE TryReadSystemUsers@14() : Boolean;
    VAR
      CRMSystemuser@1000 : Record 5340;
    BEGIN
      EXIT(CRMSystemuser.FINDFIRST);
    END;


    [TryFunction]
    PROCEDURE GetCrmVersion@15(VAR Version@1003 : Text);
    BEGIN
      IF IsTestConnection THEN
        EXIT;
      Version := '';
    END;

    PROCEDURE IsVersionValid@33() : Boolean;
    VAR
      Version@1000 : DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Version";
    BEGIN
      IF "CRM Version" <> '' THEN
        IF Version.TryParse("CRM Version",Version) THEN
          EXIT((Version.Major > 6) AND NOT ((Version.Major = 7) AND (Version.Minor = 1)));
      EXIT(FALSE);
    END;

    PROCEDURE IsCurrentUserMappedToCrmSystemUser@13() : Boolean;
    VAR
      User@1000 : Record 2000000120;
      CRMSystemUserId@1002 : GUID;
    BEGIN
      IF NOT User.GET(DATABASE.USERSECURITYID) THEN
        EXIT(FALSE);

      IF User."Authentication Email" = '' THEN
        EXIT(FALSE);

      EXIT(TryGetSystemUserIdFromEmail(User."Authentication Email",CRMSystemUserId));
    END;

    LOCAL PROCEDURE TryGetSystemUserIdFromEmail@18(EmailAddress@1000 : Text;VAR SystemUserId@1001 : GUID) : Boolean;
    VAR
      CRMSystemuser@1002 : Record 5340;
    BEGIN
      IF (NOT "Is Enabled") OR (NOT "Is User Mapping Required") THEN
        EXIT(FALSE);
      CRMSystemuser.SETRANGE(InternalEMailAddress,EmailAddress);
      IF CRMSystemuser.FINDFIRST THEN BEGIN
        SystemUserId := CRMSystemuser.SystemUserId;
        EXIT(TRUE);
      END;
      EXIT(FALSE);
    END;

    PROCEDURE UpdateFromWizard@23(VAR SourceCRMConnectionSetup@1001 : Record 5330;PasswordText@1002 : Text);
    VAR
      CRMConnectionSetup@1000 : Record 5330;
    BEGIN
      WITH CRMConnectionSetup DO BEGIN
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;
        VALIDATE("Server Address",SourceCRMConnectionSetup."Server Address");
        VALIDATE("User Name",SourceCRMConnectionSetup."User Name");
        SetPassword(PasswordText);
        MODIFY(TRUE);
      END;
    END;

    LOCAL PROCEDURE EnableCRMConnection@24();
    BEGIN
      IF "Is Enabled" = xRec."Is Enabled" THEN
        EXIT;

      IF NOT UnregisterConnection THEN
        CLEARLASTERROR;

      IF "Is Enabled" THEN BEGIN
        VerifyTestConnection;
        RegisterUserConnection;
        EnableIntegrationTables;
      END ELSE BEGIN
        "CRM Version" := '';
        "Is S.Order Integration Enabled" := FALSE;
        "Is CRM Solution Installed" := FALSE;
      END;
    END;

    LOCAL PROCEDURE EnableIntegrationTables@27();
    VAR
      IntegrationTableMapping@1003 : Record 5335;
      IntegrationRecord@1002 : Record 5151;
      IntegrationManagement@1001 : Codeunit 5150;
      CRMSetupDefaults@1000 : Codeunit 5334;
    BEGIN
      IF IntegrationTableMapping.ISEMPTY THEN
        CRMSetupDefaults.ResetConfiguration(Rec);
      IF IntegrationRecord.ISEMPTY THEN
        IntegrationManagement.SetupIntegrationTables;
      IntegrationManagement.SetConnectorIsEnabledForSession(TRUE);
    END;

    PROCEDURE EnableCRMConnectionFromWizard@25();
    VAR
      CRMConnectionSetup@1000 : Record 5330;
      CRMSystemuser@1001 : Record 5340;
    BEGIN
      CRMConnectionSetup.GET;
      CRMConnectionSetup.VALIDATE("Is Enabled",TRUE);
      CRMConnectionSetup.VALIDATE("Is User Mapping Required",FALSE);
      CRMConnectionSetup.MODIFY(TRUE);

      CRMSystemuser.SETRANGE(InternalEMailAddress,CRMConnectionSetup."User Name");
      CRMSystemuser.FINDFIRST;
      IF (CRMSystemuser.InviteStatusCode <> CRMSystemuser.InviteStatusCode::InvitationAccepted) OR
         (NOT CRMSystemuser.IsIntegrationUser)
      THEN BEGIN
        CRMSystemuser.InviteStatusCode := CRMSystemuser.InviteStatusCode::InvitationAccepted;
        CRMSystemuser.IsIntegrationUser := TRUE;
        CRMSystemuser.MODIFY(TRUE);
      END;
    END;

    PROCEDURE SetCRMSOPEnabled@37();
    VAR
      CRMOrganization@1000 : Record 5363;
      TempCRMConnectionSetup@1001 : TEMPORARY Record 5330;
      ConnectionName@1002 : Text;
    BEGIN
      CreateTempAdminConnection(TempCRMConnectionSetup);
      ConnectionName := FORMAT(CREATEGUID);
      TempCRMConnectionSetup.RegisterConnectionWithName(ConnectionName);
      SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName,TRUE);

      CRMOrganization.FINDFIRST;
      IF NOT CRMOrganization.IsSOPIntegrationEnabled THEN BEGIN
        CRMOrganization.IsSOPIntegrationEnabled := TRUE;
        CRMOrganization.MODIFY(TRUE);
      END;

      TempCRMConnectionSetup.UnregisterConnectionWithName(ConnectionName);
    END;

    PROCEDURE SetUserAsIntegrationUser@39();
    VAR
      CRMSystemuser@1000 : Record 5340;
      TempCRMConnectionSetup@1001 : TEMPORARY Record 5330;
      ConnectionName@1002 : Text;
    BEGIN
      CreateTempAdminConnection(TempCRMConnectionSetup);
      ConnectionName := FORMAT(CREATEGUID);
      TempCRMConnectionSetup.RegisterConnectionWithName(ConnectionName);
      SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName,TRUE);

      CRMSystemuser.SETRANGE(InternalEMailAddress,"User Name");
      CRMSystemuser.FINDFIRST;

      IF (CRMSystemuser.InviteStatusCode <> CRMSystemuser.InviteStatusCode::InvitationAccepted) OR
         (NOT CRMSystemuser.IsIntegrationUser)
      THEN BEGIN
        CRMSystemuser.InviteStatusCode := CRMSystemuser.InviteStatusCode::InvitationAccepted;
        CRMSystemuser.IsIntegrationUser := TRUE;
        CRMSystemuser.MODIFY(TRUE);
      END;

      TempCRMConnectionSetup.UnregisterConnectionWithName(ConnectionName);
    END;

    LOCAL PROCEDURE CreateTempAdminConnection@40(VAR CRMConnectionSetup@1000 : Record 5330);
    BEGIN
      CreateTempNoDelegateConnection(CRMConnectionSetup);
      CRMConnectionSetup."User Name" := '';
      CLEAR(CRMConnectionSetup."User Password Key");
    END;

    LOCAL PROCEDURE CreateTempNoDelegateConnection@41(VAR CRMConnectionSetup@1000 : Record 5330);
    BEGIN
      CRMConnectionSetup.INIT;
      CRMConnectionSetup.TRANSFERFIELDS(Rec);
      CRMConnectionSetup."Primary Key" := COPYSTR('TEMP' + "Primary Key",1,MAXSTRLEN(CRMConnectionSetup."Primary Key"));
      CRMConnectionSetup."Is Enabled" := TRUE;
      CRMConnectionSetup."Is User Mapping Required" := FALSE;
    END;

    PROCEDURE RefreshDataFromCRM@31();
    VAR
      TempCRMConnectionSetup@1000 : TEMPORARY Record 5330;
      ConnectionName@1001 : Text;
    BEGIN
      IF "Is Enabled" THEN BEGIN
        IF "Is User Mapping Required" THEN BEGIN
          CreateTempNoDelegateConnection(TempCRMConnectionSetup);
          ConnectionName := FORMAT(CREATEGUID);
          TempCRMConnectionSetup.RegisterConnectionWithName(ConnectionName);
          SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName,TRUE);

          "Is User Mapped To CRM User" := IsCurrentUserMappedToCrmSystemUser;
        END;

        "Is CRM Solution Installed" := CRMIntegrationManagement.IsCRMSolutionInstalled;
        RefreshFromCRMConnectionInformation;
        IF TryRefreshCRMSettings THEN;

        IF ConnectionName <> '' THEN
          TempCRMConnectionSetup.UnregisterConnectionWithName(ConnectionName);
      END;
    END;

    LOCAL PROCEDURE RefreshFromCRMConnectionInformation@29();
    VAR
      CRMNAVConnection@1001 : Record 5368;
    BEGIN
      IF "Is CRM Solution Installed" THEN
        IF CRMNAVConnection.FINDFIRST THEN BEGIN
          "Dynamics NAV URL" := CRMNAVConnection."Dynamics NAV URL";
          "Dynamics NAV OData URL" := CRMNAVConnection."Dynamics NAV OData URL";
          "Dynamics NAV OData Username" := CRMNAVConnection."Dynamics NAV OData Username";
          "Dynamics NAV OData Accesskey" := CRMNAVConnection."Dynamics NAV OData Accesskey";
        END;
    END;

    [TryFunction]
    LOCAL PROCEDURE TryRefreshCRMSettings@26();
    VAR
      CRMOrganization@1001 : Record 5363;
    BEGIN
      GetCrmVersion("CRM Version");
      VALIDATE("CRM Version");

      IF CRMOrganization.FINDFIRST THEN
        "Is S.Order Integration Enabled" := CRMOrganization.IsSOPIntegrationEnabled
      ELSE
        "Is S.Order Integration Enabled" := FALSE;
    END;

    PROCEDURE PerformWebClientUrlReset@32();
    VAR
      TempCRMConnectionSetup@1000 : TEMPORARY Record 5330;
      CRMSetupDefaults@1002 : Codeunit 5334;
      ConnectionName@1001 : Text;
    BEGIN
      CreateTempNoDelegateConnection(TempCRMConnectionSetup);
      ConnectionName := FORMAT(CREATEGUID);
      TempCRMConnectionSetup.RegisterConnectionWithName(ConnectionName);
      SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM,ConnectionName,TRUE);

      CRMSetupDefaults.ResetCRMNAVConnectionData;

      TempCRMConnectionSetup.UnregisterConnectionWithName(ConnectionName);

      RefreshDataFromCRM;
    END;

    PROCEDURE PerformInitialSynch@38();
    VAR
      JobQueueEntry@1000 : Record 472;
      IntegrationTableMapping@1001 : Record 5335;
      TempActiveQueuesNameValueBuffer@1002 : TEMPORARY Record 823;
      TempCoupledOnlyMappingsNameValueBuffer@1003 : TEMPORARY Record 823;
      IntegrationSynchJobList@1004 : Page 5338;
    BEGIN
      JobQueueEntry.SETRANGE("Object ID to Run",CODEUNIT::"Integration Synch. Job Runner");
      JobQueueEntry.SETRANGE(Status,JobQueueEntry.Status::Ready);
      IF JobQueueEntry.FINDSET THEN
        REPEAT
          TempActiveQueuesNameValueBuffer.AddNewEntry(JobQueueEntry.ID,'');
        UNTIL JobQueueEntry.NEXT = 0;
      JobQueueEntry.MODIFYALL(Status,JobQueueEntry.Status::"On Hold",TRUE);

      IntegrationTableMapping.SETRANGE("Parent Name",'''''');
      IntegrationTableMapping.SETRANGE("Synch. Only Coupled Records",TRUE);
      IF IntegrationTableMapping.FINDSET THEN
        REPEAT
          TempCoupledOnlyMappingsNameValueBuffer.AddNewEntry(IntegrationTableMapping.Name,'');
        UNTIL IntegrationTableMapping.NEXT = 0;
      IntegrationTableMapping.MODIFYALL("Synch. Only Coupled Records",FALSE,TRUE);

      SynchronizeNow(TRUE);

      IF NOT CONFIRM(STRSUBSTNO(AllowNewUncoupledItemsToBeSynchronizedQst,IntegrationSynchJobList.CAPTION)) THEN
        IF TempCoupledOnlyMappingsNameValueBuffer.FINDSET THEN
          REPEAT
            IntegrationTableMapping.GET(TempCoupledOnlyMappingsNameValueBuffer.Name);
            IntegrationTableMapping."Synch. Only Coupled Records" := TRUE;
            IntegrationTableMapping.MODIFY(TRUE);
          UNTIL TempCoupledOnlyMappingsNameValueBuffer.NEXT = 0;

      IF TempActiveQueuesNameValueBuffer.FINDSET THEN
        REPEAT
          JobQueueEntry.GET(TempActiveQueuesNameValueBuffer.Name);
          JobQueueEntry.SetStatus(JobQueueEntry.Status::Ready);
        UNTIL TempActiveQueuesNameValueBuffer.NEXT = 0;
    END;

    PROCEDURE SynchronizeNow@44(DoFullSynch@1000 : Boolean);
    VAR
      IntegrationTableMapping@1006 : Record 5335;
      TempNameValueBuffer@1005 : TEMPORARY Record 823;
      CRMSetupDefaults@1004 : Codeunit 5334;
      ProgressWindow@1003 : Dialog;
      MappingCount@1002 : Integer;
      CurrentMappingIndex@1001 : Integer;
    BEGIN
      CRMSetupDefaults.GetPrioritizedMappingList(TempNameValueBuffer);
      TempNameValueBuffer.ASCENDING(TRUE);
      TempNameValueBuffer.FINDSET;

      CurrentMappingIndex := 0;
      MappingCount := TempNameValueBuffer.COUNT;
      ProgressWindow.OPEN(ProcessDialogMapTitleMsg,CurrentMappingIndex);
      REPEAT
        CurrentMappingIndex := CurrentMappingIndex + 1;
        ProgressWindow.UPDATE(1,ROUND(CurrentMappingIndex / MappingCount * 10000,1));
        IF IntegrationTableMapping.GET(TempNameValueBuffer.Value) THEN
          IntegrationTableMapping.SynchronizeNow(DoFullSynch);
      UNTIL TempNameValueBuffer.NEXT = 0;
      ProgressWindow.CLOSE;
    END;

    BEGIN
    END.
  }
}
```

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2016 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2016-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
