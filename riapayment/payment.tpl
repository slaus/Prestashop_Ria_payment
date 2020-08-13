<p class="payment_module">
{if $psversion < "1.5.0.0"}
	<a href="{$this_path_ssl}payment.php" title="{l s='Pay by Ria' mod='riapayment'}">
    {else}
    	<a href="{$link->getModuleLink('riapayment', 'payment', [], true)}" title="{l s='Pay by Ria' mod='riapayment'}">


    {/if}
    
		<img src="{$this_path}riapayment.jpg" alt="{l s='Pay by Ria' mod='riapayment'}" />
		{l s='Pay by Ria.' mod='riapayment'}	</a>
</p>
