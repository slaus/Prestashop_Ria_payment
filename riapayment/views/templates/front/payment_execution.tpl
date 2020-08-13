{capture name=path}{l s='RiaPayment' mod='riapayment'}{/capture}
{if $psversion < '1.6.0.0'}
{include file="$tpl_dir./breadcrumb.tpl"}
{/if}
<h2>{l s='Order summary' mod='riapayment'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.'}</p>
{else}

<h3>{l s='WesterUnion' mod='riapayment'}</h3>
{if $psversion < "1.5.0.0"}
<form action="{$this_path_ssl}validation.php" method="post">
{else}
<form action="{$link->getModuleLink('riapayment', 'validation', [], true)}" method="post">

{/if}
<p>
	<img src="{$this_path}riapayment.jpg" alt="{l s='riapayment' mod='riapayment'}" style="float:left; margin: 0px 10px 5px 0px;" />
	{l s='You have chosen to pay by Ria.' mod='riapayment'}
	<br/><br />
	{l s='Here is a short summary of your order:' mod='riapayment'}
</p>
<p style="margin-top:20px;">
	- {l s='The total amount of your order is' mod='riapayment'}
	<span id="amount" class="price">{displayPrice price=$total}</span>
	{l s='(tax incl.)' mod='riapayment'}
</p>
<p>
	-
	{if $currencies|@count > 1}
		{l s='We accept several currencies to be sent by western union.' mod='riapayment'}
		<br /><br />
		{l s='Choose one of the following:' mod='riapayment'}
		<select id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
		{foreach from=$currencies item=currency}
			<option value="{$currency.id_currency}" {if isset($currencies) && $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
		{/foreach}
		</select>
	{else}
		{l s='We accept the following currency to be sent by western union:' mod='riapayment'}&nbsp;<b>{$currencies.0.name}</b>
		<input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}">
	{/if}
</p>
<p>
	{l s='Western union account information will be displayed on the next page.' mod='riapayment'}
	<br /><br />
	<b>{l s='Please confirm your order by clicking \'I confirm my order\'' mod='riapayment'}.</b>
</p>
<p class="cart_navigation">
	<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Other payment methods' mod='riapayment'}</a>
	<input type="submit" name="submit" value="{l s='I confirm my order' mod='riapayment'}" class="exclusive_large" />
</p>
</form>
{/if}