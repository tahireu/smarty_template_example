{assign var=uid value='100'|mt_rand:200}

{include file='../../../elements/get_fields.tpl' scope='parent'}

<div class="tpl-architect-static-accordion {$viewClass}" id="tpl-architect-static-accordion-{$uid}">
    <div class="tpl-architect-static-accordion-inner tpl-centered-800">
        <div class="tpl-title">
            <h3>{$title}</h3>
        </div>
        <div class="tpl-body">
			{$body}
            {if !empty($video.html)}
                <div class="tpl-video-positioned">
                    <div class="tpl-video-holder">
                        {$video.html}
                    </div>
                </div>
            {/if}
		</div>
    </div>

    <script type="application/javascript">
        $(document).ready(function () {
            var $thisView = $('#tpl-architect-static-accordion-' + {$uid});
            $thisView.find('.tpl-title h3').on('click', function (event) {
                event.preventDefault();
                if($thisView.hasClass('expanded')){
                    $thisView.removeClass('expanded');
                    $thisView.find('.tpl-body').slideUp(200);
                }else{
                    $thisView.addClass('expanded');
                    $thisView.find('.tpl-body').slideDown(200);
                }
            });
        });
    </script>
</div>