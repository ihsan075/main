[#--
 This macro renders the section navigation(s) on top and in footer section.
 - Param page: must be the content (contentMap) of a page.
 - Param areaName: the name of the area node which contains the content-section components.
 - Param type: "top" or "bottom".
--]
[#macro createSectionNav page areaName="content-sections" type="top"]
<ul class="[#if type=="top"]nav navbar-nav navbar-right[#else]list-inline[/#if]">
    [#if type!="top"]<li><a class="page-scroll" href="#intro">Home</a></li>[#else]<li><a class="page-scroll" href="#intro">Intro</a></li>[/#if]
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

[#assign title = content.title!"Welcome to Erics cars page :-)"]
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="${content.keywords!""}"/>
    <meta name="description" content="${content.description!""}"/>
    <meta name="author" content="">

    <title>${title}</title>

    [#--bootstrap css--]
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/bootstrap.min.css ">
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/bootstrap-theme.min.css ">
    [#--Custom CSS--]
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/one-pager-module/webresources/css/one-pager.css?z=123">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    [#--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries--]
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    [@cms.page /]
    <style>
        [#assign bgImgItemKey = content.introBgImage!]
        [#if bgImgItemKey??]
            [#assign imgRef = damfn.getAssetLink(bgImgItemKey, "xxlarge ")!]
            [#if imgRef??]
            .intro-section {
                background: url(${imgRef}) no-repeat center center;
                background-size: cover;
            }
            [/#if]
        [/#if][#-- eof: introBgImage --]
    </style>
</head>

<body>
    [#--top navigation--]
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="#intro">Home</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                [#--dynamic part of top-nav--]
                [@createSectionNav page=content areaName="content-sections" type="top" /]
            </div>
        </div>
    </nav>
    [#--eof: top navigation--]

    <div class="intro-section" id="intro">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1 class="dark">${title}</h1>
                        [#if content.subTitle?has_content]<h3>${content.subTitle}</h3>[/#if]
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>
        </div>
    </div>
    [#--eof: intro-section--]

    [@cms.area name="content-sections"/]

    [#--Footer--]
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    [#--footer-nav--]
                    [@createSectionNav page=content areaName="content-sections" type="bottom" /]
                    <div class="copyright">[#if content.copyrightNote??]${cmsfn.decode(content).copyrightNote}[/#if]</div>
                </div>
            </div>
        </div>
    </footer>
    [#--eof: Footer--]

    [#--jquery and bootstrap js--]
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/jquery.js"></script>
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/bootstrap.min.js"></script>
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/jquery.easing.min.js"></script>
    [#--custom js--]
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/js/one-pager.js"></script>

</body>
</html>
