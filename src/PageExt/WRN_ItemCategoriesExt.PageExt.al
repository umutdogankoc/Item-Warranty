pageextension 50100 "WRN Item Categories Ext." extends "Item Categories"
{
    layout
    {
        addlast(Control1)
        {

            field("WRN B2B War.Dur.Labor"; Rec."WRN B2B War.Dur.Labor")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Labor Warranty for B2B Customers';
                Editable = false;
            }
            field("WRN B2B War.Dur.Parts"; Rec."WRN B2B War.Dur.Parts")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Parts Warranty for B2B Customers';
                Editable = false;
            }
            field("WRN B2C War.Dur.Labor"; Rec."WRN B2C War.Dur.Labor")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Labor Warranty for B2C Customers';
                Editable = false;
            }
            field("WRN B2C War.Dur.Parts"; Rec."WRN B2C War.Dur.Parts")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Parts Warranty for B2C Customers';
                Editable = false;
            }
        }
    }

}