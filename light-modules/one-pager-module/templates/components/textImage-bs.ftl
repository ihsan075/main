[#assign hasImage = false]
[#assign imageHtml = ""]
[#if model.image?exists]
    [#assign hasImage = true]
    [#include "/mte/templates/macros/image.ftl"]
    [#assign imageHtml][@image model.image content "img-responsive img-rounded" false def.parameters /][/#assign]
[/#if]


<div class="component-section" id="${content.@uuid}">
    <div class="container">
        <div class="row">


            <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">About Eric</h2>
                <p class="lead">
                    Eric was born in northern Europe.<br/>
                    He loves cars, cats, South Park, Gonzo the Great, italian food, belgium beer, crime stories, javascript, front end development, ...
                </p>
            </div>

            <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                [#--<img class="img-responsive img-circle" src="eric-the-viking.jpg" alt="">--]
                <div class="big-box">
                ${imageHtml}
                </div>
            </div>

        </div>
    </div>
</div>



[#--
<div class="component-section">
    <div class="container">

        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">About Eric</h2>
                <p class="lead">
                    Eric was born in northern Europe.<br/>
                    He loves cars, cats, South Park, Gonzo the Great, italian food, belgium beer, crime stories, javascript, front end development, ...
                </p>
            </div>
            <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                <img class="img-responsive img-circle" src="eric-the-viking.jpg" alt="">
            </div>
        </div>

    </div>
</div>
--]