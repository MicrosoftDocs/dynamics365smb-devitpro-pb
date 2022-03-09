| Event ID | Area | Message |
|----------|-------------|-----------------|
|AL0000CTV|Email|[Email sent successfully](../administration/telemetry-email-trace.md#success)|
| AL0000CTE | Field monitoring  | [Sensitive field value has changed: {alfieldCaption} ({alFieldNumber}) in table {altableCaption} ({alTableNumber})](../administration/telemetry-field-monitoring-trace.md#changed) |
|AL0000CTP|Email|[Failed to send email](../administration/telemetry-email-trace.md#failed)|
| AL0000DD3 | Field monitoring | [Sensitive field monitor status has changed to {almonitorStatus}](../administration/telemetry-field-monitoring-trace.md#status) |
|AL0000EMW|Field monitoring |[Sensitive field added to or removed from monitor: {alfieldCaption} ({alFieldNumber}) in table {alTableCaption} ({alTableNumber})](../administration/telemetry-field-monitoring-trace.md#added)|
|AL0000E2A|Permissions|[User-defined permission set added: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#setadded)|
|AL0000E2B|Permissions|[User-defined permission set removed: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#setremoved)|
|AL0000E28 |Permissions|[Permission set link added: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}](../administration/telemetry-permission-changes-trace.md#linkadded)|
|AL0000E29 |Permissions|[Permission set link removed: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}](../administration/telemetry-permission-changes-trace.md#linkremoved)|
|AL0000E2C |Permissions|[Permission set assigned to user: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#assigneduser)|
|AL0000E2D |Permissions|[Permission set removed from user: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#removeduser)|
|AL0000E2E |Permissions|[Permission set assigned to user group: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#assignedusergroup)|
|AL0000E2F |Permissions|[Permission set removed from user group: {alPermissionSetId}](../administration/telemetry-permission-changes-trace.md#removedusergroup)|
|AL0000D3L |Retention Policy |[Retention Policy Log Entry Logged: {alMessageType}](../administration/telemetry-retention-policy-trace.md#info)|
|AL0000D6H |Retention Policy|[Records Deleted Using Retention Policy: Deleted {alRecordsDeleted} records from Table {alTableNo}, {alTableName}](../administration/telemetry-retention-policy-trace.md#deleted)|
|AL0000D6I|Retention Policy|[First retention policy enabled on: {alCompanyName}](../administration/telemetry-retention-policy-trace.md#first)|
|AL0000D6J|	Retention Policy|[Last retention policy disabled on: {alCompanyName}](../administration/telemetry-retention-policy-trace.md#last)|