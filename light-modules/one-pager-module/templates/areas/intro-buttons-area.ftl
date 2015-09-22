[#if components?has_content]
<ul class="list-inline intro-social-buttons">
    [#list components as component]
        <li>
            [@cms.component content=component /]
        </li>
    [/#list]
</ul>
[/#if]

