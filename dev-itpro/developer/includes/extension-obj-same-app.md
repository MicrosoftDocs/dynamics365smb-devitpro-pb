
> [!NOTE]
> This feature is available with runtime 13.0 and later and is enabled by default if you're targeting runtime 13.0 and later..

Starting from runtime 13.0, large applications can achieve a separation of concerns by allowing extension objects to exist within the same app as their target. This enables the creation of multiple extensions for a single target within the same app. When table extensions reside in the same app as their target, their fields and keys are transferred to the base table, eliminating the need for SQL-joins at runtime.

With runtime 13.0, extension objects from a specific app are applied to the target based on the extension object ID. This introduces the following new compiler validations:

* Base objects are prohibited from referencing members from extension objects.
* An extension object can only reference members from other extension objects within the same app if the other extension object has a lower object ID.

All extension objects; enums, pages, reports, tables, and XMLports, are supported in the same app as their target. All combinations are supported, for example, One table and a table extension, one page and two page extensions, two enum extensions and so on.

