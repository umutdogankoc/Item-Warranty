pageextension 50107 "WRN Sales Invoice Ext." extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("WRN Customer Warranty Type"; Rec."WRN Customer Warranty Type")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies type of warranty will be valid for this customer. This field is validated by VAT Registration No.';
                Editable = false;
            }
        }
    }
}