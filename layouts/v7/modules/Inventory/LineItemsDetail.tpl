{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Inventory/views/Detail.php *}

{assign var=ITEM_DETAILS_BLOCK value=$BLOCK_LIST['LBL_ITEM_DETAILS']}
{assign var=LINEITEM_FIELDS value=$ITEM_DETAILS_BLOCK->getFields()}

{assign var=COL_SPAN1 value=0}
{assign var=COL_SPAN2 value=0}
{assign var=COL_SPAN3 value=2}
{assign var=IMAGE_VIEWABLE value=false}
{assign var=PRODUCT_VIEWABLE value=false}
{assign var=QUANTITY_VIEWABLE value=false}
{assign var=PURCHASE_COST_VIEWABLE value=false}
{assign var=LIST_PRICE_VIEWABLE value=false}
{assign var=MARGIN_VIEWABLE value=false}
{assign var=COMMENT_VIEWABLE value=false}
{assign var=ITEM_DISCOUNT_AMOUNT_VIEWABLE value=false}
{assign var=ITEM_DISCOUNT_PERCENT_VIEWABLE value=false}
{assign var=SH_PERCENT_VIEWABLE value=false}
{assign var=DISCOUNT_AMOUNT_VIEWABLE value=false}
{assign var=DISCOUNT_PERCENT_VIEWABLE value=false}

{if $LINEITEM_FIELDS['image']}
    {assign var=IMAGE_VIEWABLE value=$LINEITEM_FIELDS['image']->isViewable()}
{if $IMAGE_VIEWABLE}{assign var=COL_SPAN1 value=($COL_SPAN1)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['productid']}
    {assign var=PRODUCT_VIEWABLE value=$LINEITEM_FIELDS['productid']->isViewable()}
{if $PRODUCT_VIEWABLE}{assign var=COL_SPAN1 value=($COL_SPAN1)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['quantity']}
    {assign var=QUANTITY_VIEWABLE value=$LINEITEM_FIELDS['quantity']->isViewable()}
{if $QUANTITY_VIEWABLE}{assign var=COL_SPAN1 value=($COL_SPAN1)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['purchase_cost']}
    {assign var=PURCHASE_COST_VIEWABLE value=$LINEITEM_FIELDS['purchase_cost']->isViewable()}
{if $PURCHASE_COST_VIEWABLE}{assign var=COL_SPAN2 value=($COL_SPAN2)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['listprice']}
    {assign var=LIST_PRICE_VIEWABLE value=$LINEITEM_FIELDS['listprice']->isViewable()}
{if $LIST_PRICE_VIEWABLE}{assign var=COL_SPAN2 value=($COL_SPAN2)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['margin']}
    {assign var=MARGIN_VIEWABLE value=$LINEITEM_FIELDS['margin']->isViewable()}
{if $MARGIN_VIEWABLE}{assign var=COL_SPAN3 value=($COL_SPAN3)+1}{/if}
{/if}
{if $LINEITEM_FIELDS['comment']}
    {assign var=COMMENT_VIEWABLE value=$LINEITEM_FIELDS['comment']->isViewable()}
{/if}
{if $LINEITEM_FIELDS['discount_amount']}
    {assign var=ITEM_DISCOUNT_AMOUNT_VIEWABLE value=$LINEITEM_FIELDS['discount_amount']->isViewable()}
{/if}
{if $LINEITEM_FIELDS['discount_percent']}
    {assign var=ITEM_DISCOUNT_PERCENT_VIEWABLE value=$LINEITEM_FIELDS['discount_percent']->isViewable()}
{/if}
{if $LINEITEM_FIELDS['hdnS_H_Percent']}
    {assign var=SH_PERCENT_VIEWABLE value=$LINEITEM_FIELDS['hdnS_H_Percent']->isViewable()}
{/if}
{if $LINEITEM_FIELDS['hdnDiscountAmount']}
    {assign var=DISCOUNT_AMOUNT_VIEWABLE value=$LINEITEM_FIELDS['hdnDiscountAmount']->isViewable()}
{/if}
{if $LINEITEM_FIELDS['hdnDiscountPercent']}
    {assign var=DISCOUNT_PERCENT_VIEWABLE value=$LINEITEM_FIELDS['hdnDiscountPercent']->isViewable()}
{/if}

<input type="hidden" class="isCustomFieldExists" value="false">

