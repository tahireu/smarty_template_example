{assign var=uid value='1'|mt_rand:500}

{include file='../../../elements/get_fields.tpl' scope='parent'}

{include file="../../../elements/background_image.tpl" fixedSize=[1280,300]}

{*Get video for background*}
{if !empty($video_file) && is_array($video_file) && !empty($video_file[0])}
    {$video_file = $video_file[0]}
{/if}

{if !empty($video_file)}
    {$fileParts = "."|explode:$video_file}
    {$extension = $fileParts[$fileParts|count-1]}

    {$video_mp4 = $video_file|replace:$extension:'mp4'}
    {$video_ogv = $video_file|replace:$extension:'ogv'}
    {$video_webm = $video_file|replace:$extension:'webm'}
{/if}
{$hasFullViewLink = false}
{if $viewClass|strstr:'tpl-full-link'}
    {$hasFullViewLink = true}
{/if}

<div class="tpl-architect-static-hero tpl-hero tpl-video-{if !empty($video_file)}yes tpl-hero-larger{else}no{/if} {$viewClass}" id="tpl-static-hero-{$uid}">
    <div class="tpl-background-image" id="tpl-background-image-{$uid}">
        {if !empty($video_file)}<div class="tpl-overlay"></div>{/if}
        <div class="tpl-hero-content">
            {if $hasFullViewLink && !empty($get_url)}
                <a href="{$get_url}" {if $new_tab}target="_blank"{/if} class="tpl-full-view-link"></a>
            {/if}
            <div class="tpl-table">
                <div class="tpl-cell">
                    <div class="tpl-hero-content-inner tpl-centered-850">
                        {if !empty($title)}
                            <h1 class="tpl-title"><span>{$title}</span></h1>
                        {/if}
                        {if !empty($subtitle)}
                            <div class="tpl-subtitle">{$subtitle}</div>
                        {/if}
                        {if !empty($body)}
                            <div class="tpl-body">
                                {$body}
                            </div>
                        {/if}
                        {if !empty($get_url) && !empty($button_text) && !$hasFullViewLink}
                            <div class="tpl-button-holder">
                                <a class="tpl-button" href="{$get_url}" {if $new_tab}target="_blank"{/if}>{$button_text}</a>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        {*Video start*}
        {if !empty($video_file)}
            <div class="tpl-video-player-holder">
                <div class="tpl-video-player">
                    <video class="video-player" id="tpl-video-player-{$id}" {if !empty($image)}poster="{$image}"{/if}>
                        <source src="{$video_mp4}" type="video/mp4"/>
                        <source src="{$video_ogv}" type="video/ogg"/>
                        <source src="{$video_webm}" type="video/webm"/>
                    </video>
                </div>
            </div>
        {/if}
        {*Video end*}
    </div>

    <script type="text/javascript">
        {if !empty($video_file)}
        $(document).ready(function(){
            if ($.fn.responsiveVideo) {
                $('#tpl-static-hero-' + {$uid}).responsiveVideo({
                    videoOverlay: false,
                    playButton: false,
                    pauseButton: false,
                    autoPlay: true,
                    muted: true,
                    loop: true
                });
            } else {
                console.log("jquery.responsiveVideo.js not included");
            }
        });
        {/if}
    </script>
</div>