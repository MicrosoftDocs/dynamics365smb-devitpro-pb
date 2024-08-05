---
title: "Developing for Upgrade"
author: jswymer
ms.date: 10/01/2018
ms.topic: article
---
# Deploying and Developing for Upgrade

When you upgrade [!INCLUDE[navnowlong](includes/navnowlong_md.md)] from one version to the next, whether its a cumulative update or full-version update, a platform update or application update, there will most likely be a period where customers cannot access their application and data. If this downtime is crucial for your customers, there are deployment, development, and upgrade practices that you can leverage to minimize this downtime that  which focus on:

-   Prioritize upgrade work to be before or after the offline window
-   Eliminate upgrade tasks
-   Avoid unnecessary copying of data
 
-   Things you can do prior to the actual upgrade
-   Things you can eliminate from the process all together
-   Things you can do during the upgrade
-   Things you can postpone to after the upgrade

## Switch to a multitenant deployment
In a multitenant deployment, instead of a single database for the application and business data, there is one database for the application and one business data database for each tenant of the application, referred to as the *tenant database*. Most of the concepts discussed in this article are only relevant in a multitenant deployment environment.

## Avoid breaking changes to tables
Breaking, or destructive, changes to a table definition are changes that can affect the tenant's business data, potentially resulting in data loss if not handled. These changes include:  

-   Deleting a table.
-   Deleting a field.
-   Changing a field's data type.
-   Changing a field's class.
-   Changing the SQL data type of a field.
-   Decreasing the length of data in a field.
-   Changing the primary key of a table, such as removing a field from the key.
-   Changing the ID of a table field.

### When you do have to make breaking changes

Table objects, table field controls, and table keys include the **ObsoleteState** and **ObsoleteReason** properties that can be used to inform other developers when a table, field, or key will or has become obsolete (deprecated).  

 Allow only upgrade code access to deprecated fields and tables (buffer table substitute).

## Things you can do prior to the actual upgrade
You should prioritize any part of an upgrade process that can be done prior to disconnecting the customer.
Store data in static system tables in application database
Provided your application does not make changes to data in the application data (“static data“), you can upgrade and add data in these tables prior to deploying the new version. Dynamics NAV 2018 added three new tables to support this purpose:
-   Media Resources (2000000182)
-   Report Layout (2000000082)
-	Upgrade Blob Storage (2000000081)

The “no breaking schema changes” requirement builds on a setup where two application versions and hence multiple NAV servers accesses a single tenant database. See (topic=DUALNST).
Schema synchronization of base application
Some schema changes can be applied with customers still working on the older version. This includes adding new tables, fields, or indexes, but not removal or renaming of tables, fields, or indexes. See [topic=BRKCHG] and [topic=DUALNST].
Schema synchronization of extensions (requires no breaking schema changes mode) (see topic= BRKCHG,2)
Specifically, for V2 extension some schema changes can be applied are still working on the older version. This includes adding new tables, fields, or indexes, but not removal or renaming of tables, fields, or indexes. Dynamics NAV 2018 introduces a separate PowerShell Sync-NAVApp cmdlet for this purpose.
V1 extensions must still be uninstalled before upgrade and re-installed after.

Things you can eliminate from the process all together
Convert extensions to V2 extension, as this eliminates the need for uninstalling and re-installing extensions. This removes the need for costly schema synchronization and data copying during base application upgrades. See …

Things you can do during the upgrade
Once the customer is taken offline, the upgrade takes the time it must take, depending on amounts of data, upgrade code and so on. However, in a multi-tenant setup no other customers have to be offline until explicitly upgraded.  (mjens: any gain here?) 

Things you can postpone until after the upgrade
It has been observer that BLOB fields tend to be part of upgrades despite rare usages of these data (e.g. report layout). Wherever possible, consider if it is possible to include your own version number to BLOBs containing XML or JSON files. Then you can add code on retrieval to check the version and upgrade on-the-fly. 
(mjens: ask Bogdana about a pattern for this)
(mjens: does Microsoft do this anywhere)



Paradigm: “No Breaking Schema Changes” (topic=BRKCHG)
By applying a set of simple rules and used a set of tools supporting that, it is possible to run two or more versions of Dynamics NAV 2018 against a single database (tenant database). This allows the administrator to plan a tenant upgrade differently that in the past. Please refer to (topic=DEVBRKCHG) for the tools supporting this mode, and to (topic=DUALNST) for a description multiple application versions accessing the same tenant database.

