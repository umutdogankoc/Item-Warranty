pageextension 50103 "WRN Customer Card Ext." extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("WRN Customer Warranty Type"; Rec."WRN Customer Warranty Type")
            {
                ApplicationArea = WarrantyApp;
                Editable = false;
                ToolTip = 'Specifies type of warranty will be valid for this customer. This field is validated by VAT Registration No.';
            }
        }
    }
}