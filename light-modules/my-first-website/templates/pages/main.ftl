[#assign title = content.title!"Welcome to my cars page :-)"]
<!DOCTYPE html>
<html>
<head>
   <title>${title}</title>
  <meta name="description" content="${content.description!""}" />
  <meta name="keywords" content="${content.keywords!""}" />


  [@cms.page /]
</head>
<body>
  <div class="container">
    <header>
      <h1>${title}</h1>
      [#if content.introText?has_content]<p>${cmsfn.decode(content).introText}</p>[/#if]
    </header>
  </div>
</body>
</html>
