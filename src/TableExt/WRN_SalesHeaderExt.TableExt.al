tableextension 50105 "WRN Sales Header Ext." extends "Sales Header"
{
    fields
    {
        field(50100; "WRN Customer Warranty Type"; Enum "WRN Customer Warranty Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Warranty Type';
        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            begin
                InheritWRNCustomerFields();
            end;
        }
    }
    local procedure InheritWRNCustomerFields()
    var
        CustRec: Record Customer;
    begin
        CustRec := Rec.GetCust(Rec."Sell-to Customer No.");
        Rec."WRN Customer Warranty Type" := CustRec."WRN Customer Warranty Type";
    end;
}