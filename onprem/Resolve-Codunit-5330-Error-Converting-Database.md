---
title: "Codeunit 5330 CRM Integration Management Error When Converting to Dynamics NAV 2018"
description: "Explains how to resolve the compilation error that you get for Codeunit 5330 CRM Integration Management when converting a database from Dynamics NAV 2017 to 2018."
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
## Resolving Codeunit 5330 CRM Integration Management Compilation Error 
This article explains how to resolve the compilation error that you get for Codeunit **5330 CRM Integration Management** when converting a [!INCLUDE[nav2017](includes/navcorfu_md.md)] database to [!INCLUDE[nav2018_md](includes/nav2018_md.md)].

To resolve this error, you can update Codeunit **5330 CRM Integration Management** in the converted database to support the latest platform changes by replacing its code with the code that follows: 

1. Copy the code to a text editor, and save it as a .txt file type.
2. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to import and compile the file to the converted database.

> [!NOTE]  
>  If the Codeunit **5330 CRM Integration Management** object in your database includes custom code, then you might have to resolve conflicts with your custom code.

```
OBJECT Codeunit 5330 CRM Integration Management
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    SingleInstance=Yes;
    OnRun=BEGIN
            CheckOrEnableCRMConnection;
          END;

  }
  CODE
  {
    VAR
      CRMEntityUrlTemplateTxt@1001 : TextConst '@@@={Locked};ENU="%1/main.aspx?pagetype=entityrecord&etn=%2&id=%3"';
      UnableToResolveCRMEntityNameFrmTableIDErr@1002 : TextConst '@@@="%1 = table ID (numeric)";ENU=The application is not designed to integrate Table %1 with Dynamics CRM.';
      CouplingNotFoundErr@1000 : TextConst 'ENU=The record is not coupled to Microsoft Dynamics CRM.';
      NoCardPageActionDefinedForTableIdErr@1022 : TextConst '@@@="%1 = Table ID";ENU=The open page action is not supported for Table %1.';
      IntegrationTableMappingNotFoundErr@1005 : TextConst '@@@="%1 = Integration Table Mapping caption, %2 = Table caption for the table which is not mapped";ENU=No %1 was found for table %2.';
      UpdateNowDirectionQst@1006 : TextConst '@@@=String menu options separated by comma.;ENU=Send data update to Dynamics CRM.,Get data update from Dynamics CRM.';
      UpdateOneNowTitleTxt@1007 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Synchronize data for %1?';
      UpdateMultipleNowTitleTxt@1014 : TextConst 'ENU=Synchronize data for the selected records?';
      UpdateNowFailedIgnoreDestinationChangesQst@1009 : TextConst '@@@=%1 the error message;ENU=The synchronization failed.\\%1. \\Do you want to ignore the destination changes and try the synchronization again?';
      UpdateNowFailedErr@1010 : TextConst '@@@=%1 Error message;ENU=The synchronization failed because of the following error:\\%1.';
      ManageCouplingQst@1003 : TextConst '@@@="%1=The record caption (type)";ENU=The %1 record is not coupled to Microsoft Dynamics CRM. Do you want to create a coupling?';
      SyncNowSuccessMsg@1016 : TextConst 'ENU=Synchronization completed.';
      SynchronizedMsg@1012 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were successfully synchronized.';
      UncoupledSkippedMsg@1013 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were not synchronized because they are not coupled.';
      NewerSkippedMsg@1034 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were not synchronized because their destination contains newer data.';
      FailedSynchronizationsMsg@1015 : TextConst '@@@=%1 and %2 are numbers, %3 is the name of the error log page;ENU=%1 of %2 records were not synchronized because of errors.\\For more information, see the %3 page.';
      CreationCompleteMsg@1026 : TextConst 'ENU=Creation of the selected records in Microsoft Dynamics CRM completed.';
      CreatedMsg@1027 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were successfully created.';
      CoupledSkippedMsg@1028 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were skipped because they are already coupled.';
      UpdateOneNowToCRMQst@1017 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Send data update to Dynamics CRM for %1?';
      UpdateOneNowToModifiedCRMQst@1033 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now. %2 - product name";ENU=The Dynamics CRM record coupled to %1 contains newer data than the %2 record. Do you want to overwrite the data in Dynamics CRM?';
      UpdateOneNowFromCRMQst@1018 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Get data update from Dynamics CRM for %1?';
      UpdateOneNowFromOldCRMQst@1011 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now. %2 - product name";ENU=The %2 record %1 contains newer data than the Dynamics CRM record. Get data update from Dynamics CRM, overwriting data in %2?';
      UpdateMultipleNowToCRMQst@1019 : TextConst 'ENU=Send data update to Dynamics CRM for the selected records?';
      UpdateMultipleNowFromCRMQst@1020 : TextConst 'ENU=Get data update from Dynamics CRM for the selected records?';
      TextManagement@1023 : Codeunit 41;
      AccountStatisticsUpdatedMsg@1024 : TextConst 'ENU=The customer statistics have been successfully updated in Microsoft Dynamics CRM.';
      BothRecordsModifiedBiDirectionalMsg@1029 : TextConst '@@@=%1 and %2 area captions of tables such as Customer and CRM Account;ENU=Both the %1 record and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data on one of the records will be lost and replaced with data from the other record.';
      BothRecordsModifiedToCRMQst@1030 : TextConst '@@@=%1 is a formatted RecordID, such as ''Customer 1234''. %2 is the caption of a CRM table. %3 - product name;ENU=Both %1 and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data in Microsoft Dynamics CRM will be overwritten with data from %3. Are you sure you want to synchronize?';
      BothRecordsModifiedToNAVQst@1031 : TextConst '@@@=%1 is a formatted RecordID, such as ''Customer 1234''. %2 is the caption of a CRM table. %3 - product name;ENU=Both %1 and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data in %3 will be overwritten with data from Microsoft Dynamics CRM. Are you sure you want to synchronize?';
      RecordAlreadyCoupledCreateNewQst@1032 : TextConst '@@@="%1 = RecordID (translated table caption and primary key value, such as Customer 1234)";ENU=%1 is already coupled to a record in Microsoft Dynamics CRM. Do you want to create a new copy and couple to it?';
      CRMRecordAlreadyCoupledCreateNewQst@1008 : TextConst '@@@=%1 - product name;ENU=The Microsoft Dynamics CRM record is already coupled to a record in %1. Do you want to create a new copy and couple to it, replacing the old coupling?';
      CRMIntegrationEnabledState@1021 : ' ,Not Enabled,Enabled,Enabled But Not For Current User';
      DoYouWantToEnableCRMQst@1025 : TextConst '@@@="%1 = CRM Connection Setup";ENU=Dynamics CRM Integration is not enabled.\\Do you want to open the %1 window?';
      NotEnabledForCurrentUserMsg@1035 : TextConst '@@@="%1 = Current User Id %2 - product name";ENU=Dynamics CRM Integration is enabled.\However, because the %2 Users Must Map to Dynamics CRM Users field is set, Dynamics CRM integration is not enabled for %1.';
      CRMIntegrationEnabledLastError@1036 : Text;
      ImportSolutionConnectStringTok@1039 : TextConst '@@@={Locked};ENU=%1api%2/XRMServices/2011/Organization.svc';
      UserDoesNotExistCRMTxt@1042 : TextConst '@@@="%1 = User email address";ENU=There is no user with email address %1 in Dynamics CRM. Enter a valid email address.';
      RoleIdDoesNotExistCRMTxt@1043 : TextConst 'ENU=The Integration role does not exist in Dynamics CRM. \\Make sure the relevant customization is imported or check if the name of the role has changed.';
      EmailAndServerAddressEmptyErr@1046 : TextConst 'ENU=The Integration User Email and Server Address fields must not be empty.';
      CRMSolutionFileNotFoundErr@1041 : TextConst 'ENU=A file for a CRM solution could not be found.';
      MicrosoftDynamicsNavIntegrationTxt@1040 : TextConst '@@@={Locked};ENU=MicrosoftDynamicsNavIntegration';
      AdminEmailPasswordWrongErr@1044 : TextConst 'ENU=Enter valid CRM administrator credentials.';
      AdminUserDoesNotHavePriviligesErr@1045 : TextConst 'ENU=The specified CRM administrator does not have sufficient privileges to import a CRM solution.';
      InvalidUriErr@1050 : TextConst 'ENU=The value entered is not a valid URL.';
      MustUseHttpsErr@1049 : TextConst 'ENU=The application is set up to support secure connections (HTTPS) to Dynamics CRM only. You cannot use HTTP.';
      MustUseHttpOrHttpsErr@1048 : TextConst '@@@=%1 is a URI scheme, such as FTP, HTTP, chrome or file;ENU=%1 is not a valid URI scheme for Dynamics CRM connections. You can only use HTTPS or HTTP as the scheme in the URL.';
      ReplaceServerAddressQst@1047 : TextConst '@@@=%1 and %2 are URLs;ENU=The URL is not valid. Do you want to replace it with the URL suggested below?\\Entered URL: "%1".\Suggested URL: "%2".';
      CRMConnectionURLWrongErr@1051 : TextConst 'ENU=The URL is incorrect. Enter the URL for the Dynamics CRM connection.';
      UserHasNoSecurityRolesErr@1052 : TextConst '@@@="%1 = User email address";ENU=The user with email address %1 must have at least one security role in Dynamics CRM.';

    PROCEDURE IsCRMIntegrationEnabled@5() : Boolean;
    VAR
      CRMConnectionSetup@1000 : Record 5330;
    BEGIN
      IF CRMIntegrationEnabledState = CRMIntegrationEnabledState::" " THEN BEGIN
        CLEARLASTERROR;
        CRMIntegrationEnabledState := CRMIntegrationEnabledState::"Not Enabled";
        CLEAR(CRMIntegrationEnabledLastError);
        IF CRMConnectionSetup.GET THEN
          IF CRMConnectionSetup."Is Enabled" THEN BEGIN
            IF NOT CRMConnectionSetup."Is User Mapping Required" THEN
              CRMIntegrationEnabledState := CRMIntegrationEnabledState::Enabled
            ELSE
              IF CRMConnectionSetup.IsCurrentUserMappedToCrmSystemUser THEN
                CRMIntegrationEnabledState := CRMIntegrationEnabledState::Enabled
              ELSE BEGIN
                CRMIntegrationEnabledState := CRMIntegrationEnabledState::"Enabled But Not For Current User";
                CRMIntegrationEnabledLastError := GetLastErrorMessage;
              END;

            IF NOT HASTABLECONNECTION(TABLECONNECTIONTYPE::CRM,GETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM)) THEN
              CRMConnectionSetup.RegisterUserConnection;
          END;
      END;

      EXIT(CRMIntegrationEnabledState = CRMIntegrationEnabledState::Enabled);
    END;

    PROCEDURE IsCRMSolutionInstalled@19() : Boolean;
    BEGIN
      IF TryTouchCRMSolutionEntities THEN
        EXIT(TRUE);

      CLEARLASTERROR;
      EXIT(FALSE);
    END;

    [TryFunction]
    LOCAL PROCEDURE TryTouchCRMSolutionEntities@27();
    VAR
      CRMNAVConnection@1001 : Record 5368;
      CRMAccountStatistics@1000 : Record 5367;
    BEGIN
      IF CRMAccountStatistics.FINDFIRST THEN;
      IF CRMNAVConnection.FINDFIRST THEN;
    END;

    PROCEDURE SetCRMNAVConnectionUrl@38(WebClientUrl@1000 : Text[250]);
    VAR
      CRMNAVConnection@1002 : Record 5368;
      NewConnection@1001 : Boolean;
    BEGIN
      IF NOT CRMNAVConnection.FINDFIRST THEN BEGIN
        CRMNAVConnection.INIT;
        NewConnection := TRUE;
      END;

      CRMNAVConnection."Dynamics NAV URL" := WebClientUrl;

      IF NewConnection THEN
        CRMNAVConnection.INSERT
      ELSE
        CRMNAVConnection.MODIFY;
    END;

    PROCEDURE SetCRMNAVODataUrlCredentials@48(ODataUrl@1000 : Text[250];Username@1003 : Text[250];Accesskey@1004 : Text[250]);
    VAR
      CRMNAVConnection@1002 : Record 5368;
      NewConnection@1001 : Boolean;
    BEGIN
      IF NOT CRMNAVConnection.FINDFIRST THEN BEGIN
        CRMNAVConnection.INIT;
        NewConnection := TRUE;
      END;

      CRMNAVConnection."Dynamics NAV OData URL" := ODataUrl;
      CRMNAVConnection."Dynamics NAV OData Username" := Username;
      CRMNAVConnection."Dynamics NAV OData Accesskey" := Accesskey;

      IF NewConnection THEN
        CRMNAVConnection.INSERT
      ELSE
        CRMNAVConnection.MODIFY;
    END;

    PROCEDURE UpdateMultipleNow@14(VAR RecRef@1007 : RecordRef);
    VAR
      IntegrationTableMapping@1001 : Record 5335;
      IntegrationRecSynchInvoke@1014 : Codeunit 5345;
      IntegrationSynchErrorList@1002 : Page 5339;
      CRMRecordRef@1005 : RecordRef;
      SelectedDirection@1003 : Integer;
      CRMID@1000 : GUID;
      NumUnCoupledRecords@1009 : Integer;
      NumNewerDataFailedSynchronizations@1010 : Integer;
      NumErrorFailedSynchronizations@1012 : Integer;
      NumSucceededSynchronizations@1013 : Integer;
      SuccessMsg@1011 : Text;
      RecordModified@1006 : Boolean;
      CRMRecordModified@1008 : Boolean;
      Unused@1004 : Boolean;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      GetIntegrationTableMapping(IntegrationTableMapping,RecRef.RECORDID.TABLENO);

      SelectedDirection := GetSelectedSyncDirection(RecRef.RECORDID,CRMID,TRUE,Unused);
      IF SelectedDirection < 1 THEN
        EXIT; // The user cancelled

      REPEAT
        IF NOT GetCoupledCRMID(RecRef.RECORDID,CRMID,TRUE) THEN
          NumUnCoupledRecords := NumUnCoupledRecords + 1
        ELSE BEGIN
          // Determine which sides were modified since last synch
          IntegrationTableMapping.GetRecordRef(CRMID,CRMRecordRef);
          RecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,RecRef);
          CRMRecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,CRMRecordRef);
          IF ((SelectedDirection = IntegrationTableMapping.Direction::ToIntegrationTable) AND CRMRecordModified) OR
             ((SelectedDirection = IntegrationTableMapping.Direction::FromIntegrationTable) AND RecordModified)
          THEN
            NumNewerDataFailedSynchronizations := NumNewerDataFailedSynchronizations + 1
          ELSE
            IF UpdateOne(IntegrationTableMapping,RecRef.RECORDID,CRMID,SelectedDirection,TRUE,FALSE,FALSE) THEN
              NumSucceededSynchronizations := NumSucceededSynchronizations + 1
            ELSE
              NumErrorFailedSynchronizations := NumErrorFailedSynchronizations + 1;
        END;
      UNTIL RecRef.NEXT = 0;

      SuccessMsg := SyncNowSuccessMsg;
      SuccessMsg := SuccessMsg + '\'; // At least one of the three below is always the case
      IF NumSucceededSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(SynchronizedMsg,NumSucceededSynchronizations,RecRef.COUNT));
      IF NumUnCoupledRecords > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(UncoupledSkippedMsg,NumUnCoupledRecords,RecRef.COUNT));
      IF NumNewerDataFailedSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(NewerSkippedMsg,NumNewerDataFailedSynchronizations,RecRef.COUNT));
      IF NumErrorFailedSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,
            STRSUBSTNO(FailedSynchronizationsMsg,NumErrorFailedSynchronizations,RecRef.COUNT,IntegrationSynchErrorList.CAPTION));

      MESSAGE(SuccessMsg);
    END;

    PROCEDURE UpdateOneNow@17(RecordID@1000 : RecordID);
    VAR
      IntegrationTableMapping@1003 : Record 5335;
      SelectedDirection@1001 : Integer;
      CRMID@1005 : GUID;
      RecommendedDirectionIgnored@1002 : Boolean;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);

      IF NOT GetCoupledCRMID(RecordID,CRMID,TRUE) THEN BEGIN
        GetCoupledCRMID(RecordID,CRMID,FALSE);
        EXIT;
      END;

      SelectedDirection := GetSelectedSyncDirection(RecordID,CRMID,FALSE,RecommendedDirectionIgnored);

      IF SelectedDirection = 0 THEN
        EXIT; // The user cancelled

      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,SelectedDirection,FALSE,NOT RecommendedDirectionIgnored,FALSE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    PROCEDURE CheckOrEnableCRMConnection@23();
    VAR
      CRMConnectionSetup@1000 : Page 5330;
    BEGIN
      IF IsCRMIntegrationEnabled THEN
        EXIT;

      IF CRMIntegrationEnabledLastError <> '' THEN
        ERROR(CRMIntegrationEnabledLastError);

      IF CRMIntegrationEnabledState = CRMIntegrationEnabledState::"Enabled But Not For Current User" THEN
        MESSAGE(NotEnabledForCurrentUserMsg,USERID,PRODUCTNAME.SHORT)
      ELSE
        IF CONFIRM(DoYouWantToEnableCRMQst,TRUE,CRMConnectionSetup.CAPTION) THEN
          PAGE.RUN(PAGE::"CRM Connection Setup");

      ERROR('');
    END;

    PROCEDURE CreateNewRecordInCRM@25(RecordID@1000 : RecordID;ConfirmBeforeDeletingExistingCoupling@1003 : Boolean);
    VAR
      IntegrationTableMapping@1004 : Record 5335;
      CRMCouplingManagement@1001 : Codeunit 5331;
      CRMID@1002 : GUID;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);
      GetCoupledCRMID(RecordID,CRMID,TRUE);
      IF NOT ISNULLGUID(CRMID) THEN BEGIN
        IF ConfirmBeforeDeletingExistingCoupling THEN
          IF NOT CONFIRM(RecordAlreadyCoupledCreateNewQst,FALSE,FORMAT(RecordID,0,1)) THEN
            EXIT;
        CRMCouplingManagement.RemoveCoupling(RecordID)
      END;
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::ToIntegrationTable,FALSE,TRUE,TRUE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    PROCEDURE CreateNewRecordsInCRM@22(RecRef@1000 : RecordRef);
    VAR
      IntegrationTableMapping@1002 : Record 5335;
      CRMID@1001 : GUID;
      NumCoupledRecords@1005 : Integer;
      NumSuccessfulCreations@1004 : Integer;
      NumFailedCreations@1003 : Integer;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      GetIntegrationTableMapping(IntegrationTableMapping,RecRef.RECORDID.TABLENO);

      // Perform the coupling, counting different kinds of success and failure
      REPEAT
        IF GetCoupledCRMID(RecRef.RECORDID,CRMID,TRUE) THEN
          NumCoupledRecords := NumCoupledRecords + 1
        ELSE
          IF UpdateOne(IntegrationTableMapping,RecRef.RECORDID,CRMID,
               IntegrationTableMapping.Direction::ToIntegrationTable,TRUE,TRUE,TRUE)
          THEN
            NumSuccessfulCreations := NumSuccessfulCreations + 1
          ELSE
            NumFailedCreations := NumFailedCreations + 1;
      UNTIL RecRef.NEXT = 0;

      // Report what happened
      ShowCreationFinishedMessage(RecRef.COUNT,NumSuccessfulCreations,NumCoupledRecords,NumFailedCreations);
    END;

    PROCEDURE CreateNewRecordFromCRM@1(CRMID@1001 : GUID;TableID@1003 : Integer);
    VAR
      IntegrationTableMapping@1000 : Record 5335;
      CRMIntegrationRecord@1002 : Record 5331;
      CRMCouplingManagement@1005 : Codeunit 5331;
      RecordID@1004 : RecordID;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,TableID);
      IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableID,RecordID) THEN
        IF NOT CRMIntegrationRecord.DeleteIfRecordDeleted(CRMID,TableID) THEN
          IF CONFIRM(STRSUBSTNO(CRMRecordAlreadyCoupledCreateNewQst,PRODUCTNAME.FULL)) THEN
            CRMCouplingManagement.RemoveCoupling(RecordID)
          ELSE
            EXIT;
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::FromIntegrationTable,FALSE,TRUE,TRUE) THEN BEGIN
        CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableID,RecordID);
        OpenRecordCardPage(RecordID);
      END;
    END;

    PROCEDURE CreateNewRecordsFromCRM@15(RecRef@1000 : RecordRef);
    VAR
      IntegrationTableMapping@1002 : Record 5335;
      CRMIntegrationRecord@1005 : Record 5331;
      RecordID@1006 : RecordID;
      CRMID@1003 : GUID;
      NumCoupledRecords@1004 : Integer;
      NumSuccessfulCreations@1007 : Integer;
      NumFailedCreations@1008 : Integer;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      // Make sure this kind of record can be coupled
      IntegrationTableMapping.SETRANGE("Synch. Codeunit ID",CODEUNIT::"CRM Integration Table Synch.");
      IntegrationTableMapping.SETRANGE("Integration Table ID",RecRef.RECORDID.TABLENO);
      IF NOT IntegrationTableMapping.FINDFIRST THEN
        ERROR(IntegrationTableMappingNotFoundErr,IntegrationTableMapping.TABLECAPTION,RecRef.CAPTION);

      // Perform the coupling, counting different kinds of success and failure
      REPEAT
        CRMID := RecRef.FIELD(IntegrationTableMapping."Integration Table UID Fld. No.").VALUE;
        IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,IntegrationTableMapping."Table ID",RecordID) THEN BEGIN
          IF NOT CRMIntegrationRecord.DeleteIfRecordDeleted(CRMID,IntegrationTableMapping."Table ID")
          THEN
            NumCoupledRecords := NumCoupledRecords + 1
        END ELSE
          IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::FromIntegrationTable,TRUE,TRUE,TRUE) THEN
            NumSuccessfulCreations := NumSuccessfulCreations + 1
          ELSE
            NumFailedCreations := NumFailedCreations + 1;
      UNTIL RecRef.NEXT = 0;

      // Report what happened
      ShowCreationFinishedMessage(RecRef.COUNT,NumSuccessfulCreations,NumCoupledRecords,NumFailedCreations);
    END;

    LOCAL PROCEDURE ShowCreationFinishedMessage@26(NumRecords@1001 : Integer;NumSuccessfulCreations@1000 : Integer;NumCoupledRecords@1002 : Integer;NumFailedCreations@1003 : Integer);
    VAR
      IntegrationSynchErrorList@1005 : Page 5339;
      FinishMsg@1004 : Text;
    BEGIN
      FinishMsg := CreationCompleteMsg;
      FinishMsg := FinishMsg + '\';
      IF NumSuccessfulCreations > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,STRSUBSTNO(CreatedMsg,NumSuccessfulCreations,NumRecords));
      IF NumCoupledRecords > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,STRSUBSTNO(CoupledSkippedMsg,NumCoupledRecords,NumRecords));
      IF NumFailedCreations > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,
            STRSUBSTNO(FailedSynchronizationsMsg,NumFailedCreations,NumRecords,IntegrationSynchErrorList.CAPTION));
      MESSAGE(FinishMsg);
    END;

    LOCAL PROCEDURE PerformInitialSynchronization@16(RecordID@1000 : RecordID;CRMID@1002 : GUID;Direction@1001 : Option);
    VAR
      IntegrationTableMapping@1005 : Record 5335;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,Direction,FALSE,TRUE,FALSE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    LOCAL PROCEDURE GetIntegrationTableMapping@9(VAR IntegrationTableMapping@1001 : Record 5335;TableID@1000 : Integer);
    VAR
      TableMetadata@1002 : Record 2000000136;
    BEGIN
      IntegrationTableMapping.SETRANGE("Synch. Codeunit ID",CODEUNIT::"CRM Integration Table Synch.");
      IntegrationTableMapping.SETRANGE("Table ID",TableID);
      IF NOT IntegrationTableMapping.FINDFIRST THEN BEGIN
        TableMetadata.GET(TableID);
        ERROR(IntegrationTableMappingNotFoundErr,IntegrationTableMapping.TABLECAPTION,TableMetadata.Caption);
      END;
    END;

    LOCAL PROCEDURE UpdateOne@11(IntegrationTableMapping@1007 : Record 5335;RecordID@1000 : RecordID;CRMID@1012 : GUID;Direction@1001 : Integer;MultipleRecords@1002 : Boolean;IgnoreChanges@1003 : Boolean;IgnoreSynchOnlyCoupledRecords@1004 : Boolean) : Boolean;
    VAR
      IntegrationSynchJob@1008 : Record 5338;
      IntegrationSynchJobErrors@1009 : Record 5339;
      CRMIntegrationTableSynch@1006 : Codeunit 5340;
      LogId@1005 : GUID;
      ErrorMessage@1010 : Text;
    BEGIN
      IF Direction = IntegrationTableMapping.Direction::FromIntegrationTable THEN
        LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,CRMID,IgnoreChanges,IgnoreSynchOnlyCoupledRecords)
      ELSE
        LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,RecordID,IgnoreChanges,IgnoreSynchOnlyCoupledRecords);

      IntegrationSynchJob.GET(LogId);
      IF IntegrationSynchJob.Failed > 0 THEN BEGIN
        ErrorMessage := IntegrationSynchJob.Message;
        IntegrationSynchJobErrors.SETRANGE("Integration Synch. Job ID",IntegrationSynchJob.ID);
        IF IntegrationSynchJobErrors.FINDFIRST THEN
          ErrorMessage := ErrorMessage + ' ' + IntegrationSynchJobErrors.Message;

        IF MultipleRecords THEN
          EXIT(FALSE);

        IF IgnoreChanges THEN
          ERROR(UpdateNowFailedErr,TextManagement.RemoveMessageTrailingDots(ErrorMessage));

        IF NOT CONFIRM(UpdateNowFailedIgnoreDestinationChangesQst,FALSE,TextManagement.RemoveMessageTrailingDots(ErrorMessage)) THEN
          EXIT(FALSE);

        IF Direction = IntegrationTableMapping.Direction::FromIntegrationTable THEN
          LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,CRMID,TRUE,IgnoreSynchOnlyCoupledRecords)
        ELSE
          LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,RecordID,TRUE,IgnoreSynchOnlyCoupledRecords);
        IntegrationSynchJob.GET(LogId);
      END;

      IF IntegrationSynchJob.Failed > 0 THEN BEGIN
        IntegrationSynchJobErrors.SETRANGE("Integration Synch. Job ID",IntegrationSynchJob.ID);
        ErrorMessage := IntegrationSynchJob.Message;
        IF IntegrationSynchJobErrors.FINDFIRST THEN
          ErrorMessage := ErrorMessage + ' ' + IntegrationSynchJobErrors.Message;
        ERROR(UpdateNowFailedErr,TextManagement.RemoveMessageTrailingDots(ErrorMessage));
      END;

      EXIT(TRUE);
    END;

    PROCEDURE CreateOrUpdateCRMAccountStatistics@20(Customer@1000 : Record 18);
    VAR
      CRMAccount@1004 : Record 5341;
      CRMStatisticsJob@1005 : Codeunit 5350;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT;

      CRMAccount.GET(CRMID);
      CRMStatisticsJob.CreateOrUpdateCRMAccountStatistics(Customer,CRMAccount);
      MESSAGE(AccountStatisticsUpdatedMsg);
    END;

    PROCEDURE ShowCRMEntityFromRecordID@8(RecordID@1000 : RecordID);
    VAR
      CRMID@1001 : GUID;
    BEGIN
      IF NOT GetCoupledCRMID(RecordID,CRMID,FALSE) THEN
        EXIT;

      HYPERLINK(GetCRMEntityUrlFromRecordID(RecordID));
    END;

    PROCEDURE GetCRMEntityUrlFromRecordID@4(TargetRecordID@1000 : RecordID) : Text;
    VAR
      CRMIntegrationRecord@1001 : Record 5331;
      IntegrationRecord@1005 : Record 5151;
      CRMId@1004 : GUID;
    BEGIN
      IF NOT CRMIntegrationRecord.FindIDFromRecordID(TargetRecordID,CRMId) THEN
        ERROR(CouplingNotFoundErr);

      IntegrationRecord.FindByRecordId(TargetRecordID);
      EXIT(GetCRMEntityUrlFromCRMID(IntegrationRecord."Table ID",CRMId));
    END;

    PROCEDURE GetCRMEntityUrlFromCRMID@6(TableId@1001 : Integer;CRMId@1006 : GUID) : Text;
    VAR
      CRMConnectionSetup@1003 : Record 5330;
    BEGIN
      CRMConnectionSetup.GET;
      EXIT(STRSUBSTNO(CRMEntityUrlTemplateTxt,CRMConnectionSetup."Server Address",GetCRMEntityTypeName(TableId),CRMId));
    END;

    PROCEDURE OpenCoupledNavRecordPage@35(CRMID@1000 : GUID;CRMEntityTypeName@1012 : Text) : Boolean;
    VAR
      CRMIntegrationRecord@1001 : Record 5331;
      TempNameValueBuffer@1013 : TEMPORARY Record 823;
      CRMSetupDefaults@1014 : Codeunit 5334;
      RecordID@1008 : RecordID;
      TableId@1002 : Integer;
    BEGIN
      // Find the corresponding NAV record and type
      CRMSetupDefaults.GetTableIDCRMEntityNameMapping(TempNameValueBuffer);
      TempNameValueBuffer.SETRANGE(Name,LOWERCASE(CRMEntityTypeName));
      IF NOT TempNameValueBuffer.FINDSET THEN
        EXIT(FALSE);

      REPEAT
        EVALUATE(TableId,TempNameValueBuffer.Value);
        IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableId,RecordID) THEN
          BREAK;
      UNTIL TempNameValueBuffer.NEXT = 0;

      IF RecordID.TABLENO = 0 THEN
        EXIT(FALSE);

      OpenRecordCardPage(RecordID);
      EXIT(TRUE);
    END;

    LOCAL PROCEDURE OpenRecordCardPage@36(RecordID@1008 : RecordID);
    VAR
      Customer@1007 : Record 18;
      Contact@1006 : Record 5050;
      Currency@1005 : Record 4;
      SalespersonPurchaser@1004 : Record 13;
      UnitOfMeasure@1003 : Record 204;
      Item@1002 : Record 27;
      Resource@1001 : Record 156;
      SalesInvoiceHeader@1015 : Record 112;
      CustomerPriceGroup@1009 : Record 6;
      RecordRef@1000 : RecordRef;
    BEGIN
      // Open the right kind of card page
      RecordRef := RecordID.GETRECORD;
      CASE RecordID.TABLENO OF
        DATABASE::Contact:
          BEGIN
            RecordRef.SETTABLE(Contact);
            PAGE.RUN(PAGE::"Contact Card",Contact);
          END;
        DATABASE::Currency:
          BEGIN
            RecordRef.SETTABLE(Currency);
            PAGE.RUN(PAGE::"Currency Card",Currency);
          END;
        DATABASE::Customer:
          BEGIN
            RecordRef.SETTABLE(Customer);
            PAGE.RUN(PAGE::"Customer Card",Customer);
          END;
        DATABASE::Item:
          BEGIN
            RecordRef.SETTABLE(Item);
            PAGE.RUN(PAGE::"Item Card",Item);
          END;
        DATABASE::"Sales Invoice Header":
          BEGIN
            RecordRef.SETTABLE(SalesInvoiceHeader);
            PAGE.RUN(PAGE::"Posted Sales Invoice",SalesInvoiceHeader);
          END;
        DATABASE::Resource:
          BEGIN
            RecordRef.SETTABLE(Resource);
            PAGE.RUN(PAGE::"Resource Card",Resource);
          END;
        DATABASE::"Salesperson/Purchaser":
          BEGIN
            RecordRef.SETTABLE(SalespersonPurchaser);
            PAGE.RUN(PAGE::"Salesperson/Purchaser Card",SalespersonPurchaser);
          END;
        DATABASE::"Unit of Measure":
          BEGIN
            RecordRef.SETTABLE(UnitOfMeasure);
            // There is no Unit of Measure card. Open the list, filtered down to this instance.
            PAGE.RUN(PAGE::"Units of Measure",UnitOfMeasure);
          END;
        DATABASE::"Customer Price Group":
          BEGIN
            RecordRef.SETTABLE(CustomerPriceGroup);
            // There is no Customer Price Group card. Open the list, filtered down to this instance.
            PAGE.RUN(PAGE::"Customer Price Groups",CustomerPriceGroup);
          END;
        ELSE
          ERROR(NoCardPageActionDefinedForTableIdErr,RecordID.TABLENO);
      END;
    END;

    PROCEDURE GetCRMEntityTypeName@7(TableId@1000 : Integer) : Text;
    VAR
      TempNameValueBuffer@1001 : TEMPORARY Record 823;
      CRMSetupDefaults@1002 : Codeunit 5334;
    BEGIN
      CRMSetupDefaults.GetTableIDCRMEntityNameMapping(TempNameValueBuffer);
      TempNameValueBuffer.SETRANGE(Value,FORMAT(TableId));
      IF TempNameValueBuffer.FINDFIRST THEN
        EXIT(TempNameValueBuffer.Name);
      ERROR(UnableToResolveCRMEntityNameFrmTableIDErr,TableId);
    END;

    LOCAL PROCEDURE GetCoupledCRMID@18(RecordID@1000 : RecordID;VAR CRMID@1001 : GUID;Silent@1003 : Boolean) : Boolean;
    VAR
      CRMIntegrationRecord@1002 : Record 5331;
      RecordRef@1004 : RecordRef;
    BEGIN
      IF CRMIntegrationRecord.FindIDFromRecordID(RecordID,CRMID) THEN
        EXIT(TRUE);

      IF Silent THEN
        EXIT(FALSE);

      RecordRef.OPEN(RecordID.TABLENO);
      IF CONFIRM(STRSUBSTNO(ManageCouplingQst,RecordRef.CAPTION),FALSE) THEN
        IF DefineCoupling(RecordID) THEN
          EXIT(CRMIntegrationRecord.FindIDFromRecordID(RecordID,CRMID));

      EXIT(FALSE);
    END;

    PROCEDURE DefineCoupling@101(RecordID@1000 : RecordID) : Boolean;
    VAR
      CRMCouplingManagement@1005 : Codeunit 5331;
      CreateNew@1001 : Boolean;
      Synchronize@1002 : Boolean;
      Direction@1003 : Option;
      CRMID@1004 : GUID;
    BEGIN
      IF CRMCouplingManagement.DefineCoupling(RecordID,CRMID,CreateNew,Synchronize,Direction) THEN BEGIN
        IF CreateNew THEN
          CreateNewRecordInCRM(RecordID,FALSE)
        ELSE
          IF Synchronize THEN
            PerformInitialSynchronization(RecordID,CRMID,Direction);
        EXIT(TRUE);
      END;

      EXIT(FALSE);
    END;

    PROCEDURE ManageCreateNewRecordFromCRM@2(TableID@1000 : Integer);
    VAR
      IntegrationTableMapping@1001 : Record 5335;
      CRMContactList@1003 : Page 5342;
      CRMAccountList@1006 : Page 5341;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,TableID);

      // Open the right kind of CRM List page, allowing creation
      CASE TableID OF
        DATABASE::Contact:
          BEGIN
            CRMContactList.SetAllowCreateFromCRM(TRUE);
            CRMContactList.RUNMODAL;
          END;
        DATABASE::Customer:
          BEGIN
            CRMAccountList.SetAllowCreateFromCRM(TRUE);
            CRMAccountList.RUNMODAL;
          END;
      END;
    END;

    PROCEDURE ShowCustomerCRMOpportunities@28(Customer@1002 : Record 18);
    VAR
      CRMOpportunity@1000 : Record 5343;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMOpportunity.FILTERGROUP := 2;
      CRMOpportunity.SETRANGE(ParentAccountId,CRMID);
      CRMOpportunity.SETRANGE(StateCode,CRMOpportunity.StateCode::Open);
      CRMOpportunity.FILTERGROUP := 0;
      PAGE.RUN(PAGE::"CRM Opportunity List",CRMOpportunity);
    END;

    PROCEDURE ShowCustomerCRMQuotes@3(Customer@1002 : Record 18);
    VAR
      CRMQuote@1000 : Record 5351;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMQuote.FILTERGROUP := 2;
      CRMQuote.SETRANGE(CustomerId,CRMID);
      CRMQuote.SETRANGE(StateCode,CRMQuote.StateCode::Active);
      CRMQuote.FILTERGROUP := 0;
      PAGE.RUN(PAGE::"CRM Quote List",CRMQuote);
    END;

    PROCEDURE ShowCustomerCRMCases@10(Customer@1002 : Record 18);
    VAR
      CRMIncident@1000 : Record 5349;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMIncident.FILTERGROUP := 2;
      CRMIncident.SETRANGE(CustomerId,CRMID);
      CRMIncident.SETRANGE(StateCode,CRMIncident.StateCode::Active);
      CRMIncident.FILTERGROUP := 2;
      PAGE.RUN(PAGE::"CRM Case List",CRMIncident);
    END;

    PROCEDURE GetNoOfCRMOpportunities@13(Customer@1003 : Record 18) : Integer;
    VAR
      CRMOpportunity@1002 : Record 5343;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMOpportunity.SETRANGE(ParentAccountId,CRMID);
      CRMOpportunity.SETRANGE(StateCode,CRMOpportunity.StateCode::Open);
      EXIT(CRMOpportunity.COUNT);
    END;

    PROCEDURE GetNoOfCRMQuotes@12(Customer@1003 : Record 18) : Integer;
    VAR
      CRMQuote@1002 : Record 5351;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMQuote.SETRANGE(CustomerId,CRMID);
      CRMQuote.SETRANGE(StateCode,CRMQuote.StateCode::Active);
      EXIT(CRMQuote.COUNT);
    END;

    PROCEDURE GetNoOfCRMCases@31(Customer@1003 : Record 18) : Integer;
    VAR
      CRMIncident@1002 : Record 5349;
      CRMID@1000 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMIncident.SETRANGE(StateCode,CRMIncident.StateCode::Active);
      CRMIncident.SETRANGE(CustomerId,CRMID);
      EXIT(CRMIncident.COUNT);
    END;

    LOCAL PROCEDURE GetSelectedSyncDirection@24(RecordID@1000 : RecordID;CRMID@1012 : GUID;MultipleRecords@1005 : Boolean;VAR RecommendedDirectionIgnored@1006 : Boolean) : Integer;
    VAR
      IntegrationTableMapping@1003 : Record 5335;
      IntegrationRecSynchInvoke@1007 : Codeunit 5345;
      RecordRef@1011 : RecordRef;
      CRMRecordRef@1010 : RecordRef;
      SynchronizeNowQuestion@1004 : Text;
      AllowedDirection@1001 : Integer;
      RecommendedDirection@1002 : Integer;
      SelectedDirection@1008 : Integer;
      RecordModified@1013 : Boolean;
      CRMRecordModified@1014 : Boolean;
      DefaultAnswer@1015 : Boolean;
    BEGIN
      // Interact with the user to a) confirm sync and b) if AllowedDirection = Bidirectional, then get Selected Direction
      // Returns 0 if the user canceled

      // Determine the allowed direction
      // Currently we expect one mapping per entity. In a multi-mapping per entity setup we need additional filtering to choose correct mapping.
      IntegrationTableMapping.SETRANGE("Table ID",RecordID.TABLENO);
      IntegrationTableMapping.FINDFIRST;
      IF IntegrationTableMapping.COUNT = 1 THEN
        AllowedDirection := IntegrationTableMapping.Direction
      ELSE
        AllowedDirection := IntegrationTableMapping.GetAllowedSyncDirection(RecordID.TABLENO);

      IF MultipleRecords THEN BEGIN
        CASE AllowedDirection OF
          IntegrationTableMapping.Direction::Bidirectional:
            EXIT(STRMENU(UpdateNowDirectionQst,RecommendedDirection,UpdateMultipleNowTitleTxt));
          IntegrationTableMapping.Direction::FromIntegrationTable:
            SynchronizeNowQuestion := UpdateMultipleNowFromCRMQst;
          ELSE
            SynchronizeNowQuestion := UpdateMultipleNowToCRMQst;
        END;

        IF CONFIRM(SynchronizeNowQuestion,TRUE) THEN
          EXIT(AllowedDirection);

        EXIT(0);
      END;

      // Single record
      // Determine which sides were modified since last synch
      RecordRef.GET(RecordID);
      IntegrationTableMapping.GetRecordRef(CRMID,CRMRecordRef);
      RecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,RecordRef);
      CRMRecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,CRMRecordRef);

      IF RecordModified AND CRMRecordModified THEN
        // Changes on both sides. Bidirectional: warn user. Unidirectional: confirm and exit.
        CASE AllowedDirection OF
          IntegrationTableMapping.Direction::Bidirectional:
            MESSAGE(BothRecordsModifiedBiDirectionalMsg,RecordRef.CAPTION,CRMRecordRef.CAPTION);
          IntegrationTableMapping.Direction::ToIntegrationTable:
            BEGIN
              IF CONFIRM(BothRecordsModifiedToCRMQst,FALSE,FORMAT(RecordID,0,1),CRMRecordRef.CAPTION,PRODUCTNAME.FULL) THEN
                EXIT(AllowedDirection);
              EXIT(0);
            END;
          IntegrationTableMapping.Direction::FromIntegrationTable:
            BEGIN
              IF CONFIRM(BothRecordsModifiedToNAVQst,FALSE,FORMAT(RecordID,0,1),CRMRecordRef.CAPTION,PRODUCTNAME.FULL) THEN
                EXIT(AllowedDirection);
              EXIT(0);
            END;
        END;

      // Zero or one side changed. Synch for zero too because dependent objects could have changed.
      CASE AllowedDirection OF
        IntegrationTableMapping.Direction::Bidirectional:
          BEGIN
            // Default from NAV to CRM
            RecommendedDirection := IntegrationTableMapping.Direction::ToIntegrationTable;
            IF CRMRecordModified AND NOT RecordModified THEN
              RecommendedDirection := IntegrationTableMapping.Direction::FromIntegrationTable;

            SelectedDirection := STRMENU(UpdateNowDirectionQst,RecommendedDirection,
                STRSUBSTNO(UpdateOneNowTitleTxt,FORMAT(RecordID,0,1)));
            RecommendedDirectionIgnored := SelectedDirection <> RecommendedDirection;
            EXIT(SelectedDirection);
          END;
        IntegrationTableMapping.Direction::FromIntegrationTable:
          IF RecordModified THEN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowFromOldCRMQst,FORMAT(RecordID,0,1),PRODUCTNAME.SHORT)
          ELSE BEGIN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowFromCRMQst,FORMAT(RecordID,0,1));
            DefaultAnswer := TRUE;
          END;
        ELSE
          IF CRMRecordModified THEN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowToModifiedCRMQst,FORMAT(RecordID,0,1),PRODUCTNAME.SHORT)
          ELSE BEGIN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowToCRMQst,FORMAT(RecordID,0,1));
            DefaultAnswer := TRUE;
          END;
      END;

      IF CONFIRM(SynchronizeNowQuestion,DefaultAnswer) THEN
        EXIT(AllowedDirection);

      EXIT(0);
    END;

    [EventSubscriber(Table,1400,OnRegisterServiceConnection)]
    PROCEDURE HandleCRMRegisterServiceConnection@32(VAR ServiceConnection@1000 : Record 1400);
    VAR
      CRMConnectionSetup@1001 : Record 5330;
      RecRef@1002 : RecordRef;
    BEGIN
      IF NOT CRMConnectionSetup.GET THEN BEGIN
        IF NOT CRMConnectionSetup.WRITEPERMISSION THEN
          EXIT;
        CRMConnectionSetup.INIT;
        CRMConnectionSetup.INSERT;
      END;

      RecRef.GETTABLE(CRMConnectionSetup);
      ServiceConnection.Status := ServiceConnection.Status::Enabled;
      WITH CRMConnectionSetup DO BEGIN
        IF NOT "Is Enabled" THEN
          ServiceConnection.Status := ServiceConnection.Status::Disabled
        ELSE BEGIN
          IF TestConnection THEN
            ServiceConnection.Status := ServiceConnection.Status::Connected
          ELSE
            ServiceConnection.Status := ServiceConnection.Status::Error;
        END;
        ServiceConnection.InsertServiceConnectionExtended(
          ServiceConnection,RecRef.RECORDID,TABLECAPTION,"Server Address",PAGE::"CRM Connection Setup",
          PAGE::"CRM Connection Setup Wizard");
      END;
    END;

    PROCEDURE ClearState@21();
    BEGIN
      CRMIntegrationEnabledState := CRMIntegrationEnabledState::" "
    END;

    PROCEDURE GetLastErrorMessage@33() : Text;
    VAR
      ErrorObject@1000 : DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Exception";
    BEGIN
      ErrorObject := GETLASTERROROBJECT;
      IF ISNULL(ErrorObject) THEN
        EXIT('');
      IF STRPOS(ErrorObject.GetType.Name,'NavCrmException') > 0 THEN
        IF NOT ISNULL(ErrorObject.InnerException) THEN
          EXIT(ErrorObject.InnerException.Message);
      EXIT(GETLASTERRORTEXT);
    END;

    [TryFunction]
    PROCEDURE ImportCRMSolution@34(ServerAddress@1006 : Text;IntegrationUserEmail@1017 : Text;AdminUserEmail@1000 : Text;AdminUserPassword@1001 : Text);
    VAR
      URI@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      HomeRealmURI@1010 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      ClientCredentials@1018 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.Description.ClientCredentials";
      OrganizationServiceProxy@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";
      CRMHelper@1003 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";
      UserGUID@1005 : GUID;
      IntegrationAdminRoleGUID@1013 : GUID;
      IntegrationUserRoleGUID@1014 : GUID;
    BEGIN
      CheckConnectRequiredFields(ServerAddress,IntegrationUserEmail);
      URI := URI.Uri(ConstructConnectionStringForSolutionImport(ServerAddress));
      ClientCredentials := ClientCredentials.ClientCredentials;
      ClientCredentials.UserName.UserName := AdminUserEmail;
      ClientCredentials.UserName.Password := AdminUserPassword;
      IF NOT InitializeCRMConnection(URI,HomeRealmURI,ClientCredentials,CRMHelper,OrganizationServiceProxy) THEN
        ProcessConnectionFailures;

      IF ISNULL(OrganizationServiceProxy.ServiceManagement.GetIdentityProvider(AdminUserEmail)) THEN
        ERROR(AdminEmailPasswordWrongErr);

      UserGUID := GetUserGUID(OrganizationServiceProxy,IntegrationUserEmail);
      IF NOT CheckAnyRoleAssignedToUser(OrganizationServiceProxy,UserGUID) THEN
        ERROR(STRSUBSTNO(UserHasNoSecurityRolesErr,IntegrationUserEmail));

      IF NOT CheckSolutionPresence(OrganizationServiceProxy) THEN
        IF NOT ImportDefaultCRMSolution(CRMHelper,OrganizationServiceProxy) THEN
          ProcessConnectionFailures;

      IntegrationAdminRoleGUID := GetRoleGUID(OrganizationServiceProxy,GetIntegrationAdminRoleID);
      IntegrationUserRoleGUID := GetRoleGUID(OrganizationServiceProxy,GetIntegrationUserRoleID);

      IF NOT CheckRoleAssignedToUser(OrganizationServiceProxy,UserGUID,IntegrationAdminRoleGUID) THEN
        AssociateUserWithRole(UserGUID,IntegrationAdminRoleGUID,OrganizationServiceProxy);
      IF NOT CheckRoleAssignedToUser(OrganizationServiceProxy,UserGUID,IntegrationUserRoleGUID) THEN
        AssociateUserWithRole(UserGUID,IntegrationUserRoleGUID,OrganizationServiceProxy);
    END;

    [TryFunction]
    LOCAL PROCEDURE ImportDefaultCRMSolution@45(CRMHelper@1001 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    BEGIN
      CRMHelper.ImportDefaultCrmSolution(OrganizationServiceProxy);
    END;

    LOCAL PROCEDURE AssociateUserWithRole@66(UserGUID@1000 : GUID;RoleGUID@1001 : GUID;VAR OrganizationServiceProxy@1014 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    VAR
      AssociateRequest@1012 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Messages.AssociateRequest";
    BEGIN
      CreateAssociateRequest(UserGUID,RoleGUID,AssociateRequest);
      OrganizationServiceProxy.Execute(AssociateRequest);
    END;

    LOCAL PROCEDURE GetQueryExpression@72(EntityName@1009 : Text;Column@1010 : Text;ConditionField@1011 : Text;ConditionFieldValue@1012 : Text;ErrorMsg@1005 : Text;VAR OrganizationServiceProxy@1006 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy") : GUID;
    VAR
      QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      Entity@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Entity";
      EntityCollection@1013 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
      LinkEntity@1014 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
    BEGIN
      CreateQueryExpression(EntityName,Column,ConditionField,ConditionFieldValue,LinkEntity,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN BEGIN
        OrganizationServiceProxy.Dispose();
        ProcessConnectionFailures;
      END;

      IF EntityCollection.Entities.Count = 0 THEN
        ERROR(STRSUBSTNO(ErrorMsg,ConditionFieldValue));
      Entity := EntityCollection.Item(0);
      EXIT(Entity.Id);
    END;

    LOCAL PROCEDURE GetUserGUID@41(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserEmail@1000 : Text) : GUID;
    BEGIN
      EXIT(
        GetQueryExpression(
          'systemuser','systemuserid','internalemailaddress',UserEmail,UserDoesNotExistCRMTxt,OrganizationServiceProxy));
    END;

    LOCAL PROCEDURE GetRoleGUID@43(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";RoleName@1000 : Text) : GUID;
    BEGIN
      EXIT(
        GetQueryExpression(
          'role','roleid','roleid',RoleName,RoleIdDoesNotExistCRMTxt,OrganizationServiceProxy));
    END;

    PROCEDURE CheckConnectRequiredFields@46(ServerAddress@1000 : Text;IntegrationUserEmail@1001 : Text);
    BEGIN
      IF (IntegrationUserEmail = '') OR (ServerAddress = '') THEN
        ERROR(EmailAndServerAddressEmptyErr);
    END;

    PROCEDURE CreateAssociateRequest@44(UserGUID@1001 : GUID;RoleGUID@1000 : GUID;VAR AssociateRequest@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Messages.AssociateRequest");
    VAR
      EntityReferenceCollection@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityReferenceCollection";
      RelationShip@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Relationship";
      EntityReference@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityReference";
    BEGIN
      EntityReferenceCollection := EntityReferenceCollection.EntityReferenceCollection;
      EntityReferenceCollection.Add(EntityReference.EntityReference('role',RoleGUID));
      RelationShip := RelationShip.Relationship('systemuserroles_association');
      AssociateRequest := AssociateRequest.AssociateRequest;
      AssociateRequest.Target(EntityReference.EntityReference('systemuser',UserGUID));
      AssociateRequest.RelatedEntities(EntityReferenceCollection);
      AssociateRequest.Relationship(RelationShip);
    END;

    PROCEDURE CreateFilterExpression@64(AttributeName@1003 : Text;Value@1002 : Text;VAR FilterExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression");
    VAR
      ConditionExpression@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionExpression";
      ConditionOperator@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionOperator";
    BEGIN
      ConditionExpression :=
        ConditionExpression.ConditionExpression(AttributeName,ConditionOperator.Equal,Value);
      FilterExpression := FilterExpression.FilterExpression;
      FilterExpression.AddCondition(ConditionExpression);
    END;

    PROCEDURE CreateLinkEntity@55(VAR LinkEntity@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";LinkFromEntityName@1000 : Text;LinkFromAttributeName@1002 : Text;LinkToEntityName@1003 : Text;LinkToAttributeName@1004 : Text);
    VAR
      JoinOperator@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.JoinOperator";
    BEGIN
      LinkEntity :=
        LinkEntity.LinkEntity(
          LinkFromEntityName,LinkToEntityName,LinkFromAttributeName,LinkToAttributeName,
          JoinOperator.Inner);
    END;

    PROCEDURE CreateRoleToUserIDQueryExpression@40(UserIDGUID@1003 : GUID;RoleIDGUID@1004 : GUID;VAR QueryExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      LinkEntity1@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      LinkEntity2@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      FilterExpression@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
    BEGIN
      CreateLinkEntity(LinkEntity1,'systemuserroles','systemuserid','systemuser','systemuserid');

      CreateFilterExpression('systemuserid',UserIDGUID,FilterExpression);
      LinkEntity1.LinkCriteria(FilterExpression);

      CreateLinkEntity(LinkEntity2,'role','roleid','systemuserroles','roleid');
      LinkEntity2.LinkEntities.Add(LinkEntity1);

      CreateQueryExpression('role','roleid','roleid',RoleIDGUID,LinkEntity2,QueryExpression);
    END;

    PROCEDURE CreateAnyRoleToUserIDQueryExpression@54(UserIDGUID@1003 : GUID;VAR QueryExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      LinkEntity1@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      FilterExpression@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
      ColumnSet@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
    BEGIN
      CreateLinkEntity(LinkEntity1,'role','roleid','systemuserroles','roleid');

      CreateFilterExpression('systemuserid',UserIDGUID,FilterExpression);
      LinkEntity1.LinkCriteria(FilterExpression);

      QueryExpression := QueryExpression.QueryExpression('role');
      QueryExpression.ColumnSet(ColumnSet.ColumnSet);
      QueryExpression.LinkEntities.Add(LinkEntity1);
    END;

    LOCAL PROCEDURE CheckSolutionPresence@42(VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy") : Boolean;
    VAR
      ColumnSet@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
      QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      ConditionExpression@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionExpression";
      ConditionOperator@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionOperator";
      EntityCollection@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      QueryExpression := QueryExpression.QueryExpression('solution');
      ColumnSet := ColumnSet.ColumnSet;
      QueryExpression.ColumnSet(ColumnSet);
      ConditionExpression :=
        ConditionExpression.ConditionExpression('uniquename',ConditionOperator.Equal,MicrosoftDynamicsNavIntegrationTxt);
      QueryExpression.Criteria.AddCondition(ConditionExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    PROCEDURE CheckModifyCRMConnectionURL@37(VAR ServerAddress@1006 : Text[250]);
    VAR
      CRMSetupDefaults@1005 : Codeunit 5334;
      UriHelper@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      UriHelper2@1003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      UriKindHelper@1002 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.UriKind";
      UriPartialHelper@1001 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.UriPartial";
      ProposedUri@1000 : Text[250];
    BEGIN
      IF (ServerAddress = '') OR (ServerAddress = '@@test@@') THEN
        EXIT;

      ServerAddress := DELCHR(ServerAddress,'<>');

      IF NOT UriHelper.TryCreate(ServerAddress,UriKindHelper.Absolute,UriHelper2) THEN
        IF NOT UriHelper.TryCreate('https://' + ServerAddress,UriKindHelper.Absolute,UriHelper2) THEN
          ERROR(InvalidUriErr);

      IF UriHelper2.Scheme <> 'https' THEN BEGIN
        IF NOT CRMSetupDefaults.GetAllowNonSecureConnections THEN
          ERROR(MustUseHttpsErr);
        IF UriHelper2.Scheme <> 'http' THEN
          ERROR(STRSUBSTNO(MustUseHttpOrHttpsErr,UriHelper2.Scheme))
      END;

      ProposedUri := UriHelper2.GetLeftPart(UriPartialHelper.Authority);

      IF LOWERCASE(ServerAddress) <> LOWERCASE(ProposedUri) THEN BEGIN
        IF CONFIRM(STRSUBSTNO(ReplaceServerAddressQst,ServerAddress,ProposedUri)) THEN
          ServerAddress := ProposedUri;
      END;
    END;

    PROCEDURE CreateQueryExpression@49(EntityName@1000 : Text;Column@1001 : Text;ConditionField@1006 : Text;ConditionFieldValue@1007 : Text;LinkEntity@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";VAR QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      ColumnSet@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
      FilterExpression@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
    BEGIN
      ColumnSet := ColumnSet.ColumnSet;
      IF Column <> '' THEN
        ColumnSet.AddColumn(Column);
      CreateFilterExpression(ConditionField,ConditionFieldValue,FilterExpression);
      QueryExpression := QueryExpression.QueryExpression(EntityName);
      QueryExpression.ColumnSet(ColumnSet);
      IF NOT ISNULL(LinkEntity) THEN
        QueryExpression.LinkEntities.Add(LinkEntity);
      QueryExpression.Criteria(FilterExpression);
    END;

    LOCAL PROCEDURE CheckRoleAssignedToUser@59(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserIDGUID@1000 : GUID;RoleIDGUID@1002 : GUID) : Boolean;
    VAR
      QueryExpression@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      EntityCollection@1010 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      CreateRoleToUserIDQueryExpression(UserIDGUID,RoleIDGUID,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    LOCAL PROCEDURE CheckAnyRoleAssignedToUser@63(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserIDGUID@1000 : GUID) : Boolean;
    VAR
      QueryExpression@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      EntityCollection@1010 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      CreateAnyRoleToUserIDQueryExpression(UserIDGUID,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    PROCEDURE ConstructConnectionStringForSolutionImport@39(ServerAddress@1005 : Text) : Text;
    VAR
      FirstPart@1000 : Text;
      SecondPart@1002 : Text;
      FirstLevel@1001 : Integer;
    BEGIN
      FirstLevel := STRPOS(ServerAddress,'.');
      FirstPart := COPYSTR(ServerAddress,1,FirstLevel);
      SecondPart := COPYSTR(ServerAddress,FirstLevel);
      EXIT(STRSUBSTNO(ImportSolutionConnectStringTok,FirstPart,SecondPart));
    END;

    [TryFunction]
    LOCAL PROCEDURE InitializeCRMConnection@47(URI@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";HomeRealmURI@1003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";ClientCredentials@1002 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.Description.ClientCredentials";VAR CRMHelper@1005 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    BEGIN
      OrganizationServiceProxy := CRMHelper.InitializeServiceProxy(URI,HomeRealmURI,ClientCredentials);
    END;

    [TryFunction]
    LOCAL PROCEDURE ProcessQueryExpression@58(VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";VAR EntityCollection@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";QueryExpression@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    BEGIN
      EntityCollection := OrganizationServiceProxy.RetrieveMultiple(QueryExpression);
    END;

    LOCAL PROCEDURE ProcessConnectionFailures@50();
    VAR
      DotNetExceptionHandler@1000 : Codeunit 1291;
      FaultException@1001 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.FaultException";
      FileNotFoundException@1002 : DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.IO.FileNotFoundException";
      CRMHelper@1005 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";
    BEGIN
      DotNetExceptionHandler.Collect;

      IF DotNetExceptionHandler.TryCastToType(GETDOTNETTYPE(FaultException)) THEN
        ERROR(AdminEmailPasswordWrongErr);
      IF DotNetExceptionHandler.TryCastToType(GETDOTNETTYPE(FileNotFoundException)) THEN
        ERROR(CRMSolutionFileNotFoundErr);
      IF DotNetExceptionHandler.TryCastToType(CRMHelper.OrganizationServiceFaultExceptionType) THEN
        ERROR(AdminUserDoesNotHavePriviligesErr);
      IF DotNetExceptionHandler.TryCastToType(CRMHelper.SystemNetWebException) THEN
        ERROR(CRMConnectionURLWrongErr);
      DotNetExceptionHandler.Rethrow;
    END;

    PROCEDURE SetupItemAvailabilityService@100();
    VAR
      TenantWebService@1000 : Record 2000000168;
      WebServiceManagement@1001 : Codeunit 9750;
    BEGIN
      WebServiceManagement.CreateTenantWebService(
        TenantWebService."Object Type"::Page,PAGE::"Product Item Availability",'ProductItemAvailability',TRUE);
    END;

    LOCAL PROCEDURE GetIntegrationAdminRoleID@29() : Text;
    BEGIN
      EXIT('8c8d4f51-a72b-e511-80d9-3863bb349780');
    END;

    LOCAL PROCEDURE GetIntegrationUserRoleID@53() : Text;
    BEGIN
      EXIT('6f960e32-a72b-e511-80d9-3863bb349780');
    END;

    BEGIN
    END.
  }
}
```

