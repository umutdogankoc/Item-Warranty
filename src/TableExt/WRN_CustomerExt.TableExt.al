tableextension 50104 "WRN Customer Ext." extends Customer
{
    fields
    {
        field(50100; "WRN Customer Warranty Type"; Enum "WRN Customer Warranty Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Warranty Type';
        }
        modify("VAT Registration No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateCustomerWarrantyType();
            end;
        }
    }
    local procedure ValidateCustomerWarrantyType()
    begin
        Rec."WRN Customer Warranty Type" := Rec."VAT Registration No." <> '' ? Rec."WRN Customer Warranty Type"::B2B : Rec."WRN Customer Warranty Type"::B2C;
    end;
}