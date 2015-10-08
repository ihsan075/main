[#-- todo: think about getting rid of this macro ... more comments  --]
[#macro renderCarImage imgItemKey altText="alt text"]
    [#if imgItemKey?has_content]
        [#assign imgRef = damfn.getAssetLink(imgItemKey, "large")!]
        [#if imgRef?has_content]
        <img class="img-responsive img-rounded" src="${imgRef}" alt="${altText}">
        [/#if]
    [/#if]
[/#macro]

<div class="component-section" id="${content.@uuid}">
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
            [#if content.productFolderRef??]
                [#assign productFolder = cmsfn.contentById(content.productFolderRef, "products")]
                [#if productFolder??]
                    [#assign productsList = cmsfn.children(productFolder, "mgnl:product")]
                    [#if productsList?has_content]
                        [#list productsList as product]
                            [#assign asset = damfn.getAsset(product.image!"") /]
                            [#if asset??]
                                [#assign productTitle = product.title!asset.title!asset.name /]
                                <div class="row car">
                                    <div class="col-xs-6">
                                        <div class="big-box">
                                            [@renderCarImage imgItemKey=product.image! altText=productTitle!/]
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="row">
                                            [#if productTitle?has_content]
                                                <div class="col-xs-12"><h3>${productTitle}</h3></div>
                                            [/#if]
                                            [#if product.description?has_content]
                                                <div class="col-xs-12">${cmsfn.decode(product).description}</div>
                                            [/#if]
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12">
                                        <div class="between-car-spacer"></div>
                                    </div>
                                </div>
                            [/#if]
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