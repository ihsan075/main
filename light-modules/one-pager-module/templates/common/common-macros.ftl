[#--
 This macro creates a simple "name" to be used for the section navigation based on anchor names.
 We could use the uuid of the underlying jcr node, however this would be an ugly name.
 The navigation to jump form one section to another adds the used anchor name to the browser url,
 this said the name should be +/- human readable and well suited to bookmark.
 The "getSectionName" macro will exchange space with dash character nd make all lower case.
 a rawSectionName "Classic american cars" will be turned into "classic-american-cars".
  --]
[#macro getSectionName rawSectionName=""]${rawSectionName?replace(" ", "-")?lower_case}[/#macro]