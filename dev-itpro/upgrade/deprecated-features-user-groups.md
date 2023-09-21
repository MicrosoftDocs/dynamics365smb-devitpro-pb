---
title: Migrate from User Groups to Permission Sets or Security Groups
description: This article describes why we've deprecated user groups, and provides developers with examples of how they can uptake the change in their extensions. 
author: brentholtorf
ms.author: bholtorf
ms.date: 08/24/2023
ms.reviewer: ihhandzi
ms.topic: conceptual
ms.custom: bap-template
---

# Migrate from User Groups to Permission Sets or Security Groups

[!INCLUDE [2023_releasewave1](../includes/2023_releasewave1.md)]

The recent improvements to permission set features and the introduction of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] security groups made user groups redundant. Therefore, to streamline permission management, we've deprecated user groups.

This article provides developers with examples of how they can update their extensions to accommodate the change.

To learn more about permission sets, go to [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

## Optional: Security groups

You have the option of assigning permission sets to security groups. In terms of managing permissions, security groups work in the same way as user groups.
 
However, user groups were only relevant for [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. Security groups are based on the security groups in Microsoft Entra ID or Windows Active Directory, depending on whether you're using [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online or on-premises, respectively. That means administrators can use them with other Dynamics 365 apps. For example, if salespeople use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and SharePoint, administrators don't have to recreate the group and its members. To learn more, go to [Control Access to Business Central Using Security Groups](/dynamics365/business-central/ui-security-groups).

## Example scenarios

Depending on how your extensions leverage user groups, the actions you need to take might differ. In some cases, you'll only need to change your code to use permission sets. In other cases, you'll need to use security groups. You might even want to do both.

The following examples show how to update your extension to address various scenarios. The examples include both how you could handle the scenarios before, and how to handle them now.

### Example: Your extension creates user groups

The following example shows how to create permission sets instead of user groups.

**Before**

```al
    local procedure InsertUserGroup(UserGroupCode: Code[20]; UserGroupName: Text[50])
    var
        UserGroup: Record "User Group";
    begin
        if UserGroup.Get(UserGroupCode) then
            exit;

        UserGroup.Code := UserGroupCode;
        UserGroup.Name := UserGroupName;
        UserGroup.Insert();
		
		// More logic, for example, adding permission sets to the user group by inserting records into the "User Group Permission Set" table.
    end;
```

**After**

The preferred way is to create a new object of the type `permissionset`.

```al
    permissionset 9999 "Permission set code"
    {
        Assignable = true;
        Caption 'Permission set name';

        IncludedPermissionSets = ...; // This is similar to adding permission sets to the user group by inserting records into the "User Group Permission Set" table.

        Permissions = ...;
    }

```
Alternatively, you can create a tenant permission set dynamically.

```al
    local procedure CreateNewTenantPermissionSet(PermissionSetRoleID: Code[20]; PermissionSetName: Text[30])
    var
        TenantPermissionSet: Record "Tenant Permission Set";
        NullGuid: Guid;
    begin
        TenantPermissionSet.SetRange("App ID", NullGuid);
        TenantPermissionSet.SetRange("Role ID", PermissionSetRoleID);
        if not TenantPermissionSet.IsEmpty() then
            exit;

        TenantPermissionSet."App ID" := NullGuid;
        TenantPermissionSet."Role ID" := PermissionSetRoleID;
        TenantPermissionSet.Name := PermissionSetName;
        TenantPermissionSet.Insert();
        
		// More logic, e. g. adding permission sets to the parent permission set by calling CreateTenantPermissionSetRelation
    end;
	
	local procedure CreateTenantPermissionSetRelation(RoleId: Code[20]; RelatedRoleID: Code[20]; RelatedAppId: Guid; RelatedScope: Option System,Tenant; PermissionType: Option Include,Exclude)
    var
        TenantPermissionSetRel: Record "Tenant Permission Set Rel.";
        NullGuid: Guid;
    begin
        TenantPermissionSetRel.Init();
        TenantPermissionSetRel."Role ID" := CopyStr(RoleId, 1, MaxStrLen(TenantPermissionSetRel."Role ID"));
        TenantPermissionSetRel."App ID" := NullGuid;
        TenantPermissionSetRel."Related Role ID" := RelatedRoleID;
        TenantPermissionSetRel."Related App ID" := RelatedAppId;
        TenantPermissionSetRel."Related Scope" := RelatedScope;
        TenantPermissionSetRel.Type := PermissionType;
        TenantPermissionSetRel.Insert();
    end;
```

### Example: You add members to user groups through code

The following example shows how to rewrite your code to assign permission sets to users instead of adding members to user groups.

**Before**

```al
    local procedure AssignUserGroupToUser(InputUserGroupCode: Code[20]; InputUserSecurityID: Guid)
    var
        UserGroupMember: Record "User Group Member";
    begin
        if UserGroupIsAssignedToUser(InputUserGroupCode, InputUserSecurityID) then
            exit;

        UserGroupMember."User Group Code" := InputUserGroupCode;
        UserGroupMember."User Security ID" := InputUserSecurityID;
        UserGroupMember.Insert(true);
    end;

    local procedure IsUserGroupAssignedToUser(InputUserGroupCode: Code[20]; InputUserSecurityID: Guid): Boolean
    var
        UserGroupMember: Record "User Group Member";
    begin
        UserGroupMember.SetRange("User Group Code", InputUserGroupCode);
        UserGroupMember.SetRange("User Security ID", InputUserSecurityID);
        exit(not UserGroupMember.IsEmpty());
    end;
```

**After**

```al
    local procedure AssignPermissionSetToUser(PermissionSetRoleId: Code[20]; InputUserSecurityID: Guid)
    var
        AccessControl: Record "Access Control";
        AggregatePermissionSet: Record "Aggregate Permission Set";
    begin
        if IsPermissionSetAssignedToUser(PermissionSetRoleId, InputUserSecurityID) then
            exit;

        AggregatePermissionSet.SetRange("Role ID", PermissionSetRoleId);
        if not AggregatePermissionSet.FindFirst() then
            exit;

        AccessControl."Role Id" := PermissionSetRoleId;
        AccessControl."User Security ID" := InputUserSecurityID;
        AccessControl.Scope := AccessControl.Scope::System;
        AccessControl."App ID" := AggregatePermissionSet."App ID";
        if AccessControl.Insert() then;
    end;

    local procedure IsPermissionSetAssignedToUser(PermissionSetRoleId: Code[20]; InputUserSecurityID: Guid): Boolean
    var
        AccessControl: Record "Access Control";
    begin
        AccessControl.SetRange("Role Id", PermissionSetRoleId);
        AccessControl.SetRange("User Security ID", InputUserSecurityID);
        exit(not AccessControl.IsEmpty());
    end;
```

### Example: Your extension provides capabilities to groups of users

The following example shows how to rewrite your code to use the grouping mechanism in security groups to group users in the same way as you did using user groups.

**Before**

```al
    local procedure DoStuffIfUserGroupMember(InputUserGroupCode: Code[20]; InputUserSecurityID: Guid)
    var
        UserGroupMember: Record "User Group Member";
    begin
        UserGroupMember.SetRange("User Group Code", InputUserGroupCode);
        UserGroupMember.SetRange("User Security ID", InputUserSecurityID);
        if not UserGroupMember.IsEmpty() then
            ...
            // Apply extension-specific capabilities to a member. 
    end;
```

**After**

```al
    local procedure DoStuffIfSecurityGroupMember(InputSecurityGroupCode: Code[20]; InputUserSecurityID: Guid)
    var
        SecurityGroupMemberBuffer: Record "Security Group Member Buffer";
        SecurityGroup: Codeunit "Security Group";
    begin
        SecurityGroup.GetMembers(SecurityGroupMemberBuffer);
        SecurityGroupMemberBuffer.SetRange("Security Group Code", InputSecurityGroupCode);
        SecurityGroupMemberBuffer.SetRange("User Security ID", InputUserSecurityID);
        if not SecurityGroupMemberBuffer.IsEmpty() then
            ...
            // Apply extension-specific capabilities to a member. 
    end;
```

### Example: Your extension relies on default profiles from user groups

The default profile functionality can no longer be dynamically defined for groups of users. Instead, use the **Profiles (Roles)** page to specify a default profile for your company. To learn more about default profiles, go to [Manage User Profiles](/dynamics365/business-central/admin-users-profiles-roles). 

### Example: You add actions, fields, or controls to user group pages

If you extend the user group functionality by adding actions, fields, or controls, you can add them to pages related to permission sets and security groups. The following example shows how to do that.

**Before**

```al
    pageextension 9999 "New Group Functionality" extends "User Group Members"
    {
        actions
        {
            addlast(creation)
            {
                action(ApplyFunctionalityToMembers)
                {
                    ...
                }
            }
        }
    }
```
**After**

```al
    pageextension 9999 "New Group Functionality" extends "Security Group Members"
    {
        actions
        {
            addlast(Processing)
            {
                action(ApplyFunctionalityToMembers)
                {
                    ...
                }
            }
        }
    }
    ...
    pageextension 9998 "New Group Functionality" extends "Perm. Set Assignments Part"
    {
        actions
        {
            addlast(Processing)
            {
                action(ApplyFunctionalityToUsersWithPermissionSet)
                {
                    ...
                }
            }
        }
    }
```

## Deprecated objects 

The following objects are deprecated. To make these objects easy to find in the code, we've added a `[220_UserGroups]` tag to the obsolete reason.

|Name  |Object type  |
|---------|---------|
|User Group|table|
|User Group Member|table|
|User Group Access Control|table|
|User Group Permission Set|table|
|User Group Plan|table|
|Users in User Groups Chart|page|
|Default User Groups In Plan|page|
|Custom User Groups In Plan|page|
|User Group Plan FactBox|page|
|User Groups FactBox|page|
|User Groups|page|
|User Group Members|page|
|User Group Members FactBox|page|
|User Groups User SubPage|page|
|User Group Permission Sets|page|
|User Group Permissions FactBox|page|
|User Group Memberships FactBox|page|
|Permission Set by User Group|page|
|User by User Group|page|
|User Group by Plan|page|
|Users in User Groups|query|
|Copy User Group|report|
|Export/Import User Groups|xmlport|
|Export/Import Plans|xmlport|

## Objects that can help you migrate

The following table lists the objects we've introduced to make it easier for you to migrate your extension to use permission sets instead of user groups.

|Name  |Object type  |Comment  |
|---------|---------|---------|
|Legacy User Groups|codeunit|Check whether user groups are enabled in the environment.|
|User Groups Migration Guide|page|A guide that can help you convert user groups to permission sets. To learn more, go to [Optional: Convert user groups to permission sets](/dynamics365/business-central/ui-security-groups#optional-convert-user-groups-to-permission-sets). |
  
## See also

[Deprecated Features in the Base App](/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1)  
[Best Practices for Deprecation of AL Code](/dynamics365/business-central/dev-itpro/developer/devenv-deprecation-guidelines)  
[Microsoft Timeline for Deprecating Code in Business Central](/dynamics365/business-central/dev-itpro/developer/devenv-deprecation-timeline)  
