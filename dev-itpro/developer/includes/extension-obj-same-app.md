
> [!NOTE]
> This feature is available with runtime 13.0 and later and is enabled by default if you're targeting runtime 13.0 and later..

From runtime 13.0 onwards, large applications have the ability to maintain a separation of concerns. This is achieved by permitting extension objects to coexist with their target within the same app. This facilitates the development of multiple extensions for a single target, all within the same app. 

When table extensions live in the same app as their target, their fields and keys are integrated into the base table. This integration eliminates the need for SQL-joins during runtime. 

All types of extension objects; enums, pages, reports, tables, and XMLports, can coexist with their target within the same app. This allows for a variety of combinations, such as a single table with its table extension, a single page with multiple page extensions, multiple enum extensions, and so forth. This flexibility supports a wide range of application structures and functionalities.

Permitting extension objects to coexist with their target within the same app is particularly useful for non-disruptive code refactoring within an app. It allows for dividing objects into modules based on specific functionalities, or for preparing to move objects into a separate app in anticipation of future releases.

With runtime 13.0, extension objects from a specific app are applied to the target based on the extension object ID. This introduces the following new compiler validations:

* Base objects are prohibited from referencing members from extension objects.
* An extension object can only reference members from other extension objects within the same app if the other extension object has a lower object ID.