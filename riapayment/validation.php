<?php
include(dirname(__FILE__) . '/../../config/config.inc.php');
include(dirname(__FILE__) . '/../../header.php');
include(dirname(__FILE__) . '/riapayment.php');

if (_PS_VERSION_ > "1.5.0.0") {
    $context = Context::getContext();
    $cart    = $context->cart;
}

$currency  = new Currency(intval(isset($_POST['currency_payement']) ? $_POST['currency_payement'] : $cookie->id_currency));
$total     = floatval(number_format($cart->getOrderTotal(true, 3), 2, '.', ''));
$customer  = new Customer((int) $cart->id_customer);
$mailVars  = array(
    '{riapayment_owner}' => Configuration::get('RIAPAYMENT_OWNER'),
    '{riapayment_details}' => nl2br(Configuration::get('RIAPAYMENT_DETAILS')),
    '{riapayment_address}' => nl2br(Configuration::get('RIAPAYMENT_ADDRESS'))
);
$id_estado = Configuration::get('RIAPAYMENT_STATE1');

$riapayment = new RiaPayment();

if (_PS_VERSION_ > "1.4.0.0" && _PS_VERSION_ < "1.5.0.0") {
    $riapayment->validateOrder($cart->id, Configuration::get('RIAPAYMENT_STATE1'), $total, $riapayment->displayName, NULL, $mailVars, $currency->id, false, $customer->secure_key);
}
if (_PS_VERSION_ > "1.5.0.0") {
    $riapayment->validateOrder((int) $cart->id, Configuration::get('RIAPAYMENT_STATE1'), $total, $riapayment->displayName, NULL, $mailVars, (int) $currency->id, false, $customer->secure_key);
    
}
if (_PS_VERSION_ < "1.4.0.0") {
    
    $riapayment->validateOrder($cart->id, Configuration::get('RIAPAYMENT_STATE1'), $total, $riapayment->displayName, NULL, $mailVars, $currency->id);
}

$order = new Order($riapayment->currentOrder);
Tools::redirectLink(__PS_BASE_URI__ . 'order-confirmation.php?id_cart=' . $cart->id . '&id_module=' . $riapayment->id . '&id_order=' . $riapayment->currentOrder . '&key=' . $order->secure_key);
?>