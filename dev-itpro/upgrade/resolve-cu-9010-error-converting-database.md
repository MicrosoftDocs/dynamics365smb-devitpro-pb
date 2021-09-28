---
title: "Resolving Codeunit 9010 Compilation Error"
description: "Explains how to resolve the compilation error that you get for Codeunit 9010 when converting a database from Dynamics NAV 2018."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Codeunit 9010 Compilation Error 
This article explains how to resolve the compilation error that you get for codeunit **9010 Azure AD User Management** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prod_short.md)].

## Resolution
<!--
In `CreateNewUsersFromAzureAD` function, replace the following code: 

```
PagedUsers := Graph.GetUsersPage(50);

IsFirstPage := TRUE;
REPEAT
  IF NOT IsFirstPage THEN
    PagedUsers.GetNextPage
  ELSE
    IsFirstPage := FALSE;
  FOREACH GraphUser IN PagedUsers.CurrentPage DO
    IF GetUserFromAuthenticationObjectId(GraphUser.ObjectId,User) THEN BEGIN
      UpdateUserFromAzureGraph(User,GraphUser);
      UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
    END ELSE
      CreateNewUserFromGraphUser(GraphUser);
UNTIL (NOT PagedUsers.MorePagesAvailable);
```

With the following code:

```
FOREACH GraphUser IN Graph.GetUsers(50) DO
  IF GetUserFromAuthenticationObjectId(GraphUser.ObjectId,User) THEN BEGIN
    UpdateUserFromAzureGraph(User,GraphUser);
    UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
  END ELSE
    CreateNewUserFromGraphUser(GraphUser);
```

-->
Replace the current code with the following code. For example, you can save the code to a .txt file, then import the file and compile the codeunit.

