[#include "/one-pager-module/templates/common/common-macros.ftl"]
[#macro renderCarImage imgItemKey altText]
    [#if imgItemKey??]
        [#assign imgRef = damfn.getAssetLink(imgItemKey)!]
        [#if imgRef??]
        <img class="img-responsive img-rounded" src="${imgRef}" alt="${altText}">
        [/#if]
    [/#if]
[/#macro]

[#--<a name="[@getSectionId rawSectionName=content.sectionName!""/]"></a>--]
<div class="component-section" id="[@getSectionId rawSectionName=content.sectionName!""/]">
    <div class="container">
        [#--title, subText--]
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">${content.title!""}</h2>
                [#if content.subText?has_content]<p class="lead">${cmsfn.decode(content).subText}</p>[/#if]
            </div>
        </div>

        <div class="row cars">
            <div class="col-lg-12 col-sm-12">
                [#if content.productRef??]
                    [#assign parentItem = cmsfn.contentById(content.productRef, "products")]
                    [#if parentItem??]
                        [#assign productsList = cmsfn.children(parentItem, "mgnl:product")]
                        [#if cmsfn.children(parentItem, "mgnl:product")?has_content]
                            [#list productsList as product]
                                <div class="row car">
                                    <div class="col-xs-6">
                                        <div class="big-box">
                                            [@renderCarImage imgItemKey=product.image!"" altText=product.@name!""/]
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="row">
                                            <div class="col-xs-12"><h3>${product.@name!""}</h3></div>
                                            <div class="col-xs-12">
                                                [#if product.description?has_content]${cmsfn.decode(product).description}[/#if]
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12">
                                        <div class="between-car-spacer"></div>
                                    </div>
                                </div>
                            [/#list]
                        [/#if]
                    [/#if]
                [/#if]
            </div>
        </div>
        [#-- ./ row cars--]
    </div>
    [#-- ./container --]
</div>
[#-- ./component-section --]