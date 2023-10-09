> [!WARNING] 
> The use of report properties **DefaultLayout**, **ExcelLayout**, **RDLLayout**, and **WordLayout** should be avoided as these properties will be deprecated at a later release. Instead, start using the property **DefaultRenderingLayout** together with the new **rendering** syntax introduced in runtime version 9.0. 
> 
> In VSCode, when hovering over any line with the **ExcelLayout**, **RDLLayout**, or **WordLayout** property, you can use the code action **Convert to 'Rendering'** to convert to the new **rendering** syntax. 
>
> For more information, see [DefaultRenderingLayout Property](../properties/devenv-defaultrenderinglayout-property.md).
>
> Note that the use of any of these report properties impact performance as every call loads the full layout in memory even if the intent is only to check if a given report had a layout of the given type. 