```
OBJECT Codeunit 9010 Azure AD User Management
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    Permissions=TableData 9004=rimd,
                TableData 9005=rimd,
                TableData 2000000053=rimd,
                TableData 2000000120=rimd,
                TableData 2000000121=rimd,
                TableData 2000000195=rimd;
    OnRun=BEGIN
            IF ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::Background THEN
              EXIT;

            Run(USERSECURITYID);
          END;

  }
  CODE
  {
    VAR
      PermissionManager@1001 : Codeunit 9002;
      ClientTypeManagement@1006 : Codeunit 4;
      Graph@1000 : DotNet "'Microsoft.Dynamics.Nav.AzureADGraphClient, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.AzureADGraphClient.GraphQuery";
      IsInitialized@1003 : Boolean;
      UserDoesNotObjectIdSetErr@1004 : TextConst '@@@="%1 =  The specified User Security ID";ENU=The user with the security ID %1 does not have a valid object ID in Azure Active Directory.';
      CouldNotFindGraphUserErr@1005 : TextConst '@@@="%1 = The specified object id";ENU=An Azure Active Directory user with the object ID %1 was not found.';
      IsTest@1002 : Boolean;

    [Internal]
    PROCEDURE Run@3(ForUserSecurityId@1000 : GUID);
    VAR
      UserProperty@1002 : Record 2000000121;
      PermissionManager@1001 : Codeunit 9002;
    BEGIN
      // This function exists for testability
      IF NOT PermissionManager.SoftwareAsAService THEN
        EXIT;

      IF NOT UserProperty.GET(ForUserSecurityId) THEN
        EXIT;

      //IF NOT PermissionManager.IsFirstLogin(ForUserSecurityId) THEN
      //  EXIT;

      IF GetUserAuthenticationObjectId(ForUserSecurityId) = '' THEN
        EXIT;

      RefreshUserPlanAssignments(ForUserSecurityId);
    END;

    [Internal]
    PROCEDURE RefreshUserPlanAssignments@8(ForUserSecurityId@1000 : GUID);
    VAR
      User@1002 : Record 2000000120;
      GraphUser@1001 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT User.GET(ForUserSecurityId) THEN
        EXIT;

      IF NOT Initialize THEN
        EXIT;

      IF NOT GetGraphUserFromObjectId(ForUserSecurityId,GraphUser) THEN
        EXIT;

      UpdateUserFromAzureGraph(User,GraphUser);
      UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
    END;

    [Internal]
    PROCEDURE GetPlans@44(VAR TempPlan@1001 : TEMPORARY Record 9004;IncludePlansWithoutEntitlement@1006 : Boolean);
    BEGIN
    END;

    [Internal]
    PROCEDURE GetUserPlans@2(VAR TempPlan@1003 : TEMPORARY Record 9004;ForUserSecurityId@1000 : GUID;IncludePlansWithoutEntitlement@1001 : Boolean);
    VAR
      GraphUser@1004 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT Initialize THEN
        EXIT;

      IF GetGraphUserFromObjectId(ForUserSecurityId,GraphUser) THEN
        GetGraphUserPlans(TempPlan,GraphUser,IncludePlansWithoutEntitlement);
    END;

    [Internal]
    PROCEDURE CreateNewUsersFromAzureAD@11();
    VAR
      User@1013 : Record 2000000120;
      GraphUser@1001 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT Initialize THEN
        EXIT;

      FOREACH GraphUser IN Graph.GetUsers(50) DO
        IF GetUserFromAuthenticationObjectId(GraphUser.ObjectId,User) THEN BEGIN
          UpdateUserFromAzureGraph(User,GraphUser);
          UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
        END ELSE
          CreateNewUserFromGraphUser(GraphUser);
    END;

    PROCEDURE CreateNewUserFromGraphUser@47(GraphUser@1003 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo");
    VAR
      UserAccountHelper@1001 : DotNet "'Microsoft.Dynamics.Nav.NavUserAccount, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.NavUserAccount.NavUserAccountHelper";
      NewUserSecurityId@1002 : GUID;
    BEGIN
      IF IsGraphUserEntitledFromServicePlan(GraphUser) THEN BEGIN
        EnsureAuthenticationEmailIsNotInUse(GraphUser.UserPrincipalName);
        COMMIT;
        NewUserSecurityId := UserAccountHelper.CreateUserFromAzureADObjectId(GraphUser.ObjectId);
        IF NOT ISNULLGUID(NewUserSecurityId) THEN
          InitializeAsNewUser(NewUserSecurityId,GraphUser);
      END;
    END;

    LOCAL PROCEDURE RemoveUnassignedUserPlans@42(VAR TempO365Plan@1006 : TEMPORARY Record 9004;ForUserSecurityId@1003 : GUID);
    VAR
      NavUserPlan@1002 : Record 9005;
      TempNavUserPlan@1004 : TEMPORARY Record 9005;
    BEGIN
      // Have any plans been removed from this user in O365, since last time he logged-in to NAV?
      // Get all plans assigned to the user, in NAV
      NavUserPlan.SETRANGE("User Security ID",ForUserSecurityId);
      IF NavUserPlan.FINDSET THEN
        REPEAT
          TempNavUserPlan.COPY(NavUserPlan,FALSE);
          TempNavUserPlan.INSERT;
        UNTIL NavUserPlan.NEXT = 0;

      // Get all plans assigned to the user in Office
      IF TempO365Plan.FINDSET THEN
        // And remove them from the list of plans assigned to the user
        REPEAT
          TempNavUserPlan.SETRANGE("Plan ID",TempO365Plan."Plan ID");
          IF NOT TempNavUserPlan.ISEMPTY THEN
            TempNavUserPlan.DELETEALL;
        UNTIL TempO365Plan.NEXT = 0;

      // If any plans belong to the user in NAV, but not in Office, de-assign them
      TempNavUserPlan.SETRANGE("Plan ID");
      IF TempNavUserPlan.FINDSET THEN
        REPEAT
          NavUserPlan.SETRANGE("Plan ID",TempNavUserPlan."Plan ID");
          IF NavUserPlan.FINDFIRST THEN BEGIN
            NavUserPlan.LOCKTABLE;
            NavUserPlan.DELETE;
            RemoveUserGroupsForUserAndPlan(NavUserPlan);
            IF NOT IsTest THEN
              COMMIT; // Finalize the transaction. Else any further error can rollback and create elevation of priviledge
          END;
        UNTIL TempNavUserPlan.NEXT = 0;
    END;

    PROCEDURE GetCurrentUserTokenClaim@27(ClaimName@1001 : Text) : Text;
    VAR
      UserAccountHelper@1000 : DotNet "'Microsoft.Dynamics.Nav.NavUserAccount, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.NavUserAccount.NavUserAccountHelper";
    BEGIN
      EXIT(UserAccountHelper.GetCurrentUserTokenClaim(ClaimName));
    END;

    LOCAL PROCEDURE AddNewlyAssignedUserPlans@46(VAR TempO365Plan@1006 : TEMPORARY Record 9004;ForUserSecurityId@1003 : GUID);
    VAR
      NavUserPlan@1002 : Record 9005;
      PermissionManager@1005 : Codeunit 9002;
    BEGIN
      // Have any plans been added to this user in O365, since last time he logged-in to NAV?
      // For each plan assigned to the user in Office
      IF TempO365Plan.FINDSET THEN
        REPEAT
          // Does this assignment exist in NAV? If not, add it.
          NavUserPlan.SETRANGE("Plan ID",TempO365Plan."Plan ID");
          NavUserPlan.SETRANGE("User Security ID",ForUserSecurityId);
          IF NavUserPlan.ISEMPTY THEN BEGIN
            InsertFromTempPlan(TempO365Plan);
            NavUserPlan.LOCKTABLE;
            NavUserPlan.INIT;
            NavUserPlan."Plan ID" := TempO365Plan."Plan ID";
            NavUserPlan."User Security ID" := ForUserSecurityId;
            NavUserPlan.INSERT;
            // The SUPER role is replaced with O365 FULL ACCESS for new users.
            // This happens only for users who are created from O365 (i.e. are added to plans)
            PermissionManager.UpdateUserAccessForSaaS(NavUserPlan."User Security ID");
            IF NOT IsTest THEN
              COMMIT; // Finalize the transaction. Else any further error can rollback and create elevation of priviledge
          END;
        UNTIL TempO365Plan.NEXT = 0;
    END;

    LOCAL PROCEDURE GetGraphUserPlans@13(VAR TempPlan@1008 : TEMPORARY Record 9004;VAR GraphUser@1000 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";IncludePlansWithoutEntitlement@1001 : Boolean);
    VAR
      AssignedPlan@1004 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.ServicePlanInfo";
      DirectoryRole@1002 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.RoleInfo";
      ServicePlanIdValue@1009 : Variant;
      IsSystemRole@1005 : Boolean;
      AssignedPlans@1003 : DotNet "'mscorlib, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Collections.IEnumerable";
    BEGIN
      TempPlan.RESET;
      TempPlan.DELETEALL;

      IF NOT ISNULL(GraphUser.AssignedPlans) THEN
        // Loop through assigned Azzure AD Plans
        FOREACH AssignedPlan IN GraphUser.AssignedPlans DO
          IF AssignedPlan.CapabilityStatus = 'Enabled' THEN BEGIN
            ServicePlanIdValue := AssignedPlan.ServicePlanId;
            IF IncludePlansWithoutEntitlement OR IsNavServicePlan(ServicePlanIdValue) THEN
              AddToTempPlan(ServicePlanIdValue,AssignedPlan.ServicePlanName,TempPlan);
          END;

      // If there are no Azure AD Plans, loop through Azure AD Roles
      IF ISNULL(GraphUser.AssignedPlans) THEN
        FOREACH DirectoryRole IN GraphUser.Roles DO BEGIN
          EVALUATE(IsSystemRole,FORMAT(DirectoryRole.IsSystem));
          IF IncludePlansWithoutEntitlement OR IsSystemRole THEN
            AddToTempPlan(DirectoryRole.RoleTemplateId,DirectoryRole.DisplayName,TempPlan);
        END;
    END;

    [TryFunction]
    LOCAL PROCEDURE GetGraphUserFromObjectId@1(ForUserSecurityID@1000 : GUID;VAR GraphUser@1001 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo");
    VAR
      UserObjectID@1002 : Text;
    BEGIN
      IF ForUserSecurityID = USERSECURITYID THEN BEGIN
        GraphUser := Graph.GetCurrentUser;
        IF NOT ISNULL(GraphUser) THEN
          EXIT;
      END;

      UserObjectID := GetUserAuthenticationObjectId(ForUserSecurityID);
      IF UserObjectID = '' THEN
        ERROR(CouldNotFindGraphUserErr,UserObjectID);

      GraphUser := Graph.GetUserByObjectId(UserObjectID);
      IF ISNULL(GraphUser) THEN
        ERROR(CouldNotFindGraphUserErr,UserObjectID);
    END;

    LOCAL PROCEDURE InsertFromTempPlan@17(VAR TempPlan@1000 : TEMPORARY Record 9004);
    VAR
      Plan@1001 : Record 9004;
    BEGIN
      IF NOT Plan.GET(TempPlan."Plan ID") THEN BEGIN
        Plan.INIT;
        Plan.COPY(TempPlan);
        Plan.INSERT;
      END;
    END;

    LOCAL PROCEDURE IsGraphUserEntitledFromServicePlan@18(VAR GraphUser@1000 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo") : Boolean;
    VAR
      AssignedPlan@1010 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.ServicePlanInfo";
      ServicePlanIdValue@1020000 : Variant;
    BEGIN
      FOREACH AssignedPlan IN GraphUser.AssignedPlans DO BEGIN
        ServicePlanIdValue := AssignedPlan.ServicePlanId;
        IF IsNavServicePlan(ServicePlanIdValue) THEN
          EXIT(TRUE);
      END;

      EXIT(FALSE);
    END;

    LOCAL PROCEDURE IsNavServicePlan@26(ServicePlanId@1001 : DotNet "'mscorlib, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Guid") : Boolean;
    VAR
      Plan@1000 : Record 9004;
    BEGIN
      EXIT(Plan.GET(ServicePlanId.ToString('D')));
    END;

    PROCEDURE GetUserObjectId@20(ForUserSecurityId@1002 : GUID) : Text[250];
    VAR
      User@1001 : Record 2000000120;
      GraphUser@1000 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT User.GET(ForUserSecurityId) THEN
        EXIT('');

      IF NOT GetGraphUserFromObjectId(ForUserSecurityId,GraphUser) THEN
        EXIT('');

      EXIT(COPYSTR(GraphUser.ObjectId,1,250));
    END;

    LOCAL PROCEDURE GetUserAuthenticationObjectId@7(ForUserSecurityId@1000 : GUID) : Text;
    VAR
      UserProperty@1002 : Record 2000000121;
    BEGIN
      IF NOT UserProperty.GET(ForUserSecurityId) THEN
        ERROR(UserDoesNotObjectIdSetErr,ForUserSecurityId);

      EXIT(UserProperty."Authentication Object ID");
    END;

    LOCAL PROCEDURE GetUserFromAuthenticationObjectId@12(AuthenticationObjectId@1000 : Text;VAR FoundUser@1001 : Record 2000000120) : Boolean;
    VAR
      UserProperty@1002 : Record 2000000121;
    BEGIN
      UserProperty.SETRANGE("Authentication Object ID",AuthenticationObjectId);
      IF UserProperty.FINDFIRST THEN
        EXIT(FoundUser.GET(UserProperty."User Security ID"));
      EXIT(FALSE)
    END;

    [Internal]
    PROCEDURE GetAzureUserPlanRoleCenterId@1020(ForUserSecurityId@1003 : GUID) : Integer;
    VAR
      TempO365Plan@1001 : TEMPORARY Record 9004;
      User@1005 : Record 2000000120;
      GraphUser@1006 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT User.GET(ForUserSecurityId) THEN
        EXIT(0);

      IF NOT Initialize THEN
        EXIT(0);

      IF NOT GetGraphUserFromObjectId(ForUserSecurityId,GraphUser) THEN
        EXIT(0);

      GetGraphUserPlans(TempO365Plan,GraphUser,FALSE);

      TempO365Plan.SETFILTER("Role Center ID",'<>0');

      IF NOT TempO365Plan.FINDFIRST THEN
        EXIT(0);

      EXIT(TempO365Plan."Role Center ID");
    END;

    [TryFunction]
    PROCEDURE TryGetAzureUserPlanRoleCenterId@4(VAR RoleCenterID@1001 : Integer;ForUserSecurityId@1000 : GUID);
    BEGIN
      RoleCenterID := GetAzureUserPlanRoleCenterId(ForUserSecurityId);
    END;

    LOCAL PROCEDURE UpdateUserFromAzureGraph@15(VAR User@1001 : Record 2000000120;VAR GraphUser@1002 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo") : Boolean;
    VAR
      ModifyUser@1003 : Boolean;
      TempString@1004 : Text;
    BEGIN
      IF (UPPERCASE(FORMAT(GraphUser.AccountEnabled)) = 'TRUE') AND (User.State = User.State::Disabled) THEN BEGIN
      User.State := User.State::Enabled;
      ModifyUser := TRUE;
      END;

      IF (UPPERCASE(FORMAT(GraphUser.AccountEnabled)) = 'FALSE') AND (User.State = User.State::Enabled) THEN BEGIN
      User.State := User.State::Disabled;
      ModifyUser := TRUE;
      END;

      TempString := GraphUser.GivenName;
      IF GraphUser.Surname <> '' THEN
      TempString := TempString + ' ';
      TempString := TempString + GraphUser.Surname;
      TempString := COPYSTR(TempString,1,MAXSTRLEN(User."Full Name"));
      IF LOWERCASE(User."Full Name") <> LOWERCASE(TempString) THEN BEGIN
      User."Full Name" := TempString;
      ModifyUser := TRUE;
      END;

      TempString := FORMAT(GraphUser.Mail);
      TempString := COPYSTR(TempString,1,MAXSTRLEN(User."Contact Email"));
      IF LOWERCASE(User."Contact Email") <> LOWERCASE(TempString) THEN BEGIN
      User."Contact Email" := TempString;
      ModifyUser := TRUE;
      END;

      TempString := COPYSTR(GraphUser.UserPrincipalName,1,MAXSTRLEN(User."Authentication Email"));
      IF LOWERCASE(User."Authentication Email") <> LOWERCASE(TempString) THEN BEGIN
        // Clear current authentication mail
        User."Authentication Email" := '';
        User.MODIFY;
        ModifyUser := FALSE;

        EnsureAuthenticationEmailIsNotInUse(TempString);
        UpdateAuthenticationEmail(User,GraphUser);
      END;

      IF ModifyUser THEN
        User.MODIFY;

      SetUserLanguage(GraphUser.PreferredLanguage);

      EXIT(ModifyUser);
    END;

    LOCAL PROCEDURE UpdateUserPlansFromAzureGraph@23(ForUserSecurityId@1003 : GUID;VAR GraphUser@1000 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo");
    VAR
      TempO365Plan@1001 : TEMPORARY Record 9004;
    BEGIN
      GetGraphUserPlans(TempO365Plan,GraphUser,FALSE);

      // Have any plans been removed from this user in O365, since last time he logged-in to NAV?
      RemoveUnassignedUserPlans(TempO365Plan,ForUserSecurityId);

      // Have any plans been added to this user in O365, since last time he logged-in to NAV?
      AddNewlyAssignedUserPlans(TempO365Plan,ForUserSecurityId);
    END;

    [Internal]
    PROCEDURE UpdateUserPlansFromAzureGraphAllUsers@22();
    VAR
      User@1000 : Record 2000000120;
      GraphUser@1002 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
    BEGIN
      IF NOT Initialize THEN
        EXIT;

      User.SETFILTER("License Type",'<>%1',User."License Type"::"External User");
      User.SETFILTER("Windows Security ID",'=''''');

      IF NOT User.FINDSET THEN
        EXIT;

      REPEAT
        IF GetGraphUserFromObjectId(User."User Security ID",GraphUser) THEN
          UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
      UNTIL User.NEXT = 0;
    END;

    LOCAL PROCEDURE AddToTempPlan@16(ServicePlanId@1000 : GUID;ServicePlanName@1001 : Text;VAR TempPlan@1002 : TEMPORARY Record 9004);
    VAR
      Plan@1003 : Record 9004;
    BEGIN
      WITH TempPlan DO BEGIN
        IF GET(ServicePlanId) THEN
          EXIT;

        IF Plan.GET(ServicePlanId) THEN;

        INIT;
        "Plan ID" := ServicePlanId;
        Name := COPYSTR(ServicePlanName,1,MAXSTRLEN(Name));
        "Role Center ID" := Plan."Role Center ID";
        INSERT;
      END;
    END;

    LOCAL PROCEDURE EnsureAuthenticationEmailIsNotInUse@37(AuthenticationEmail@1000 : Text);
    VAR
      User@1001 : Record 2000000120;
      ModifiedUser@1002 : Record 2000000120;
      GraphUser@1003 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo";
      UserSecurityId@1005 : GUID;
    BEGIN
      // Clear all duplicate authentication email.
      User.SETRANGE("Authentication Email",COPYSTR(AuthenticationEmail,1,MAXSTRLEN(User."Authentication Email")));
      IF NOT User.FINDFIRST THEN
        EXIT;
      REPEAT
        UserSecurityId := User."User Security ID";
        // Modifying the user authentication email breaks the connection to AD by clearing the Authentication Object Id
        User."Authentication Email" := '';
        User.MODIFY;

        // Cascade changes to authentication email, terminates at the first time an authentication email is not found.
        IF GetGraphUserFromObjectId(User."User Security ID",GraphUser) THEN BEGIN
          EnsureAuthenticationEmailIsNotInUse(GraphUser.UserPrincipalName);
          IF ModifiedUser.GET(UserSecurityId) THEN
            UpdateAuthenticationEmail(ModifiedUser,GraphUser);
        END;
      UNTIL NOT User.FINDFIRST;
    END;

    LOCAL PROCEDURE UpdateAuthenticationEmail@38(VAR User@1000 : Record 2000000120;VAR GraphUser@1001 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo");
    VAR
      NavUserAuthenticationHelper@1002 : DotNet "'Microsoft.Dynamics.Nav.NavUserAccount, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.NavUserAccount.NavUserAccountHelper";
    BEGIN
      User."Authentication Email" := COPYSTR(GraphUser.UserPrincipalName,1,MAXSTRLEN(User."Authentication Email"));
      User.MODIFY;
      NavUserAuthenticationHelper.SetAuthenticationObjectId(User."User Security ID",GraphUser.ObjectId);
    END;

    LOCAL PROCEDURE SetUserLanguage@24(PreferredLanguage@1000 : Text);
    VAR
      Language@1002 : Record 8;
      UserPersonalization@1004 : Record 2000000073;
      ApplicationManagement@1005 : Codeunit 1;
      IdentityManagement@1006 : Codeunit 9801;
      LanguageCode@1003 : Code[10];
      LanguageId@1001 : Integer;
    BEGIN
      //IF NOT IdentityManagement.IsInvAppId THEN
      //  EXIT;

      LanguageId := ApplicationManagement.ApplicationLanguage;

      // We will use default application language if the PreferredLanguage is blank or en-us
      // (i.e. don't spend time trying to lookup the code)
      IF NOT (LOWERCASE(PreferredLanguage) IN ['','en-us']) THEN
        IF TryGetLanguageCode(PreferredLanguage,LanguageCode) THEN ;

      // If we support the language, get the language id
      // If we don't, we keep the current value (default application language)
      IF LanguageCode <> '' THEN
        IF Language.GET(LanguageCode) THEN
          LanguageId := Language."Windows Language ID";

      IF NOT UserPersonalization.GET(USERSECURITYID) THEN
        EXIT;

      // Only lock the table if there is a change
      IF UserPersonalization."Language ID" = LanguageId THEN
        EXIT; // No changes required

      UserPersonalization.LOCKTABLE;
      UserPersonalization.GET(USERSECURITYID);
      UserPersonalization.VALIDATE("Language ID",LanguageId);
      UserPersonalization.VALIDATE("Locale ID",LanguageId);
      UserPersonalization.MODIFY(TRUE);
    END;

    [TryFunction]
    LOCAL PROCEDURE TryGetLanguageCode@25(CultureName@1000 : Text;VAR CultureCode@1002 : Code[10]);
    VAR
      CultureInfo@1001 : DotNet "'mscorlib, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Globalization.CultureInfo";
    BEGIN
      CultureInfo := CultureInfo.CultureInfo(CultureName);
      CultureCode := CultureInfo.ThreeLetterWindowsLanguageName;
    END;

    LOCAL PROCEDURE InitializeAsNewUser@5(NewUserSecurityId@1000 : GUID;VAR GraphUser@1001 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.UserInfo");
    VAR
      User@1003 : Record 2000000120;
    BEGIN
      User.GET(NewUserSecurityId);

      UpdateUserFromAzureGraph(User,GraphUser);
      UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
    END;

    LOCAL PROCEDURE Initialize@9() : Boolean;
    BEGIN
      IF NOT PermissionManager.SoftwareAsAService THEN
        EXIT(FALSE);

      IF IsInitialized THEN
        EXIT(TRUE);

      IF CanHandle THEN BEGIN
        IF NOT TryCreateGraph(Graph) THEN
          EXIT(FALSE)
      END ELSE
        OnInitialize(Graph);

      IsInitialized := NOT ISNULL(Graph);
      EXIT(IsInitialized);
    END;

    [TryFunction]
    LOCAL PROCEDURE TryCreateGraph@10(VAR GraphQuery@1000 : DotNet "'Microsoft.Dynamics.Nav.AzureADGraphClient, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.AzureADGraphClient.GraphQuery");
    BEGIN
      GraphQuery := GraphQuery.GraphQuery
    END;

    LOCAL PROCEDURE CanHandle@6() : Boolean;
    VAR
      AzureADMgtSetup@1000 : Record 6303;
    BEGIN
      IF AzureADMgtSetup.GET THEN
        EXIT(AzureADMgtSetup."Azure AD User Mgt. Codeunit ID" = CODEUNIT::"Azure AD User Management");

      EXIT(TRUE);
    END;

    LOCAL PROCEDURE RemoveUserGroupsForUserAndPlan@19(UserPlan@1002 : Record 9005);
    VAR
      UserGroupMember@1000 : Record 9001;
      UserGroupPlan@1001 : Record 9007;
    BEGIN
      // Remove related user groups from the user
      UserGroupPlan.SETRANGE("Plan ID",UserPlan."Plan ID");
      IF NOT UserGroupPlan.FINDSET THEN
        EXIT; // no user groups to remove from this user

      UserGroupMember.SETRANGE("User Security ID",UserPlan."User Security ID");
      REPEAT
        UserGroupMember.SETRANGE("User Group Code",UserGroupPlan."User Group Code");
        UserGroupMember.DELETEALL;
      UNTIL UserGroupPlan.NEXT = 0;
    END;

    [Integration(DEFAULT,TRUE)]
    [External]
    LOCAL PROCEDURE OnInitialize@21(VAR GraphQuery@1000 : DotNet "'Microsoft.Dynamics.Nav.AzureADGraphClient, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.AzureADGraphClient.GraphQuery");
    BEGIN
    END;

    [External]
    PROCEDURE GetTenantDetail@14(VAR TenantDetail@1000 : DotNet "'Microsoft.Dynamics.Nav.LicensingService.Model, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.LicensingService.Model.TenantInfo") : Boolean;
    BEGIN
      IF ISNULL(TenantDetail) THEN;
      EXIT(FALSE);
    END;

    [External]
    PROCEDURE SetTestability@140(EnableTestability@1000 : Boolean);
    BEGIN
      IsTest := EnableTestability;
    END;

    BEGIN
    END.
  }
}
```

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
