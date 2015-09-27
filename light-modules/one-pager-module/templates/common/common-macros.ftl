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
                [#assign navTitle = compoment.sectionName!compoment.headline!""/]
                [#if navTitle!=""]
                    [#if type!="top"]<li class="footer-menu-divider">&sdot;</li>[/#if]
                    <li><a class="page-scroll" href="#${compoment.@uuid}">${compoment.sectionName!compoment.headline!"???"}</a></li>
                [/#if]
             [/#list]
         [/#if]
     </ul>
[/#macro]