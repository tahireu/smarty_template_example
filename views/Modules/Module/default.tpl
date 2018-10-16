{if !empty($viewClass)}
	<div class="tpl-module-default {$viewClass}">
		{$body}
	</div>
{else}
	{$body}
{/if}