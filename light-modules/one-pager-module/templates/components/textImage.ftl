[#macro renderText content]
<div class="col-lg-5 col-sm-6">
    <hr class="section-heading-spacer">
    <div class="clearfix"></div>
    [#if content.title?has_content] <h2 class="section-heading">${content.title!""}</h2>[/#if]
    [#if content.subText?has_content]  <p class="lead"> ${cmsfn.decode(content).subText!""}</p>[/#if]
</div>
[/#macro]


[#macro renderImage content]
<div class="col-lg-6 col-sm-6">
    <div class="big-box">
    [#if content.image?has_content]
        [#assign asset=damfn.getAsset(content.image!"")/]
        [#if asset?has_content]
            [#if "roundedEdges"==content.imageStyle!]
              <img class="img-responsive img-rounded" src="${damfn.getRendition(asset, "large").getLink()!}"/>
            [#elseif "circle"==content.imageStyle!]
              <img class="img-responsive img-circle" src="${damfn.getRendition(asset, "large-square").getLink()!}"/>
            [#else]
              <img class="img-responsive" src="${damfn.getRendition(asset, "large").getLink()!}"/>
            [/#if]
        [/#if]
    [/#if]
    </div>
</div>
[/#macro]



<div class="component-section" id="${content.@uuid}">
    <div class="container">
        <div class="row">
        [#if "right"==content.imagePosition!]
            [@renderText content=content/]
            [@renderImage content=content/]
        [#else]
            [@renderImage content=content/]
            [@renderText content=content/]
        [/#if]
        </div>
    </div>
</div>

