pageextension 50108 "WRN Item Category Card Ext." extends "Item Category Card"
{
    layout
    {
        addlast(General)
        {

            field("WRN B2B War.Dur.Labor"; Rec."WRN B2B War.Dur.Labor")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Labor Warranty for B2B Customers';
            }
            field("WRN B2B War.Dur.Parts"; Rec."WRN B2B War.Dur.Parts")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Parts Warranty for B2B Customers';
            }
            field("WRN B2C War.Dur.Labor"; Rec."WRN B2C War.Dur.Labor")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Labor Warranty for B2C Customers';
            }
            field("WRN B2C War.Dur.Parts"; Rec."WRN B2C War.Dur.Parts")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of Parts Warranty for B2C Customers';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}