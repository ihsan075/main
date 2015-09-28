[#macro renderText content]
    <div class="col-lg-5 col-sm-6">
        <hr class="section-heading-spacer">
        <div class="clearfix"></div>
        <h2 class="section-heading">${content.headline!""}</h2>
        [#if content.text??]  <p class="lead"> ${cmsfn.decode(content).text!""}</p>[/#if]
    </div>
[/#macro]

[#macro renderImage content model def]
    <div class="col-lg-6 col-sm-6">
    [#if model.image?exists]
        [#include "/mte/templates/macros/image.ftl"]
        <div class="big-box">
            [@image model.image content "img-responsive img-rounded" false def.parameters /]
        </div>
    [/#if]
    </div>
[/#macro]

<div class="component-section" id="${content.@uuid}">
    <div class="container">
        <div class="row">
            [#if "below"==content.imagePosition!""]
                [@renderText content=content/]
                [@renderImage content=content model=model def=def/]

            [#else]
                [@renderImage content=content model=model def=def/]
                [@renderText content=content/]
            [/#if]
        </div>
    </div>
</div>
