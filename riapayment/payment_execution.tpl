{capture name=path}{l s='WesternUnion' mod='westernunion'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Order summary' mod='westernunion'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.'}</p>
{else}

<h3>{l s='WesterUnion' mod='westernunion'}</h3>
<form action="{$this_path_ssl}validation.php" method="post">
<p>
	<img src="{$this_path}westernunion.jpg" alt="{l s='westernunion' mod='westernunion'}" style="float:left; margin: 0px 10px 5px 0px;" />
	{l s='You have chosen to pay by WesternUnion.' mod='westernunion'}
	<br/><br />
	{l s='Here is a short summary of your order:' mod='westernunion'}
</p>
<p style="margin-top:20px;">
	- {l s='The total amount of your order is' mod='westernunion'}
	<span id="amount" class="price">{displayPrice price=$total}</span>
	{l s='(tax incl.)' mod='westernunion'}
</p>
<p>
	-
	{if $currencies|@count > 1}
		{l s='We accept several currencies to be sent by western union.' mod='westernunion'}
		<br /><br />
		{l s='Choose one of the following:' mod='westernunion'}
		<select id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
		{foreach from=$currencies item=currency}
			<option value="{$currency.id_currency}" {if isset($currencies) && $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
		{/foreach}
		</select>
	{else}
		{l s='We accept the following currency to be sent by western union:' mod='westernunion'}&nbsp;<b>{$currencies.0.name}</b>
		<input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}">
	{/if}
</p>
<p>
	{l s='Western union account information will be displayed on the next page.' mod='westernunion'}
	<br /><br />
	<b>{l s='Please confirm your order by clicking \'I confirm my order\'' mod='westernunion'}.</b>
</p>
<p class="cart_navigation">
	<a href="{$base_dir_ssl}order.php?step=3" class="button_large">{l s='Other payment methods' mod='westernunion'}</a>
	<input type="submit" name="submit" value="{l s='I confirm my order' mod='westernunion'}" class="exclusive_large" />
</p>
</form>
{/if}