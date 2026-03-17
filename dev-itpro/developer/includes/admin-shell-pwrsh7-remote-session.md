> [!IMPORTANT]
> If you want to create and manage a With 2026 release wave 1 (version 28), PowerShell 7–based administration cmdlets in [Business Central Administration Shell](adminshell.md) aren't supported in remote PowerShell sessions. If you run admin commands remotely, use the Windows PowerShell 5.1 cmdlets from the Management folder, or run the commands locally (for example, inside a container via BcContainerHelper). Learn more in [Known issue: Business Central administration cmdlets fail in remote PowerShell 7 sessions](../../upgrade/known-issues.md#business-central-admin-shell-cmdlets-fail-in-powershell7-remote-sessions).

Run BcContainerHelper from Windows PowerShell 5.1 so that internal PSSessions use Windows PowerShell.
PowerShell 7–based PSSessions are not supported for importing Business Central management modules in v28.

BcContainerHelper uses PowerShell PSSessions as its primary execution mechanism to run Business Central administration cmdlets inside containers. These cmdlets must execute in the container’s Windows environment and cannot be run locally on the host. In Business Central v28, PowerShell 7 PSSessions fail to import the management modules; Windows PowerShell 5.1 PSSessions continue to work.


If you're creating or managing a container for Business Central 2026 release wave 1 (version 28.0), use Windows PowerShell 5.1, not PowerShell 7.  There This impacts both partners using BCContainerHelper as well as AL-Go. 


–based administration cmdlets in [Business Central Administration Shell](adminshell.md) aren't supported in remote PowerShell sessions. If you run admin commands remotely, use the Windows PowerShell 5.1 cmdlets from the Management folder, or run the commands locally (for example, inside a container via BcContainerHelper). Learn more in [Known issue: Business Central administration cmdlets fail in remote PowerShell 7 sessions](../../upgrade/known-issues.md#business-central-admin-shell-cmdlets-fail-in-powershell7-remote-sessions).