Development: “No Breaking Schema Changes” (topic=DEVBRKCHG)
To support the “no breaking changes” mode, Dynamics NAV 2018 introduces a set of different tools. The first few are for guarding against unintentional changes to schema.

Guarding against breaking changes: C/SIDE
Available from the Dynamics NAV 2018 Development Shell, a PowerShell cmdlet has been added: Test-NAVTableObject. Use this to check against a reference version of your choice. [Tip] This is available from Dynamics NAV 2018, CU3.
Guarding against breaking changes: VS Code
PowerShell script CheckV2ExtensionsDesctructiveChanges is available from the Dynamics NAV 2018 DVD (release media) in <folder>. Use this to check V2 extensions against a reference version of your choice. 
[mjens] [Tip] <available on Modern Dev docker images?>
Obsolete property (metadata)
Dynamics NAV 2018 introduces two new metadata properties on tables, fields, and indexes: ObsoleteState and ObsoleteReason. The intension is to be able to first to make other developer aware that e.g. a table is about to be discontinued in later version, ObsoleteState = Pending, and some reasoning behind it, ObsoleteReason. Later, when the table or field is to be removed, the property can change state to ObsoleteState = Removed: Now the field is still in SQL Server but can only be used in Install- and Upgrade-codeunits. Refer to <todo:john> for the full story.
Compiler support for obsoleted tables and fields: C/SIDE
[Tip] The compiler treats the tables and fields with ObsoleteState = Removed as it does with the Enabled property, i.e. compiles successfully, and throws an error if used at runtime. There is no special handling of ObsoleteState = Pending.
Compiler support for obsoleted tables and fields: VS Code
The VS Code compiler treats tables and fields as follows:
ObsoleteState = Pending: Issues a compiler warning including the value of ObsoleteReason. Example of a warning is <todo>
ObsoleteState = Removed: Issues a compiler error if used outside of Install- or Upgrade codeunits, including the value of ObsoleteReason. Example of an error issued is <todo>.

Writing Upgrade code (new in Dynamics NAV 2018)
[Maybe covered elsewhere]
o	Upgrade- and Install-codeunit types
o	Upgrade- and Install-trigger events, e.g. OnUpgradePerDatabase
o	APIs for contextual info
	GetModuleExecutionContext and more
	ModuleInfo type and functions, e.g. GetCurrentModuleInfo


Running multiple application versions (and NAV servers) mounted on the very same tenant database (topic=DUALNST)
In a deployment where application and data are split into two databases, like in a multi-tenant setup, and the constraints of non-breaking schema changes are satisfied, Dynamics NAV 2018 can run two or more versions against a single customer-data database 
[mjens: add more content, what does make sense?]
 



BACKUP
Q (mjens): review in light of (no) shared schema and (no) shared database – still as valid?


•	Non-breaking schema changes

o	Guards, C/AL and AL
o	No buffer tables, upgrade toolkit
o	No table recreation (data type changes)
o	ONLINE SQL operations
o	Obsolete properties + (intended) semantics
	Tip: No compile check in classic C/AL
o	[Tip] What if I DO want to “break the schema”?
	Plan for it, classic style

•	Changes to Start-NAVDataUpgrade++
o	Includes upgrading extensions
	By calling Start-NAVAppDataUpgrade
	-SingleTransaction
•	[Tip] Large data, plan for NOT being able to use single transaction

•	Writing Upgrade (and Install) code (news)
o	Upgrade and Install codeunit types
o	Upgrade (and Install) trigger events, OnUpgradePerDatabase
o	APIs for contextual info
	GetModuleExecutionContext et al
	ModuleInfo type and function, e.g. GetCurrentModuleInfo

•	Versioning (not sure how much emphasis to add)
o	Schema- and data-version stamped in the databases
o	Cmdlets to support/set version numbers

•	No need for backup – almost
o	-SingleTransaction

•	Multiple application versions, one data database
o	(Re)Named data database as TenantDatabase (also in cmdlets)

•	V2 extension vs. V1 extensions
o	Why better? No uninstall/reinstall or roll off/roll on
o	Explicit Install- and Upgrade code units
o	Synchronize and data upgrade explicit operation


## See Also  
[Managing Users](Managing-Users.md)  
[Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)  
<!-- [How to: Work with the BASIC Permission Set](How-to--Work-with-the-BASIC-Permission-Set.md)  -->  
[How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
[Security and Protection](Security-and-Protection.md)   
<!-- [Customize the User Interface](Customize-the-User-Interface.md)   -->
[Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)