<!--

```
OBJECT Codeunit 5330 CRM Integration Management
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    SingleInstance=Yes;
    OnRun=BEGIN
            CheckOrEnableCRMConnection;
          END;

  }
  CODE
  {
    VAR
      CRMEntityUrlTemplateTxt@1001 : TextConst '@@@={Locked};ENU="%1/main.aspx?pagetype=entityrecord&etn=%2&id=%3"';
      UnableToResolveCRMEntityNameFrmTableIDErr@1002 : TextConst '@@@="%1 = table ID (numeric)";ENU=The application is not designed to integrate Table %1 with Dynamics CRM.';
      CouplingNotFoundErr@1000 : TextConst 'ENU=The record is not coupled to Microsoft Dynamics CRM.';
      NoCardPageActionDefinedForTableIdErr@1022 : TextConst '@@@="%1 = Table ID";ENU=The open page action is not supported for Table %1.';
      IntegrationTableMappingNotFoundErr@1005 : TextConst '@@@="%1 = Integration Table Mapping caption, %2 = Table caption for the table which is not mapped";ENU=No %1 was found for table %2.';
      UpdateNowDirectionQst@1006 : TextConst '@@@=String menu options separated by comma.;ENU=Send data update to Dynamics CRM.,Get data update from Dynamics CRM.';
      UpdateOneNowTitleTxt@1007 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Synchronize data for %1?';
      UpdateMultipleNowTitleTxt@1014 : TextConst 'ENU=Synchronize data for the selected records?';
      UpdateNowFailedIgnoreDestinationChangesQst@1009 : TextConst '@@@=%1 the error message;ENU=The synchronization failed.\\%1. \\Do you want to ignore the destination changes and try the synchronization again?';
      UpdateNowFailedErr@1010 : TextConst '@@@=%1 Error message;ENU=The synchronization failed because of the following error:\\%1.';
      ManageCouplingQst@1003 : TextConst '@@@="%1=The record caption (type)";ENU=The %1 record is not coupled to Microsoft Dynamics CRM. Do you want to create a coupling?';
      SyncNowSuccessMsg@1016 : TextConst 'ENU=Synchronization completed.';
      SynchronizedMsg@1012 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were successfully synchronized.';
      UncoupledSkippedMsg@1013 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were not synchronized because they are not coupled.';
      NewerSkippedMsg@1034 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were not synchronized because their destination contains newer data.';
      FailedSynchronizationsMsg@1015 : TextConst '@@@=%1 and %2 are numbers, %3 is the name of the error log page;ENU=%1 of %2 records were not synchronized because of errors.\\For more information, see the %3 page.';
      CreationCompleteMsg@1026 : TextConst 'ENU=Creation of the selected records in Microsoft Dynamics CRM completed.';
      CreatedMsg@1027 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were successfully created.';
      CoupledSkippedMsg@1028 : TextConst '@@@=%1 and %2 are numbers;ENU=%1 of %2 records were skipped because they are already coupled.';
      UpdateOneNowToCRMQst@1017 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Send data update to Dynamics CRM for %1?';
      UpdateOneNowToModifiedCRMQst@1033 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now. %2 - product name";ENU=The Dynamics CRM record coupled to %1 contains newer data than the %2 record. Do you want to overwrite the data in Dynamics CRM?';
      UpdateOneNowFromCRMQst@1018 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now.";ENU=Get data update from Dynamics CRM for %1?';
      UpdateOneNowFromOldCRMQst@1011 : TextConst '@@@="%1 = Table caption and value for the entity we want to synchronize now. %2 - product name";ENU=The %2 record %1 contains newer data than the Dynamics CRM record. Get data update from Dynamics CRM, overwriting data in %2?';
      UpdateMultipleNowToCRMQst@1019 : TextConst 'ENU=Send data update to Dynamics CRM for the selected records?';
      UpdateMultipleNowFromCRMQst@1020 : TextConst 'ENU=Get data update from Dynamics CRM for the selected records?';
      TextManagement@1023 : Codeunit 41;
      AccountStatisticsUpdatedMsg@1024 : TextConst 'ENU=The customer statistics have been successfully updated in Microsoft Dynamics CRM.';
      BothRecordsModifiedBiDirectionalMsg@1029 : TextConst '@@@=%1 and %2 area captions of tables such as Customer and CRM Account;ENU=Both the %1 record and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data on one of the records will be lost and replaced with data from the other record.';
      BothRecordsModifiedToCRMQst@1030 : TextConst '@@@=%1 is a formatted RecordID, such as ''Customer 1234''. %2 is the caption of a CRM table. %3 - product name;ENU=Both %1 and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data in Microsoft Dynamics CRM will be overwritten with data from %3. Are you sure you want to synchronize?';
      BothRecordsModifiedToNAVQst@1031 : TextConst '@@@=%1 is a formatted RecordID, such as ''Customer 1234''. %2 is the caption of a CRM table. %3 - product name;ENU=Both %1 and the Dynamics CRM %2 record have been changed since the last synchronization, or synchronization has never been performed. If you continue with synchronization, data in %3 will be overwritten with data from Microsoft Dynamics CRM. Are you sure you want to synchronize?';
      RecordAlreadyCoupledCreateNewQst@1032 : TextConst '@@@="%1 = RecordID (translated table caption and primary key value, such as Customer 1234)";ENU=%1 is already coupled to a record in Microsoft Dynamics CRM. Do you want to create a new copy and couple to it?';
      CRMRecordAlreadyCoupledCreateNewQst@1008 : TextConst '@@@=%1 - product name;ENU=The Microsoft Dynamics CRM record is already coupled to a record in %1. Do you want to create a new copy and couple to it, replacing the old coupling?';
      CRMIntegrationEnabledState@1021 : ' ,Not Enabled,Enabled,Enabled But Not For Current User';
      DoYouWantToEnableCRMQst@1025 : TextConst '@@@="%1 = CRM Connection Setup";ENU=Dynamics CRM Integration is not enabled.\\Do you want to open the %1 window?';
      NotEnabledForCurrentUserMsg@1035 : TextConst '@@@="%1 = Current User Id %2 - product name";ENU=Dynamics CRM Integration is enabled.\However, because the %2 Users Must Map to Dynamics CRM Users field is set, Dynamics CRM integration is not enabled for %1.';
      CRMIntegrationEnabledLastError@1036 : Text;
      ImportSolutionConnectStringTok@1039 : TextConst '@@@={Locked};ENU=%1api%2/XRMServices/2011/Organization.svc';
      UserDoesNotExistCRMTxt@1042 : TextConst '@@@="%1 = User email address";ENU=There is no user with email address %1 in Dynamics CRM. Enter a valid email address.';
      RoleIdDoesNotExistCRMTxt@1043 : TextConst 'ENU=The Integration role does not exist in Dynamics CRM. \\Make sure the relevant customization is imported or check if the name of the role has changed.';
      EmailAndServerAddressEmptyErr@1046 : TextConst 'ENU=The Integration User Email and Server Address fields must not be empty.';
      CRMSolutionFileNotFoundErr@1041 : TextConst 'ENU=A file for a CRM solution could not be found.';
      MicrosoftDynamicsNavIntegrationTxt@1040 : TextConst '@@@={Locked};ENU=MicrosoftDynamicsNavIntegration';
      AdminEmailPasswordWrongErr@1044 : TextConst 'ENU=Enter valid CRM administrator credentials.';
      AdminUserDoesNotHavePriviligesErr@1045 : TextConst 'ENU=The specified CRM administrator does not have sufficient privileges to import a CRM solution.';
      InvalidUriErr@1050 : TextConst 'ENU=The value entered is not a valid URL.';
      MustUseHttpsErr@1049 : TextConst 'ENU=The application is set up to support secure connections (HTTPS) to Dynamics CRM only. You cannot use HTTP.';
      MustUseHttpOrHttpsErr@1048 : TextConst '@@@=%1 is a URI scheme, such as FTP, HTTP, chrome or file;ENU=%1 is not a valid URI scheme for Dynamics CRM connections. You can only use HTTPS or HTTP as the scheme in the URL.';
      ReplaceServerAddressQst@1047 : TextConst '@@@=%1 and %2 are URLs;ENU=The URL is not valid. Do you want to replace it with the URL suggested below?\\Entered URL: "%1".\Suggested URL: "%2".';
      CRMConnectionURLWrongErr@1051 : TextConst 'ENU=The URL is incorrect. Enter the URL for the Dynamics CRM connection.';
      UserHasNoSecurityRolesErr@1052 : TextConst '@@@="%1 = User email address";ENU=The user with email address %1 must have at least one security role in Dynamics CRM.';

    PROCEDURE IsCRMIntegrationEnabled@5() : Boolean;
    VAR
      CRMConnectionSetup@1000 : Record 5330;
    BEGIN
      IF CRMIntegrationEnabledState = CRMIntegrationEnabledState::" " THEN BEGIN
        CLEARLASTERROR;
        CRMIntegrationEnabledState := CRMIntegrationEnabledState::"Not Enabled";
        CLEAR(CRMIntegrationEnabledLastError);
        IF CRMConnectionSetup.GET THEN
          IF CRMConnectionSetup."Is Enabled" THEN BEGIN
            IF NOT CRMConnectionSetup."Is User Mapping Required" THEN
              CRMIntegrationEnabledState := CRMIntegrationEnabledState::Enabled
            ELSE
              IF CRMConnectionSetup.IsCurrentUserMappedToCrmSystemUser THEN
                CRMIntegrationEnabledState := CRMIntegrationEnabledState::Enabled
              ELSE BEGIN
                CRMIntegrationEnabledState := CRMIntegrationEnabledState::"Enabled But Not For Current User";
                CRMIntegrationEnabledLastError := GetLastErrorMessage;
              END;

            IF NOT HASTABLECONNECTION(TABLECONNECTIONTYPE::CRM,GETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::CRM)) THEN
              CRMConnectionSetup.RegisterUserConnection;
          END;
      END;

      EXIT(CRMIntegrationEnabledState = CRMIntegrationEnabledState::Enabled);
    END;

    PROCEDURE IsCRMSolutionInstalled@19() : Boolean;
    BEGIN
      IF TryTouchCRMSolutionEntities THEN
        EXIT(TRUE);

      CLEARLASTERROR;
      EXIT(FALSE);
    END;

    [TryFunction]
    LOCAL PROCEDURE TryTouchCRMSolutionEntities@27();
    VAR
      CRMNAVConnection@1001 : Record 5368;
      CRMAccountStatistics@1000 : Record 5367;
    BEGIN
      IF CRMAccountStatistics.FINDFIRST THEN;
      IF CRMNAVConnection.FINDFIRST THEN;
    END;

    PROCEDURE SetCRMNAVConnectionUrl@38(WebClientUrl@1000 : Text[250]);
    VAR
      CRMNAVConnection@1002 : Record 5368;
      NewConnection@1001 : Boolean;
    BEGIN
      IF NOT CRMNAVConnection.FINDFIRST THEN BEGIN
        CRMNAVConnection.INIT;
        NewConnection := TRUE;
      END;

      CRMNAVConnection."Dynamics NAV URL" := WebClientUrl;

      IF NewConnection THEN
        CRMNAVConnection.INSERT
      ELSE
        CRMNAVConnection.MODIFY;
    END;

    PROCEDURE SetCRMNAVODataUrlCredentials@48(ODataUrl@1000 : Text[250];Username@1003 : Text[250];Accesskey@1004 : Text[250]);
    VAR
      CRMNAVConnection@1002 : Record 5368;
      NewConnection@1001 : Boolean;
    BEGIN
      IF NOT CRMNAVConnection.FINDFIRST THEN BEGIN
        CRMNAVConnection.INIT;
        NewConnection := TRUE;
      END;

      CRMNAVConnection."Dynamics NAV OData URL" := ODataUrl;
      CRMNAVConnection."Dynamics NAV OData Username" := Username;
      CRMNAVConnection."Dynamics NAV OData Accesskey" := Accesskey;

      IF NewConnection THEN
        CRMNAVConnection.INSERT
      ELSE
        CRMNAVConnection.MODIFY;
    END;

    PROCEDURE UpdateMultipleNow@14(VAR RecRef@1007 : RecordRef);
    VAR
      IntegrationTableMapping@1001 : Record 5335;
      IntegrationRecSynchInvoke@1014 : Codeunit 5345;
      IntegrationSynchErrorList@1002 : Page 5339;
      CRMRecordRef@1005 : RecordRef;
      SelectedDirection@1003 : Integer;
      CRMID@1000 : GUID;
      NumUnCoupledRecords@1009 : Integer;
      NumNewerDataFailedSynchronizations@1010 : Integer;
      NumErrorFailedSynchronizations@1012 : Integer;
      NumSucceededSynchronizations@1013 : Integer;
      SuccessMsg@1011 : Text;
      RecordModified@1006 : Boolean;
      CRMRecordModified@1008 : Boolean;
      Unused@1004 : Boolean;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      GetIntegrationTableMapping(IntegrationTableMapping,RecRef.RECORDID.TABLENO);

      SelectedDirection := GetSelectedSyncDirection(RecRef.RECORDID,CRMID,TRUE,Unused);
      IF SelectedDirection < 1 THEN
        EXIT; // The user cancelled

      REPEAT
        IF NOT GetCoupledCRMID(RecRef.RECORDID,CRMID,TRUE) THEN
          NumUnCoupledRecords := NumUnCoupledRecords + 1
        ELSE BEGIN
          // Determine which sides were modified since last synch
          IntegrationTableMapping.GetRecordRef(CRMID,CRMRecordRef);
          RecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,RecRef);
          CRMRecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,CRMRecordRef);
          IF ((SelectedDirection = IntegrationTableMapping.Direction::ToIntegrationTable) AND CRMRecordModified) OR
             ((SelectedDirection = IntegrationTableMapping.Direction::FromIntegrationTable) AND RecordModified)
          THEN
            NumNewerDataFailedSynchronizations := NumNewerDataFailedSynchronizations + 1
          ELSE
            IF UpdateOne(IntegrationTableMapping,RecRef.RECORDID,CRMID,SelectedDirection,TRUE,FALSE,FALSE) THEN
              NumSucceededSynchronizations := NumSucceededSynchronizations + 1
            ELSE
              NumErrorFailedSynchronizations := NumErrorFailedSynchronizations + 1;
        END;
      UNTIL RecRef.NEXT = 0;

      SuccessMsg := SyncNowSuccessMsg;
      SuccessMsg := SuccessMsg + '\'; // At least one of the three below is always the case
      IF NumSucceededSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(SynchronizedMsg,NumSucceededSynchronizations,RecRef.COUNT));
      IF NumUnCoupledRecords > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(UncoupledSkippedMsg,NumUnCoupledRecords,RecRef.COUNT));
      IF NumNewerDataFailedSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,STRSUBSTNO(NewerSkippedMsg,NumNewerDataFailedSynchronizations,RecRef.COUNT));
      IF NumErrorFailedSynchronizations > 0 THEN
        SuccessMsg := STRSUBSTNO('%1\%2',SuccessMsg,
            STRSUBSTNO(FailedSynchronizationsMsg,NumErrorFailedSynchronizations,RecRef.COUNT,IntegrationSynchErrorList.CAPTION));

      MESSAGE(SuccessMsg);
    END;

    PROCEDURE UpdateOneNow@17(RecordID@1000 : RecordID);
    VAR
      IntegrationTableMapping@1003 : Record 5335;
      SelectedDirection@1001 : Integer;
      CRMID@1005 : GUID;
      RecommendedDirectionIgnored@1002 : Boolean;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);

      IF NOT GetCoupledCRMID(RecordID,CRMID,TRUE) THEN BEGIN
        GetCoupledCRMID(RecordID,CRMID,FALSE);
        EXIT;
      END;

      SelectedDirection := GetSelectedSyncDirection(RecordID,CRMID,FALSE,RecommendedDirectionIgnored);

      IF SelectedDirection = 0 THEN
        EXIT; // The user cancelled

      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,SelectedDirection,FALSE,NOT RecommendedDirectionIgnored,FALSE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    PROCEDURE CheckOrEnableCRMConnection@23();
    VAR
      CRMConnectionSetup@1000 : Page 5330;
    BEGIN
      IF IsCRMIntegrationEnabled THEN
        EXIT;

      IF CRMIntegrationEnabledLastError <> '' THEN
        ERROR(CRMIntegrationEnabledLastError);

      IF CRMIntegrationEnabledState = CRMIntegrationEnabledState::"Enabled But Not For Current User" THEN
        MESSAGE(NotEnabledForCurrentUserMsg,USERID,PRODUCTNAME.SHORT)
      ELSE
        IF CONFIRM(DoYouWantToEnableCRMQst,TRUE,CRMConnectionSetup.CAPTION) THEN
          PAGE.RUN(PAGE::"CRM Connection Setup");

      ERROR('');
    END;

    PROCEDURE CreateNewRecordInCRM@25(RecordID@1000 : RecordID;ConfirmBeforeDeletingExistingCoupling@1003 : Boolean);
    VAR
      IntegrationTableMapping@1004 : Record 5335;
      CRMCouplingManagement@1001 : Codeunit 5331;
      CRMID@1002 : GUID;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);
      GetCoupledCRMID(RecordID,CRMID,TRUE);
      IF NOT ISNULLGUID(CRMID) THEN BEGIN
        IF ConfirmBeforeDeletingExistingCoupling THEN
          IF NOT CONFIRM(RecordAlreadyCoupledCreateNewQst,FALSE,FORMAT(RecordID,0,1)) THEN
            EXIT;
        CRMCouplingManagement.RemoveCoupling(RecordID)
      END;
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::ToIntegrationTable,FALSE,TRUE,TRUE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    PROCEDURE CreateNewRecordsInCRM@22(RecRef@1000 : RecordRef);
    VAR
      IntegrationTableMapping@1002 : Record 5335;
      CRMID@1001 : GUID;
      NumCoupledRecords@1005 : Integer;
      NumSuccessfulCreations@1004 : Integer;
      NumFailedCreations@1003 : Integer;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      GetIntegrationTableMapping(IntegrationTableMapping,RecRef.RECORDID.TABLENO);

      // Perform the coupling, counting different kinds of success and failure
      REPEAT
        IF GetCoupledCRMID(RecRef.RECORDID,CRMID,TRUE) THEN
          NumCoupledRecords := NumCoupledRecords + 1
        ELSE
          IF UpdateOne(IntegrationTableMapping,RecRef.RECORDID,CRMID,
               IntegrationTableMapping.Direction::ToIntegrationTable,TRUE,TRUE,TRUE)
          THEN
            NumSuccessfulCreations := NumSuccessfulCreations + 1
          ELSE
            NumFailedCreations := NumFailedCreations + 1;
      UNTIL RecRef.NEXT = 0;

      // Report what happened
      ShowCreationFinishedMessage(RecRef.COUNT,NumSuccessfulCreations,NumCoupledRecords,NumFailedCreations);
    END;

    PROCEDURE CreateNewRecordFromCRM@1(CRMID@1001 : GUID;TableID@1003 : Integer);
    VAR
      IntegrationTableMapping@1000 : Record 5335;
      CRMIntegrationRecord@1002 : Record 5331;
      CRMCouplingManagement@1005 : Codeunit 5331;
      RecordID@1004 : RecordID;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,TableID);
      IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableID,RecordID) THEN
        IF NOT CRMIntegrationRecord.DeleteIfRecordDeleted(CRMID,TableID) THEN
          IF CONFIRM(STRSUBSTNO(CRMRecordAlreadyCoupledCreateNewQst,PRODUCTNAME.FULL)) THEN
            CRMCouplingManagement.RemoveCoupling(RecordID)
          ELSE
            EXIT;
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::FromIntegrationTable,FALSE,TRUE,TRUE) THEN BEGIN
        CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableID,RecordID);
        OpenRecordCardPage(RecordID);
      END;
    END;

    PROCEDURE CreateNewRecordsFromCRM@15(RecRef@1000 : RecordRef);
    VAR
      IntegrationTableMapping@1002 : Record 5335;
      CRMIntegrationRecord@1005 : Record 5331;
      RecordID@1006 : RecordID;
      CRMID@1003 : GUID;
      NumCoupledRecords@1004 : Integer;
      NumSuccessfulCreations@1007 : Integer;
      NumFailedCreations@1008 : Integer;
    BEGIN
      IF RecRef.ISEMPTY THEN
        EXIT;

      // Make sure this kind of record can be coupled
      IntegrationTableMapping.SETRANGE("Synch. Codeunit ID",CODEUNIT::"CRM Integration Table Synch.");
      IntegrationTableMapping.SETRANGE("Integration Table ID",RecRef.RECORDID.TABLENO);
      IF NOT IntegrationTableMapping.FINDFIRST THEN
        ERROR(IntegrationTableMappingNotFoundErr,IntegrationTableMapping.TABLECAPTION,RecRef.CAPTION);

      // Perform the coupling, counting different kinds of success and failure
      REPEAT
        CRMID := RecRef.FIELD(IntegrationTableMapping."Integration Table UID Fld. No.").VALUE;
        IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,IntegrationTableMapping."Table ID",RecordID) THEN BEGIN
          IF NOT CRMIntegrationRecord.DeleteIfRecordDeleted(CRMID,IntegrationTableMapping."Table ID")
          THEN
            NumCoupledRecords := NumCoupledRecords + 1
        END ELSE
          IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,IntegrationTableMapping.Direction::FromIntegrationTable,TRUE,TRUE,TRUE) THEN
            NumSuccessfulCreations := NumSuccessfulCreations + 1
          ELSE
            NumFailedCreations := NumFailedCreations + 1;
      UNTIL RecRef.NEXT = 0;

      // Report what happened
      ShowCreationFinishedMessage(RecRef.COUNT,NumSuccessfulCreations,NumCoupledRecords,NumFailedCreations);
    END;

    LOCAL PROCEDURE ShowCreationFinishedMessage@26(NumRecords@1001 : Integer;NumSuccessfulCreations@1000 : Integer;NumCoupledRecords@1002 : Integer;NumFailedCreations@1003 : Integer);
    VAR
      IntegrationSynchErrorList@1005 : Page 5339;
      FinishMsg@1004 : Text;
    BEGIN
      FinishMsg := CreationCompleteMsg;
      FinishMsg := FinishMsg + '\';
      IF NumSuccessfulCreations > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,STRSUBSTNO(CreatedMsg,NumSuccessfulCreations,NumRecords));
      IF NumCoupledRecords > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,STRSUBSTNO(CoupledSkippedMsg,NumCoupledRecords,NumRecords));
      IF NumFailedCreations > 0 THEN
        FinishMsg := STRSUBSTNO('%1\%2',FinishMsg,
            STRSUBSTNO(FailedSynchronizationsMsg,NumFailedCreations,NumRecords,IntegrationSynchErrorList.CAPTION));
      MESSAGE(FinishMsg);
    END;

    LOCAL PROCEDURE PerformInitialSynchronization@16(RecordID@1000 : RecordID;CRMID@1002 : GUID;Direction@1001 : Option);
    VAR
      IntegrationTableMapping@1005 : Record 5335;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,RecordID.TABLENO);
      IF UpdateOne(IntegrationTableMapping,RecordID,CRMID,Direction,FALSE,TRUE,FALSE) THEN
        MESSAGE(SyncNowSuccessMsg);
    END;

    LOCAL PROCEDURE GetIntegrationTableMapping@9(VAR IntegrationTableMapping@1001 : Record 5335;TableID@1000 : Integer);
    VAR
      TableMetadata@1002 : Record 2000000136;
    BEGIN
      IntegrationTableMapping.SETRANGE("Synch. Codeunit ID",CODEUNIT::"CRM Integration Table Synch.");
      IntegrationTableMapping.SETRANGE("Table ID",TableID);
      IF NOT IntegrationTableMapping.FINDFIRST THEN BEGIN
        TableMetadata.GET(TableID);
        ERROR(IntegrationTableMappingNotFoundErr,IntegrationTableMapping.TABLECAPTION,TableMetadata.Caption);
      END;
    END;

    LOCAL PROCEDURE UpdateOne@11(IntegrationTableMapping@1007 : Record 5335;RecordID@1000 : RecordID;CRMID@1012 : GUID;Direction@1001 : Integer;MultipleRecords@1002 : Boolean;IgnoreChanges@1003 : Boolean;IgnoreSynchOnlyCoupledRecords@1004 : Boolean) : Boolean;
    VAR
      IntegrationSynchJob@1008 : Record 5338;
      IntegrationSynchJobErrors@1009 : Record 5339;
      CRMIntegrationTableSynch@1006 : Codeunit 5340;
      LogId@1005 : GUID;
      ErrorMessage@1010 : Text;
    BEGIN
      IF Direction = IntegrationTableMapping.Direction::FromIntegrationTable THEN
        LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,CRMID,IgnoreChanges,IgnoreSynchOnlyCoupledRecords)
      ELSE
        LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,RecordID,IgnoreChanges,IgnoreSynchOnlyCoupledRecords);

      IntegrationSynchJob.GET(LogId);
      IF IntegrationSynchJob.Failed > 0 THEN BEGIN
        ErrorMessage := IntegrationSynchJob.Message;
        IntegrationSynchJobErrors.SETRANGE("Integration Synch. Job ID",IntegrationSynchJob.ID);
        IF IntegrationSynchJobErrors.FINDFIRST THEN
          ErrorMessage := ErrorMessage + ' ' + IntegrationSynchJobErrors.Message;

        IF MultipleRecords THEN
          EXIT(FALSE);

        IF IgnoreChanges THEN
          ERROR(UpdateNowFailedErr,TextManagement.RemoveMessageTrailingDots(ErrorMessage));

        IF NOT CONFIRM(UpdateNowFailedIgnoreDestinationChangesQst,FALSE,TextManagement.RemoveMessageTrailingDots(ErrorMessage)) THEN
          EXIT(FALSE);

        IF Direction = IntegrationTableMapping.Direction::FromIntegrationTable THEN
          LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,CRMID,TRUE,IgnoreSynchOnlyCoupledRecords)
        ELSE
          LogId := CRMIntegrationTableSynch.SynchRecord(IntegrationTableMapping,RecordID,TRUE,IgnoreSynchOnlyCoupledRecords);
        IntegrationSynchJob.GET(LogId);
      END;

      IF IntegrationSynchJob.Failed > 0 THEN BEGIN
        IntegrationSynchJobErrors.SETRANGE("Integration Synch. Job ID",IntegrationSynchJob.ID);
        ErrorMessage := IntegrationSynchJob.Message;
        IF IntegrationSynchJobErrors.FINDFIRST THEN
          ErrorMessage := ErrorMessage + ' ' + IntegrationSynchJobErrors.Message;
        ERROR(UpdateNowFailedErr,TextManagement.RemoveMessageTrailingDots(ErrorMessage));
      END;

      EXIT(TRUE);
    END;

    PROCEDURE CreateOrUpdateCRMAccountStatistics@20(Customer@1000 : Record 18);
    VAR
      CRMAccount@1004 : Record 5341;
      CRMStatisticsJob@1005 : Codeunit 5350;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT;

      CRMAccount.GET(CRMID);
      CRMStatisticsJob.CreateOrUpdateCRMAccountStatistics(Customer,CRMAccount);
      MESSAGE(AccountStatisticsUpdatedMsg);
    END;

    PROCEDURE ShowCRMEntityFromRecordID@8(RecordID@1000 : RecordID);
    VAR
      CRMID@1001 : GUID;
    BEGIN
      IF NOT GetCoupledCRMID(RecordID,CRMID,FALSE) THEN
        EXIT;

      HYPERLINK(GetCRMEntityUrlFromRecordID(RecordID));
    END;

    PROCEDURE GetCRMEntityUrlFromRecordID@4(TargetRecordID@1000 : RecordID) : Text;
    VAR
      CRMIntegrationRecord@1001 : Record 5331;
      IntegrationRecord@1005 : Record 5151;
      CRMId@1004 : GUID;
    BEGIN
      IF NOT CRMIntegrationRecord.FindIDFromRecordID(TargetRecordID,CRMId) THEN
        ERROR(CouplingNotFoundErr);

      IntegrationRecord.FindByRecordId(TargetRecordID);
      EXIT(GetCRMEntityUrlFromCRMID(IntegrationRecord."Table ID",CRMId));
    END;

    PROCEDURE GetCRMEntityUrlFromCRMID@6(TableId@1001 : Integer;CRMId@1006 : GUID) : Text;
    VAR
      CRMConnectionSetup@1003 : Record 5330;
    BEGIN
      CRMConnectionSetup.GET;
      EXIT(STRSUBSTNO(CRMEntityUrlTemplateTxt,CRMConnectionSetup."Server Address",GetCRMEntityTypeName(TableId),CRMId));
    END;

    PROCEDURE OpenCoupledNavRecordPage@35(CRMID@1000 : GUID;CRMEntityTypeName@1012 : Text) : Boolean;
    VAR
      CRMIntegrationRecord@1001 : Record 5331;
      TempNameValueBuffer@1013 : TEMPORARY Record 823;
      CRMSetupDefaults@1014 : Codeunit 5334;
      RecordID@1008 : RecordID;
      TableId@1002 : Integer;
    BEGIN
      // Find the corresponding NAV record and type
      CRMSetupDefaults.GetTableIDCRMEntityNameMapping(TempNameValueBuffer);
      TempNameValueBuffer.SETRANGE(Name,LOWERCASE(CRMEntityTypeName));
      IF NOT TempNameValueBuffer.FINDSET THEN
        EXIT(FALSE);

      REPEAT
        EVALUATE(TableId,TempNameValueBuffer.Value);
        IF CRMIntegrationRecord.FindRecordIDFromID(CRMID,TableId,RecordID) THEN
          BREAK;
      UNTIL TempNameValueBuffer.NEXT = 0;

      IF RecordID.TABLENO = 0 THEN
        EXIT(FALSE);

      OpenRecordCardPage(RecordID);
      EXIT(TRUE);
    END;

    LOCAL PROCEDURE OpenRecordCardPage@36(RecordID@1008 : RecordID);
    VAR
      Customer@1007 : Record 18;
      Contact@1006 : Record 5050;
      Currency@1005 : Record 4;
      SalespersonPurchaser@1004 : Record 13;
      UnitOfMeasure@1003 : Record 204;
      Item@1002 : Record 27;
      Resource@1001 : Record 156;
      SalesInvoiceHeader@1015 : Record 112;
      CustomerPriceGroup@1009 : Record 6;
      RecordRef@1000 : RecordRef;
    BEGIN
      // Open the right kind of card page
      RecordRef := RecordID.GETRECORD;
      CASE RecordID.TABLENO OF
        DATABASE::Contact:
          BEGIN
            RecordRef.SETTABLE(Contact);
            PAGE.RUN(PAGE::"Contact Card",Contact);
          END;
        DATABASE::Currency:
          BEGIN
            RecordRef.SETTABLE(Currency);
            PAGE.RUN(PAGE::"Currency Card",Currency);
          END;
        DATABASE::Customer:
          BEGIN
            RecordRef.SETTABLE(Customer);
            PAGE.RUN(PAGE::"Customer Card",Customer);
          END;
        DATABASE::Item:
          BEGIN
            RecordRef.SETTABLE(Item);
            PAGE.RUN(PAGE::"Item Card",Item);
          END;
        DATABASE::"Sales Invoice Header":
          BEGIN
            RecordRef.SETTABLE(SalesInvoiceHeader);
            PAGE.RUN(PAGE::"Posted Sales Invoice",SalesInvoiceHeader);
          END;
        DATABASE::Resource:
          BEGIN
            RecordRef.SETTABLE(Resource);
            PAGE.RUN(PAGE::"Resource Card",Resource);
          END;
        DATABASE::"Salesperson/Purchaser":
          BEGIN
            RecordRef.SETTABLE(SalespersonPurchaser);
            PAGE.RUN(PAGE::"Salesperson/Purchaser Card",SalespersonPurchaser);
          END;
        DATABASE::"Unit of Measure":
          BEGIN
            RecordRef.SETTABLE(UnitOfMeasure);
            // There is no Unit of Measure card. Open the list, filtered down to this instance.
            PAGE.RUN(PAGE::"Units of Measure",UnitOfMeasure);
          END;
        DATABASE::"Customer Price Group":
          BEGIN
            RecordRef.SETTABLE(CustomerPriceGroup);
            // There is no Customer Price Group card. Open the list, filtered down to this instance.
            PAGE.RUN(PAGE::"Customer Price Groups",CustomerPriceGroup);
          END;
        ELSE
          ERROR(NoCardPageActionDefinedForTableIdErr,RecordID.TABLENO);
      END;
    END;

    PROCEDURE GetCRMEntityTypeName@7(TableId@1000 : Integer) : Text;
    VAR
      TempNameValueBuffer@1001 : TEMPORARY Record 823;
      CRMSetupDefaults@1002 : Codeunit 5334;
    BEGIN
      CRMSetupDefaults.GetTableIDCRMEntityNameMapping(TempNameValueBuffer);
      TempNameValueBuffer.SETRANGE(Value,FORMAT(TableId));
      IF TempNameValueBuffer.FINDFIRST THEN
        EXIT(TempNameValueBuffer.Name);
      ERROR(UnableToResolveCRMEntityNameFrmTableIDErr,TableId);
    END;

    LOCAL PROCEDURE GetCoupledCRMID@18(RecordID@1000 : RecordID;VAR CRMID@1001 : GUID;Silent@1003 : Boolean) : Boolean;
    VAR
      CRMIntegrationRecord@1002 : Record 5331;
      RecordRef@1004 : RecordRef;
    BEGIN
      IF CRMIntegrationRecord.FindIDFromRecordID(RecordID,CRMID) THEN
        EXIT(TRUE);

      IF Silent THEN
        EXIT(FALSE);

      RecordRef.OPEN(RecordID.TABLENO);
      IF CONFIRM(STRSUBSTNO(ManageCouplingQst,RecordRef.CAPTION),FALSE) THEN
        IF DefineCoupling(RecordID) THEN
          EXIT(CRMIntegrationRecord.FindIDFromRecordID(RecordID,CRMID));

      EXIT(FALSE);
    END;

    PROCEDURE DefineCoupling@101(RecordID@1000 : RecordID) : Boolean;
    VAR
      CRMCouplingManagement@1005 : Codeunit 5331;
      CreateNew@1001 : Boolean;
      Synchronize@1002 : Boolean;
      Direction@1003 : Option;
      CRMID@1004 : GUID;
    BEGIN
      IF CRMCouplingManagement.DefineCoupling(RecordID,CRMID,CreateNew,Synchronize,Direction) THEN BEGIN
        IF CreateNew THEN
          CreateNewRecordInCRM(RecordID,FALSE)
        ELSE
          IF Synchronize THEN
            PerformInitialSynchronization(RecordID,CRMID,Direction);
        EXIT(TRUE);
      END;

      EXIT(FALSE);
    END;

    PROCEDURE ManageCreateNewRecordFromCRM@2(TableID@1000 : Integer);
    VAR
      IntegrationTableMapping@1001 : Record 5335;
      CRMContactList@1003 : Page 5342;
      CRMAccountList@1006 : Page 5341;
    BEGIN
      GetIntegrationTableMapping(IntegrationTableMapping,TableID);

      // Open the right kind of CRM List page, allowing creation
      CASE TableID OF
        DATABASE::Contact:
          BEGIN
            CRMContactList.SetAllowCreateFromCRM(TRUE);
            CRMContactList.RUNMODAL;
          END;
        DATABASE::Customer:
          BEGIN
            CRMAccountList.SetAllowCreateFromCRM(TRUE);
            CRMAccountList.RUNMODAL;
          END;
      END;
    END;

    PROCEDURE ShowCustomerCRMOpportunities@28(Customer@1002 : Record 18);
    VAR
      CRMOpportunity@1000 : Record 5343;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMOpportunity.FILTERGROUP := 2;
      CRMOpportunity.SETRANGE(ParentAccountId,CRMID);
      CRMOpportunity.SETRANGE(StateCode,CRMOpportunity.StateCode::Open);
      CRMOpportunity.FILTERGROUP := 0;
      PAGE.RUN(PAGE::"CRM Opportunity List",CRMOpportunity);
    END;

    PROCEDURE ShowCustomerCRMQuotes@3(Customer@1002 : Record 18);
    VAR
      CRMQuote@1000 : Record 5351;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMQuote.FILTERGROUP := 2;
      CRMQuote.SETRANGE(CustomerId,CRMID);
      CRMQuote.SETRANGE(StateCode,CRMQuote.StateCode::Active);
      CRMQuote.FILTERGROUP := 0;
      PAGE.RUN(PAGE::"CRM Quote List",CRMQuote);
    END;

    PROCEDURE ShowCustomerCRMCases@10(Customer@1002 : Record 18);
    VAR
      CRMIncident@1000 : Record 5349;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT;

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,FALSE) THEN
        EXIT;

      CRMIncident.FILTERGROUP := 2;
      CRMIncident.SETRANGE(CustomerId,CRMID);
      CRMIncident.SETRANGE(StateCode,CRMIncident.StateCode::Active);
      CRMIncident.FILTERGROUP := 2;
      PAGE.RUN(PAGE::"CRM Case List",CRMIncident);
    END;

    PROCEDURE GetNoOfCRMOpportunities@13(Customer@1003 : Record 18) : Integer;
    VAR
      CRMOpportunity@1002 : Record 5343;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMOpportunity.SETRANGE(ParentAccountId,CRMID);
      CRMOpportunity.SETRANGE(StateCode,CRMOpportunity.StateCode::Open);
      EXIT(CRMOpportunity.COUNT);
    END;

    PROCEDURE GetNoOfCRMQuotes@12(Customer@1003 : Record 18) : Integer;
    VAR
      CRMQuote@1002 : Record 5351;
      CRMID@1001 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMQuote.SETRANGE(CustomerId,CRMID);
      CRMQuote.SETRANGE(StateCode,CRMQuote.StateCode::Active);
      EXIT(CRMQuote.COUNT);
    END;

    PROCEDURE GetNoOfCRMCases@31(Customer@1003 : Record 18) : Integer;
    VAR
      CRMIncident@1002 : Record 5349;
      CRMID@1000 : GUID;
    BEGIN
      IF NOT IsCRMIntegrationEnabled THEN
        EXIT(0);

      IF NOT GetCoupledCRMID(Customer.RECORDID,CRMID,TRUE) THEN
        EXIT(0);

      CRMIncident.SETRANGE(StateCode,CRMIncident.StateCode::Active);
      CRMIncident.SETRANGE(CustomerId,CRMID);
      EXIT(CRMIncident.COUNT);
    END;

    LOCAL PROCEDURE GetSelectedSyncDirection@24(RecordID@1000 : RecordID;CRMID@1012 : GUID;MultipleRecords@1005 : Boolean;VAR RecommendedDirectionIgnored@1006 : Boolean) : Integer;
    VAR
      IntegrationTableMapping@1003 : Record 5335;
      IntegrationRecSynchInvoke@1007 : Codeunit 5345;
      RecordRef@1011 : RecordRef;
      CRMRecordRef@1010 : RecordRef;
      SynchronizeNowQuestion@1004 : Text;
      AllowedDirection@1001 : Integer;
      RecommendedDirection@1002 : Integer;
      SelectedDirection@1008 : Integer;
      RecordModified@1013 : Boolean;
      CRMRecordModified@1014 : Boolean;
      DefaultAnswer@1015 : Boolean;
    BEGIN
      // Interact with the user to a) confirm sync and b) if AllowedDirection = Bidirectional, then get Selected Direction
      // Returns 0 if the user canceled

      // Determine the allowed direction
      // Currently we expect one mapping per entity. In a multi-mapping per entity setup we need additional filtering to choose correct mapping.
      IntegrationTableMapping.SETRANGE("Table ID",RecordID.TABLENO);
      IntegrationTableMapping.FINDFIRST;
      IF IntegrationTableMapping.COUNT = 1 THEN
        AllowedDirection := IntegrationTableMapping.Direction
      ELSE
        AllowedDirection := IntegrationTableMapping.GetAllowedSyncDirection(RecordID.TABLENO);

      IF MultipleRecords THEN BEGIN
        CASE AllowedDirection OF
          IntegrationTableMapping.Direction::Bidirectional:
            EXIT(STRMENU(UpdateNowDirectionQst,RecommendedDirection,UpdateMultipleNowTitleTxt));
          IntegrationTableMapping.Direction::FromIntegrationTable:
            SynchronizeNowQuestion := UpdateMultipleNowFromCRMQst;
          ELSE
            SynchronizeNowQuestion := UpdateMultipleNowToCRMQst;
        END;

        IF CONFIRM(SynchronizeNowQuestion,TRUE) THEN
          EXIT(AllowedDirection);

        EXIT(0);
      END;

      // Single record
      // Determine which sides were modified since last synch
      RecordRef.GET(RecordID);
      IntegrationTableMapping.GetRecordRef(CRMID,CRMRecordRef);
      RecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,RecordRef);
      CRMRecordModified := IntegrationRecSynchInvoke.WasModifiedAfterLastSynch(IntegrationTableMapping,CRMRecordRef);

      IF RecordModified AND CRMRecordModified THEN
        // Changes on both sides. Bidirectional: warn user. Unidirectional: confirm and exit.
        CASE AllowedDirection OF
          IntegrationTableMapping.Direction::Bidirectional:
            MESSAGE(BothRecordsModifiedBiDirectionalMsg,RecordRef.CAPTION,CRMRecordRef.CAPTION);
          IntegrationTableMapping.Direction::ToIntegrationTable:
            BEGIN
              IF CONFIRM(BothRecordsModifiedToCRMQst,FALSE,FORMAT(RecordID,0,1),CRMRecordRef.CAPTION,PRODUCTNAME.FULL) THEN
                EXIT(AllowedDirection);
              EXIT(0);
            END;
          IntegrationTableMapping.Direction::FromIntegrationTable:
            BEGIN
              IF CONFIRM(BothRecordsModifiedToNAVQst,FALSE,FORMAT(RecordID,0,1),CRMRecordRef.CAPTION,PRODUCTNAME.FULL) THEN
                EXIT(AllowedDirection);
              EXIT(0);
            END;
        END;

      // Zero or one side changed. Synch for zero too because dependent objects could have changed.
      CASE AllowedDirection OF
        IntegrationTableMapping.Direction::Bidirectional:
          BEGIN
            // Default from NAV to CRM
            RecommendedDirection := IntegrationTableMapping.Direction::ToIntegrationTable;
            IF CRMRecordModified AND NOT RecordModified THEN
              RecommendedDirection := IntegrationTableMapping.Direction::FromIntegrationTable;

            SelectedDirection := STRMENU(UpdateNowDirectionQst,RecommendedDirection,
                STRSUBSTNO(UpdateOneNowTitleTxt,FORMAT(RecordID,0,1)));
            RecommendedDirectionIgnored := SelectedDirection <> RecommendedDirection;
            EXIT(SelectedDirection);
          END;
        IntegrationTableMapping.Direction::FromIntegrationTable:
          IF RecordModified THEN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowFromOldCRMQst,FORMAT(RecordID,0,1),PRODUCTNAME.SHORT)
          ELSE BEGIN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowFromCRMQst,FORMAT(RecordID,0,1));
            DefaultAnswer := TRUE;
          END;
        ELSE
          IF CRMRecordModified THEN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowToModifiedCRMQst,FORMAT(RecordID,0,1),PRODUCTNAME.SHORT)
          ELSE BEGIN
            SynchronizeNowQuestion := STRSUBSTNO(UpdateOneNowToCRMQst,FORMAT(RecordID,0,1));
            DefaultAnswer := TRUE;
          END;
      END;

      IF CONFIRM(SynchronizeNowQuestion,DefaultAnswer) THEN
        EXIT(AllowedDirection);

      EXIT(0);
    END;

    [EventSubscriber(Table,1400,OnRegisterServiceConnection)]
    PROCEDURE HandleCRMRegisterServiceConnection@32(VAR ServiceConnection@1000 : Record 1400);
    VAR
      CRMConnectionSetup@1001 : Record 5330;
      RecRef@1002 : RecordRef;
    BEGIN
      IF NOT CRMConnectionSetup.GET THEN BEGIN
        IF NOT CRMConnectionSetup.WRITEPERMISSION THEN
          EXIT;
        CRMConnectionSetup.INIT;
        CRMConnectionSetup.INSERT;
      END;

      RecRef.GETTABLE(CRMConnectionSetup);
      ServiceConnection.Status := ServiceConnection.Status::Enabled;
      WITH CRMConnectionSetup DO BEGIN
        IF NOT "Is Enabled" THEN
          ServiceConnection.Status := ServiceConnection.Status::Disabled
        ELSE BEGIN
          IF TestConnection THEN
            ServiceConnection.Status := ServiceConnection.Status::Connected
          ELSE
            ServiceConnection.Status := ServiceConnection.Status::Error;
        END;
        ServiceConnection.InsertServiceConnectionExtended(
          ServiceConnection,RecRef.RECORDID,TABLECAPTION,"Server Address",PAGE::"CRM Connection Setup",
          PAGE::"CRM Connection Setup Wizard");
      END;
    END;

    PROCEDURE ClearState@21();
    BEGIN
      CRMIntegrationEnabledState := CRMIntegrationEnabledState::" "
    END;

    PROCEDURE GetLastErrorMessage@33() : Text;
    VAR
      ErrorObject@1000 : DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Exception";
    BEGIN
      ErrorObject := GETLASTERROROBJECT;
      IF ISNULL(ErrorObject) THEN
        EXIT('');
      IF STRPOS(ErrorObject.GetType.Name,'NavCrmException') > 0 THEN
        IF NOT ISNULL(ErrorObject.InnerException) THEN
          EXIT(ErrorObject.InnerException.Message);
      EXIT(GETLASTERRORTEXT);
    END;

    [TryFunction]
    PROCEDURE ImportCRMSolution@34(ServerAddress@1006 : Text;IntegrationUserEmail@1017 : Text;AdminUserEmail@1000 : Text;AdminUserPassword@1001 : Text);
    VAR
      URI@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      HomeRealmURI@1010 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      ClientCredentials@1018 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.Description.ClientCredentials";
      OrganizationServiceProxy@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";
      CRMHelper@1003 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";
      UserGUID@1005 : GUID;
      IntegrationAdminRoleGUID@1013 : GUID;
      IntegrationUserRoleGUID@1014 : GUID;
    BEGIN
      CheckConnectRequiredFields(ServerAddress,IntegrationUserEmail);
      URI := URI.Uri(ConstructConnectionStringForSolutionImport(ServerAddress));
      ClientCredentials := ClientCredentials.ClientCredentials;
      ClientCredentials.UserName.UserName := AdminUserEmail;
      ClientCredentials.UserName.Password := AdminUserPassword;
      IF NOT InitializeCRMConnection(URI,HomeRealmURI,ClientCredentials,CRMHelper,OrganizationServiceProxy) THEN
        ProcessConnectionFailures;

      IF ISNULL(OrganizationServiceProxy.ServiceManagement.GetIdentityProvider(AdminUserEmail)) THEN
        ERROR(AdminEmailPasswordWrongErr);

      UserGUID := GetUserGUID(OrganizationServiceProxy,IntegrationUserEmail);
      IF NOT CheckAnyRoleAssignedToUser(OrganizationServiceProxy,UserGUID) THEN
        ERROR(STRSUBSTNO(UserHasNoSecurityRolesErr,IntegrationUserEmail));

      IF NOT CheckSolutionPresence(OrganizationServiceProxy) THEN
        IF NOT ImportDefaultCRMSolution(CRMHelper,OrganizationServiceProxy) THEN
          ProcessConnectionFailures;

      IntegrationAdminRoleGUID := GetRoleGUID(OrganizationServiceProxy,GetIntegrationAdminRoleID);
      IntegrationUserRoleGUID := GetRoleGUID(OrganizationServiceProxy,GetIntegrationUserRoleID);

      IF NOT CheckRoleAssignedToUser(OrganizationServiceProxy,UserGUID,IntegrationAdminRoleGUID) THEN
        AssociateUserWithRole(UserGUID,IntegrationAdminRoleGUID,OrganizationServiceProxy);
      IF NOT CheckRoleAssignedToUser(OrganizationServiceProxy,UserGUID,IntegrationUserRoleGUID) THEN
        AssociateUserWithRole(UserGUID,IntegrationUserRoleGUID,OrganizationServiceProxy);
    END;

    [TryFunction]
    LOCAL PROCEDURE ImportDefaultCRMSolution@45(CRMHelper@1001 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    BEGIN
      CRMHelper.ImportDefaultCrmSolution(OrganizationServiceProxy);
    END;

    LOCAL PROCEDURE AssociateUserWithRole@66(UserGUID@1000 : GUID;RoleGUID@1001 : GUID;VAR OrganizationServiceProxy@1014 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    VAR
      AssociateRequest@1012 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Messages.AssociateRequest";
    BEGIN
      CreateAssociateRequest(UserGUID,RoleGUID,AssociateRequest);
      OrganizationServiceProxy.Execute(AssociateRequest);
    END;

    LOCAL PROCEDURE GetQueryExpression@72(EntityName@1009 : Text;Column@1010 : Text;ConditionField@1011 : Text;ConditionFieldValue@1012 : Text;ErrorMsg@1005 : Text;VAR OrganizationServiceProxy@1006 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy") : GUID;
    VAR
      QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      Entity@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Entity";
      EntityCollection@1013 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
      LinkEntity@1014 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
    BEGIN
      CreateQueryExpression(EntityName,Column,ConditionField,ConditionFieldValue,LinkEntity,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN BEGIN
        OrganizationServiceProxy.Dispose();
        ProcessConnectionFailures;
      END;

      IF EntityCollection.Entities.Count = 0 THEN
        ERROR(STRSUBSTNO(ErrorMsg,ConditionFieldValue));
      Entity := EntityCollection.Item(0);
      EXIT(Entity.Id);
    END;

    LOCAL PROCEDURE GetUserGUID@41(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserEmail@1000 : Text) : GUID;
    BEGIN
      EXIT(
        GetQueryExpression(
          'systemuser','systemuserid','internalemailaddress',UserEmail,UserDoesNotExistCRMTxt,OrganizationServiceProxy));
    END;

    LOCAL PROCEDURE GetRoleGUID@43(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";RoleName@1000 : Text) : GUID;
    BEGIN
      EXIT(
        GetQueryExpression(
          'role','roleid','roleid',RoleName,RoleIdDoesNotExistCRMTxt,OrganizationServiceProxy));
    END;

    PROCEDURE CheckConnectRequiredFields@46(ServerAddress@1000 : Text;IntegrationUserEmail@1001 : Text);
    BEGIN
      IF (IntegrationUserEmail = '') OR (ServerAddress = '') THEN
        ERROR(EmailAndServerAddressEmptyErr);
    END;

    PROCEDURE CreateAssociateRequest@44(UserGUID@1001 : GUID;RoleGUID@1000 : GUID;VAR AssociateRequest@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Messages.AssociateRequest");
    VAR
      EntityReferenceCollection@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityReferenceCollection";
      RelationShip@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Relationship";
      EntityReference@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityReference";
    BEGIN
      EntityReferenceCollection := EntityReferenceCollection.EntityReferenceCollection;
      EntityReferenceCollection.Add(EntityReference.EntityReference('role',RoleGUID));
      RelationShip := RelationShip.Relationship('systemuserroles_association');
      AssociateRequest := AssociateRequest.AssociateRequest;
      AssociateRequest.Target(EntityReference.EntityReference('systemuser',UserGUID));
      AssociateRequest.RelatedEntities(EntityReferenceCollection);
      AssociateRequest.Relationship(RelationShip);
    END;

    PROCEDURE CreateFilterExpression@64(AttributeName@1003 : Text;Value@1002 : Text;VAR FilterExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression");
    VAR
      ConditionExpression@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionExpression";
      ConditionOperator@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionOperator";
    BEGIN
      ConditionExpression :=
        ConditionExpression.ConditionExpression(AttributeName,ConditionOperator.Equal,Value);
      FilterExpression := FilterExpression.FilterExpression;
      FilterExpression.AddCondition(ConditionExpression);
    END;

    PROCEDURE CreateLinkEntity@55(VAR LinkEntity@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";LinkFromEntityName@1000 : Text;LinkFromAttributeName@1002 : Text;LinkToEntityName@1003 : Text;LinkToAttributeName@1004 : Text);
    VAR
      JoinOperator@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.JoinOperator";
    BEGIN
      LinkEntity :=
        LinkEntity.LinkEntity(
          LinkFromEntityName,LinkToEntityName,LinkFromAttributeName,LinkToAttributeName,
          JoinOperator.Inner);
    END;

    PROCEDURE CreateRoleToUserIDQueryExpression@40(UserIDGUID@1003 : GUID;RoleIDGUID@1004 : GUID;VAR QueryExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      LinkEntity1@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      LinkEntity2@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      FilterExpression@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
    BEGIN
      CreateLinkEntity(LinkEntity1,'systemuserroles','systemuserid','systemuser','systemuserid');

      CreateFilterExpression('systemuserid',UserIDGUID,FilterExpression);
      LinkEntity1.LinkCriteria(FilterExpression);

      CreateLinkEntity(LinkEntity2,'role','roleid','systemuserroles','roleid');
      LinkEntity2.LinkEntities.Add(LinkEntity1);

      CreateQueryExpression('role','roleid','roleid',RoleIDGUID,LinkEntity2,QueryExpression);
    END;

    PROCEDURE CreateAnyRoleToUserIDQueryExpression@54(UserIDGUID@1003 : GUID;VAR QueryExpression@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      LinkEntity1@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";
      FilterExpression@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
      ColumnSet@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
    BEGIN
      CreateLinkEntity(LinkEntity1,'role','roleid','systemuserroles','roleid');

      CreateFilterExpression('systemuserid',UserIDGUID,FilterExpression);
      LinkEntity1.LinkCriteria(FilterExpression);

      QueryExpression := QueryExpression.QueryExpression('role');
      QueryExpression.ColumnSet(ColumnSet.ColumnSet);
      QueryExpression.LinkEntities.Add(LinkEntity1);
    END;

    LOCAL PROCEDURE CheckSolutionPresence@42(VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy") : Boolean;
    VAR
      ColumnSet@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
      QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      ConditionExpression@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionExpression";
      ConditionOperator@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ConditionOperator";
      EntityCollection@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      QueryExpression := QueryExpression.QueryExpression('solution');
      ColumnSet := ColumnSet.ColumnSet;
      QueryExpression.ColumnSet(ColumnSet);
      ConditionExpression :=
        ConditionExpression.ConditionExpression('uniquename',ConditionOperator.Equal,MicrosoftDynamicsNavIntegrationTxt);
      QueryExpression.Criteria.AddCondition(ConditionExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    PROCEDURE CheckModifyCRMConnectionURL@37(VAR ServerAddress@1006 : Text[250]);
    VAR
      CRMSetupDefaults@1005 : Codeunit 5334;
      UriHelper@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      UriHelper2@1003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
      UriKindHelper@1002 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.UriKind";
      UriPartialHelper@1001 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.UriPartial";
      ProposedUri@1000 : Text[250];
    BEGIN
      IF (ServerAddress = '') OR (ServerAddress = '@@test@@') THEN
        EXIT;

      ServerAddress := DELCHR(ServerAddress,'<>');

      IF NOT UriHelper.TryCreate(ServerAddress,UriKindHelper.Absolute,UriHelper2) THEN
        IF NOT UriHelper.TryCreate('https://' + ServerAddress,UriKindHelper.Absolute,UriHelper2) THEN
          ERROR(InvalidUriErr);

      IF UriHelper2.Scheme <> 'https' THEN BEGIN
        IF NOT CRMSetupDefaults.GetAllowNonSecureConnections THEN
          ERROR(MustUseHttpsErr);
        IF UriHelper2.Scheme <> 'http' THEN
          ERROR(STRSUBSTNO(MustUseHttpOrHttpsErr,UriHelper2.Scheme))
      END;

      ProposedUri := UriHelper2.GetLeftPart(UriPartialHelper.Authority);

      IF LOWERCASE(ServerAddress) <> LOWERCASE(ProposedUri) THEN BEGIN
        IF CONFIRM(STRSUBSTNO(ReplaceServerAddressQst,ServerAddress,ProposedUri)) THEN
          ServerAddress := ProposedUri;
      END;
    END;

    PROCEDURE CreateQueryExpression@49(EntityName@1000 : Text;Column@1001 : Text;ConditionField@1006 : Text;ConditionFieldValue@1007 : Text;LinkEntity@1003 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.LinkEntity";VAR QueryExpression@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    VAR
      ColumnSet@1005 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.ColumnSet";
      FilterExpression@1004 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.FilterExpression";
    BEGIN
      ColumnSet := ColumnSet.ColumnSet;
      IF Column <> '' THEN
        ColumnSet.AddColumn(Column);
      CreateFilterExpression(ConditionField,ConditionFieldValue,FilterExpression);
      QueryExpression := QueryExpression.QueryExpression(EntityName);
      QueryExpression.ColumnSet(ColumnSet);
      IF NOT ISNULL(LinkEntity) THEN
        QueryExpression.LinkEntities.Add(LinkEntity);
      QueryExpression.Criteria(FilterExpression);
    END;

    LOCAL PROCEDURE CheckRoleAssignedToUser@59(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserIDGUID@1000 : GUID;RoleIDGUID@1002 : GUID) : Boolean;
    VAR
      QueryExpression@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      EntityCollection@1010 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      CreateRoleToUserIDQueryExpression(UserIDGUID,RoleIDGUID,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    LOCAL PROCEDURE CheckAnyRoleAssignedToUser@63(VAR OrganizationServiceProxy@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";UserIDGUID@1000 : GUID) : Boolean;
    VAR
      QueryExpression@1007 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression";
      EntityCollection@1010 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";
    BEGIN
      CreateAnyRoleToUserIDQueryExpression(UserIDGUID,QueryExpression);
      IF NOT ProcessQueryExpression(OrganizationServiceProxy,EntityCollection,QueryExpression) THEN
        ProcessConnectionFailures;
      EXIT(EntityCollection.Entities.Count > 0);
    END;

    PROCEDURE ConstructConnectionStringForSolutionImport@39(ServerAddress@1005 : Text) : Text;
    VAR
      FirstPart@1000 : Text;
      SecondPart@1002 : Text;
      FirstLevel@1001 : Integer;
    BEGIN
      FirstLevel := STRPOS(ServerAddress,'.');
      FirstPart := COPYSTR(ServerAddress,1,FirstLevel);
      SecondPart := COPYSTR(ServerAddress,FirstLevel);
      EXIT(STRSUBSTNO(ImportSolutionConnectStringTok,FirstPart,SecondPart));
    END;

    [TryFunction]
    LOCAL PROCEDURE InitializeCRMConnection@47(URI@1004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";HomeRealmURI@1003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";ClientCredentials@1002 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.Description.ClientCredentials";VAR CRMHelper@1005 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy");
    BEGIN
      OrganizationServiceProxy := CRMHelper.InitializeServiceProxy(URI,HomeRealmURI,ClientCredentials);
    END;

    [TryFunction]
    LOCAL PROCEDURE ProcessQueryExpression@58(VAR OrganizationServiceProxy@1000 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy";VAR EntityCollection@1002 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.EntityCollection";QueryExpression@1001 : DotNet "'Microsoft.Xrm.Sdk, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Xrm.Sdk.Query.QueryExpression");
    BEGIN
      EntityCollection := OrganizationServiceProxy.RetrieveMultiple(QueryExpression);
    END;

    LOCAL PROCEDURE ProcessConnectionFailures@50();
    VAR
      DotNetExceptionHandler@1000 : Codeunit 1291;
      FaultException@1001 : DotNet "'System.ServiceModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.FaultException";
      FileNotFoundException@1002 : DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.IO.FileNotFoundException";
      CRMHelper@1005 : DotNet "'Microsoft.Dynamics.Nav.CrmCustomizationHelper, Version=11.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.CrmCustomizationHelper.CrmHelper";
    BEGIN
      DotNetExceptionHandler.Collect;

      IF DotNetExceptionHandler.TryCastToType(GETDOTNETTYPE(FaultException)) THEN
        ERROR(AdminEmailPasswordWrongErr);
      IF DotNetExceptionHandler.TryCastToType(GETDOTNETTYPE(FileNotFoundException)) THEN
        ERROR(CRMSolutionFileNotFoundErr);
      IF DotNetExceptionHandler.TryCastToType(CRMHelper.OrganizationServiceFaultExceptionType) THEN
        ERROR(AdminUserDoesNotHavePriviligesErr);
      IF DotNetExceptionHandler.TryCastToType(CRMHelper.SystemNetWebException) THEN
        ERROR(CRMConnectionURLWrongErr);
      DotNetExceptionHandler.Rethrow;
    END;

    PROCEDURE SetupItemAvailabilityService@100();
    VAR
      TenantWebService@1000 : Record 2000000168;
      WebServiceManagement@1001 : Codeunit 9750;
    BEGIN
      WebServiceManagement.CreateTenantWebService(
        TenantWebService."Object Type"::Page,PAGE::"Product Item Availability",'ProductItemAvailability',TRUE);
    END;

    LOCAL PROCEDURE GetIntegrationAdminRoleID@29() : Text;
    BEGIN
      EXIT('8c8d4f51-a72b-e511-80d9-3863bb349780');
    END;

    LOCAL PROCEDURE GetIntegrationUserRoleID@53() : Text;
    BEGIN
      EXIT('6f960e32-a72b-e511-80d9-3863bb349780');
    END;

    BEGIN
    END.
  }
}

```
-->
## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2017 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2017-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
