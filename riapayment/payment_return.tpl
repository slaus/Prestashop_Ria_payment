{if $status == 'ok'}
	<p>{l s='Your order on' mod='riapayment'} <span class="bold">{$base_dir_ssl}</span> {l s='is complete.' mod='riapayment'}
		<br /><br />
		{l s='Please send us a Ria transfer with:' mod='riapayment'}
		<br /><br />- {l s='an amout of' mod='riapayment'} <span class="price">{$total_to_pay}</span>
		<br /><br />- {l s='to the account owner of' mod='riapayment'} <span class="bold">{if $riapaymentOwner}{$riapaymentOwner}{else}___________{/if}</span>
		<br /><br />
		- {l s='Address:' mod='riapayment'} <span class="bold">{if $riapaymentDetails}{$riapaymentDetails}{else}___________{/if}</span>
		<br /><br />
		- {l s='With the ID (CIF/NIF/DNI):' mod='riapayment'} <span class="bold">{if $riapaymentAddress}{$riapaymentAddress}{else}___________{/if}</span>
		<br /><br />
	    - {l s='RiaPayment: ' mod='riapayment'}<a href="http://www.ria.com/" target="_blank">{l s='www.ria.com' mod='riapayment'}</a>
      	<br /><br />
	{l s='You can leave message the above information in your order. Or you can contact our' mod='riapayment'} <a href="{$base_dir_ssl}contact-form.php">{l s='customer support' mod='riapayment'}</a>.	</p>
{else}
	<p class="warning">
		{l s='We noticed a problem with your order. If you think this is an error, you can contact our' mod='riapayment'} 
		<a href="{$base_dir_ssl}contact-form.php">{l s='customer support' mod='riapayment'}</a>.	</p>
{/if}
