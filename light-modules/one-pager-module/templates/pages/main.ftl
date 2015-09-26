[#include "/one-pager-module/templates/common/common-macros.ftl"]
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
            [#assign imgRef = damfn.getAssetLink(bgImgItemKey)!]
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
    [#--Navigation--]
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
                [#--top-nav--]
                [@createSectionNav page=content areaName="content-sections" type="top" /]
            </div>
        </div>
    </nav>

    <div class="intro-section" id="intro">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1 class="dark">${title}</h1>
                    [#if content.subTitle?has_content]<h3>${content.subTitle}</h3>[/#if]
                        <hr class="intro-divider">
                    [#--buttons--]
                    [@cms.area name="intro-buttons"/]
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
                    <p class="copyright text-muted small">copyleft by Eric the Viking :-)
                    </p>
                </div>
            </div>
        </div>
    </footer>

    [#--jquery and bootstrap js--]
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/jquery.js"></script>
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/bootstrap.min.js"></script>
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/bootstrap-3.3.5/jquery.easing.min.js"></script>
    [#--custom js--]
    <script src="${ctx.contextPath}/.resources/one-pager-module/webresources/js/one-pager.js"></script>

</body>
</html>
