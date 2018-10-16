<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">

    <head>
        <title>
            {if !empty($fullViewItemTitle)}
                {$fullViewItemTitle} |
            {elseif !empty($SitePage.title)}
                {$SitePage.title} |
            {/if}
            {$SiteChannel.title}
        </title>

        <!-- Load Fonts -->
        {literal}
            <script type="text/javascript" src="//use.typekit.com/{placeholder}.js"></script>
            <script type="text/javascript">
                $.holdReady(true);
                try {
                    Typekit.load({
                        active: function() {
                            $.holdReady(false);
                        }
                    })
                } catch(e) {
                    $.holdReady(false);
                }
            </script>
        {/literal}
        
        <link rel="stylesheet" type="text/css" href="{'/fonts/CompanyLeelawadee/stylesheet.css'|get_asset_url}" media="all" />
        <link rel="stylesheet" type="text/css" href="{'/fonts/Linearicons/style.css'|get_asset_url}" />

        
        {* JS *}
        <script type="text/javascript" src="/js/ss/vars.js"></script>
        <script type="text/javascript" src="/js/ss/utils/Router.js"></script>

        <style>
            html, body {
                height: 100%;
            }
            @page {
                font-family: "myriad-pro", sans-serif;
                margin: 0;
                height: 100%;
            }
        </style>

    </head>

    <body>
        <div style="margin: 0; padding: 0; height: 100%; position: relative;">
            {if isset($body)}
                {$body}
            {/if}
        </div>
    </body>

</html>