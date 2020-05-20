<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<invoice_document>
    <invoice_number><xsl:value-of select="invoice/invoice_number"/></invoice_number>
    <invoice_date><xsl:value-of select="invoice/invoice_date"/></invoice_date>
    <issued_by> <xsl:value-of select="invoice/issued_by"/> </issued_by>
    
    <parties> 
        <bill_to>
            <surname> <xsl:value-of select="invoice/bill_to/name"/> </surname>
            <address>
            <number> <xsl:value-of select="invoice/bill_to/address/number"/>
            </number>
            <street> <xsl:value-of select="invoice/bill_to/address/street"/> </street>
            <city> <xsl:value-of select="invoice/bill_to/address/city"/> </city> 
            </address>
        </bill_to>
    </parties>

    <items>
    <xsl:for-each select="invoice/item">
        <item>
            <item_name> <xsl:value-of select="item_name"/> </item_name>
            <item_price> <xsl:value-of select="price"/> </item_price>
            <item_quantity> <xsl:value-of select="quantity"/> </item_quantity>
        </item>
    </xsl:for-each>
    </items>

    <payment_info> <xsl:value-of select="invoice/payment_information"/> </payment_info>

    <quantity_total> <xsl:value-of select="count(invoice/item)"/> </quantity_total>

    <invoice_total> <xsl:value-of select="sum(invoice/item/price)"/> </invoice_total>

</invoice_document>
</xsl:template>
</xsl:stylesheet>
