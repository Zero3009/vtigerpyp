<?php /* Smarty version Smarty-3.1.7, created on 2019-07-22 15:44:34
         compiled from "/var/www/html/vtigercrm/includes/runtime/../../layouts/v7/modules/Reports/PrintReport.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14679688225d275696347da1-30946647%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a856713f527d1be4245a5b383e05361f9bd2aaf1' => 
    array (
      0 => '/var/www/html/vtigercrm/includes/runtime/../../layouts/v7/modules/Reports/PrintReport.tpl',
      1 => 1563810272,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14679688225d275696347da1-30946647',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5d27569634b0e',
  'variables' => 
  array (
    'MODULE' => 0,
    'REPORT_NAME' => 0,
    'ROW' => 0,
    'PRINT_DATA' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d27569634b0e')) {function content_5d27569634b0e($_smarty_tpl) {?>



<script type="text/javascript" src="libraries/jquery/jquery.min.js"></script>

<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><?php echo vtranslate('LBL_PRINT_REPORT',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</title>
        <style type="text/css" media="print,screen">
            
                /* Imprimir background con Chrome*/
                body {
                  -webkit-print-color-adjust: exact !important;
                }
                /* Imprimir background con Firefox*/
                @@supports (-moz-appearance:meterbar) {
                    .container {
                        margin: 0;
                        font-size: 0.85em;
                        width: 100%;
                        -webkit-print-color-adjust: exact;
                        color-adjust: exact;
                    }
                }
                @page {
                    size: auto;   /* auto is the initial value */
                    margin: 3;  /* this affects the margin in the printer settings */
                }
               .printReport{
                    width:100%;
                    border:0px solid #000000;
                    border-collapse:collapse;
                    font-size: 9pt;
                }
                .printReport tbody td{
                    border:0.5px solid #000000;
                    text-align:left;
                    border-color: #fff;
                    background-color: #eee;
                }
                .printReport thead th{
                    border:0.5px solid #000000;
                    background-color: #bdbdbd;
                    border-color: #fff;
                }
                .printReport td:nth-child(5),.printReport th:nth-child(5){
                    display: none;
                }
                thead {
                    display:table-header-group;
                }
                tbody {
                    display:table-row-group;
                }
            
        </style>
    </head>
    <body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" style="text-align:center;" onLoad="JavaScript:window.print()">
        <table width="80%" border="0" cellpadding="5" cellspacing="0" align="center">
            <tr class="reportPrintHeader">
                <td align="left" style="border-bottom:1px solid #000000;  padding-top: 5pt;" valign="top">
                    <img src="layouts/v7/modules/Reports/Images/logo.png"> 
                </td>
                <td align="right" valign="top" style="border-bottom:1px solid #000000; padding-top: 5pt;">
                <h1><?php echo $_smarty_tpl->tpl_vars['REPORT_NAME']->value;?>
 </h1>
                    <font  color="#000"><div id="report_info"></div></font>
                </td>
            </tr>
            <tr>
                <td  colspan=2 align="right" style="border:0px solid #000000;" valign="top">
                    Fecha: <script> document.write(new Date().toLocaleDateString()); </script>
                </td>
            </tr>
            <tr class="reportPrintHeader">
                <td align="left" valign="top" style="border-left:5px solid#bdbdbd;">
                    <b><h7 id="area"></h7></b>
                    <br><br><br><b><?php echo $_smarty_tpl->tpl_vars['ROW']->value;?>
 <?php echo vtranslate('LBL_RECORDS',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</b>
                    <font  color="#000"><div id="report_info"></div></font>
                </td>
                <td align="right" style="border:0px solid #000000;" valign="top">
                    <h7> <b> Parques y Paseos </b> <br> Moreno 2350 <br> S2000GFN Rosario <br>Teléfono: (341) 480-8497 </h7>
                </td>
            </tr>
            <tr>
                <td style="padding-left:0px;" colspan="2">
                    <table width="100%" border="0" cellpadding="5" cellspacing="0" align="center" class="printReport reportPrintData" style="background-color: #eee";>
                        <?php echo $_smarty_tpl->tpl_vars['PRINT_DATA']->value;?>

                    </table>
                </td>
            </tr>
        </table>
    </body>
    <script>
        
            jQuery(document).ready(function () {
                $('#area').text($('table tr:nth-child(1) td:nth-child(5)').text());
                var splitted = false;
                // chrome and safari doesn't support table-header-group option
                if (jQuery.browser.webkit) {
                    function splitTable(table, maxHeight) {
                        var header = table.children("thead");
                        if (!header.length)
                            return;

                        var headerHeight = header.outerHeight();
                        var header = header.detach();

                        var splitIndices = [0];
                        var rows = table.children("tbody").children();

                        maxHeight -= headerHeight;
                        var currHeight = 0;
                        var reportHeader = jQuery('.reportPrintHeader');
                        if (reportHeader.length > 0) {
                            currHeight = reportHeader.outerHeight();
                        }
                        rows.each(function (i, row) {
                            currHeight += $(rows[i]).outerHeight();
                            if (currHeight > maxHeight) {
                                splitIndices.push(i);
                                currHeight = $(rows[i]).outerHeight();
                            }
                        });
                        splitIndices.push(undefined);

                        table = table.replaceWith('<div id="_split_table_wrapper"></div>');
                        table.empty();

                        for (var i = 0; i < splitIndices.length - 1; i++) {
                            var newTable = table.clone();
                            header.clone().appendTo(newTable);
                            $('<tbody />').appendTo(newTable);
                            rows.slice(splitIndices[i], splitIndices[i + 1]).appendTo(newTable.children('tbody'));
                            newTable.appendTo("#_split_table_wrapper");
                            if (splitIndices[i + 1] !== undefined) {
                                $('<div style="page-break-after: always; margin:0; padding:0; border: none;"></div>').appendTo("#_split_table_wrapper");
                            }
                        }
                    }

                    if (window.matchMedia) {
                        var mediaQueryList = window.matchMedia('print');
                        mediaQueryList.addListener(function (mql) {
                            if (mql.matches && splitted == 0) {
                                var height = window.screen.availHeight;
                                $(function () {
                                    splitTable($(".reportPrintData"), height);
                                })
                                splitted = 1;
                            }
                        });
                    }
                }
            });
        
    </script>
</html>
<?php }} ?>