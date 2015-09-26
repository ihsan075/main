[#--
 This macro creates a simple name/ id to be used for the section navigation based on anchor names. Final value should not contain spaces.
 We could use the uuid of the underlying jcr node, however this would be an ugly name.
 The navigation to jump from one section to another adds the used anchor name to the browser url,
 this said the name should be +/- human readable and well suited to bookmark.
 The "getSectionId" macro will exchange space with dash character and make all lower case.
 a rawSectionName "Classic american cars" will be turned into "classic-american-cars".
--]
[#macro getSectionId rawSectionName=""]${rawSectionName?replace(" ", "-")?lower_case}[/#macro]


[#--
 This macro renders the section navigation(s) on top and in footer section.
 - Param page: must be the content (contentMap) of a page.
 - Param areaName: the name of the area node which contains the content-section components.
 - Param type: "top" or "bottom".
--]
[#macro createSectionNav page areaName="content-sections" type="top"]
     <ul class="[#if type=="top"]nav navbar-nav navbar-right[#else]list-inline[/#if]">
         [#if type!="top"]<li><a class="page-scroll" href="#intro">Home</a></li>[#else]<li><a class="page-scroll" href="#intro">Intro</a></li>[/#if]
         [#--[#assign contentSectionsArea = cmsfn.contentByPath(page.@path+"/"+areaName) /]--]
         [#if cmsfn.contentByPath(page.@path+"/"+areaName)??]
             [#list cmsfn.children(cmsfn.contentByPath(page.@path+"/"+areaName), "mgnl:component") as compoment]
                [#if "" != compoment.sectionName!""]
                    [#if type!="top"]<li class="footer-menu-divider">&sdot;</li>[/#if]
                    <li><a class="page-scroll" href="#[@getSectionId rawSectionName=compoment.sectionName!""/]">${compoment.sectionName!}</a></li>
                [/#if]
             [/#list]
         [/#if]
     </ul>
[/#macro]