{assign var=FINAL_DETAILS value=$RELATED_PRODUCTS.1.final_details}
<div class="details block">
    <div class="lineItemTableDiv">
        <table class="table table-bordered lineItemsTable" style = "margin-top:15px">
            <tbody>
                <tr>
                    {if $IMAGE_VIEWABLE}
                        <td class="lineItemFieldName">
                            <strong>{vtranslate({$LINEITEM_FIELDS['image']->get('label')},$MODULE)}</strong>
                        </td>
                    {/if}
                    {if $PRODUCT_VIEWABLE}
                        <td class="lineItemFieldName">
                            <span class="redColor">*</span><strong>{vtranslate({$LINEITEM_FIELDS['productid']->get('label')},$MODULE_NAME)}</strong>
                        </td>
                    {/if}

                    {if $QUANTITY_VIEWABLE}
                        <td class="lineItemFieldName">
                            <strong>{vtranslate({$LINEITEM_FIELDS['quantity']->get('label')},$MODULE_NAME)}</strong>
                        </td>
                    {/if}
                    {if $PURCHASE_COST_VIEWABLE}
                        <td class="lineItemFieldName">
                            <strong>{vtranslate({$LINEITEM_FIELDS['purchase_cost']->get('label')},$MODULE_NAME)}</strong>
                        </td>
                    {/if}
                    {if $LIST_PRICE_VIEWABLE}
                        <td style="white-space: nowrap;">
                            <strong>{vtranslate({$LINEITEM_FIELDS['listprice']->get('label')},$MODULE_NAME)}</strong>
                        </td>
                    {/if}
                    {if $MARGIN_VIEWABLE}
                        <td class="lineItemFieldName">
                            <strong class="pull-right">{vtranslate({$LINEITEM_FIELDS['margin']->get('label')},$MODULE_NAME)}</strong>
                        </td>
                    {/if}
                </tr>
                {foreach key=INDEX item=LINE_ITEM_DETAIL from=$RELATED_PRODUCTS}
                    <tr>
                        {if $IMAGE_VIEWABLE}
                            <td style="text-align:center;">
                                <img src='{$LINE_ITEM_DETAIL["productImage$INDEX"]}' height="42" width="42">
                            </td>
                        {/if}

                        {if $PRODUCT_VIEWABLE}
                            <td>
                                <div>
                                    {if $LINE_ITEM_DETAIL["productDeleted$INDEX"]}
                                        {$LINE_ITEM_DETAIL["productName$INDEX"]}
                                    {else}
                                        <h5><a class="fieldValue" href="index.php?module={$LINE_ITEM_DETAIL["entityType$INDEX"]}&view=Detail&record={$LINE_ITEM_DETAIL["hdnProductId$INDEX"]}" target="_blank">{$LINE_ITEM_DETAIL["productName$INDEX"]}</a></h5>
                                        {/if}
                                </div>
                                {if $LINE_ITEM_DETAIL["productDeleted$INDEX"]}
                                    <div class="redColor deletedItem">
                                        {if empty($LINE_ITEM_DETAIL["productName$INDEX"])}
                                            {vtranslate('LBL_THIS_LINE_ITEM_IS_DELETED_FROM_THE_SYSTEM_PLEASE_REMOVE_THIS_LINE_ITEM',$MODULE)}
                                        {else}
                                            {vtranslate('LBL_THIS',$MODULE)} {$LINE_ITEM_DETAIL["entityType$INDEX"]} {vtranslate('LBL_IS_DELETED_FROM_THE_SYSTEM_PLEASE_REMOVE_OR_REPLACE_THIS_ITEM',$MODULE)}
                                        {/if}
                                    </div>
                                {/if}
                                <div>
                                    {$LINE_ITEM_DETAIL["subprod_names$INDEX"]}
                                </div>
                                {if $COMMENT_VIEWABLE && !empty($LINE_ITEM_DETAIL["productName$INDEX"])}
                                    <div>
                                        {decode_html($LINE_ITEM_DETAIL["comment$INDEX"])|nl2br}
                                    </div>
                                {/if}
                            </td>
                        {/if}

                        {if $QUANTITY_VIEWABLE}
                            <td>
                                {$LINE_ITEM_DETAIL["qty$INDEX"]}
                            </td>
                        {/if}

                        {if $PURCHASE_COST_VIEWABLE}
                            <td>
                                {$LINE_ITEM_DETAIL["purchaseCost$INDEX"]}
                            </td>
                        {/if}

                        {if $LIST_PRICE_VIEWABLE}
                            <td style="white-space: nowrap;">
                                <div>
                                    {$LINE_ITEM_DETAIL["listPrice$INDEX"]}
                                {if $FINAL_DETAILS.taxtype neq 'group'}
                                    <div class="individualTaxContainer">
                                        {assign var=INDIVIDUAL_TAX_INFO value="{vtranslate('LBL_TOTAL_AFTER_DISCOUNT', $MODULE_NAME)} = {$LINE_ITEM_DETAIL["totalAfterDiscount$INDEX"]}<br /><br />{foreach item=tax_details from=$LINE_ITEM_DETAIL['taxes']}{if $LINEITEM_FIELDS["{$tax_details['taxname']}"]}{$tax_details['taxlabel']} : \t{$tax_details['percentage']}%  {vtranslate('LBL_OF',$MODULE_NAME)}  {if $tax_details['method'] eq 'Compound'}({/if}{$LINE_ITEM_DETAIL["totalAfterDiscount$INDEX"]}{if $tax_details['method'] eq 'Compound'}{foreach item=COMPOUND_TAX_ID from=$tax_details['compoundon']}{if $FINAL_DETAILS['taxes'][$COMPOUND_TAX_ID]['taxlabel']} + {$FINAL_DETAILS['taxes'][$COMPOUND_TAX_ID]['taxlabel']}{/if}{/foreach}){/if} = {$tax_details['amount']}<br />{/if}{/foreach}<br /><br />{vtranslate('LBL_TOTAL_TAX_AMOUNT',$MODULE_NAME)} = {$LINE_ITEM_DETAIL["taxTotal$INDEX"]}"}
                                        (+)&nbsp;<strong><a href="javascript:void(0)" class="individualTax inventoryLineItemDetails" tabindex="0" role="tooltip" id="example" title ="{vtranslate('LBL_TAX',$MODULE_NAME)}" data-trigger ="focus" data-toggle ="popover" data-content="{$INDIVIDUAL_TAX_INFO}">{vtranslate('LBL_TAX',$MODULE_NAME)} </a> : </strong>
                                    </div>
                                {/if}
                            </td>
                        {/if}
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>