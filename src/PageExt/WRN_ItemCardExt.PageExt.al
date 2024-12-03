pageextension 50101 "WRN Item Card Ext." extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group("Item Warranty")
            {

                Caption = 'Warranty';
                field("WRN Extended Warranty"; Rec."WRN Extended Warranty")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies if item is an extended warranty item';
                }
                field("WRN Extended Warranty Duration"; Rec."WRN Extended Warranty Duration")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies duration of extended warranty';
                    Editable = Rec."WRN Extended Warranty";
                }
                field("WRN B2B War.Dur.Labor"; Rec."WRN B2B War.Dur.Labor")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies duration of Labor Warranty for B2B Customers';
                    Editable = not Rec."WRN Extended Warranty";
                }
                field("WRN B2B War.Dur.Parts"; Rec."WRN B2B War.Dur.Parts")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies duration of Parts Warranty for B2B Customers';
                    Editable = not Rec."WRN Extended Warranty";
                }
                field("WRN B2C War.Dur.Labor"; Rec."WRN B2C War.Dur.Labor")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies duration of Labor Warranty for B2C Customers';
                    Editable = not Rec."WRN Extended Warranty";
                }
                field("WRN B2C War.Dur.Parts"; Rec."WRN B2C War.Dur.Parts")
                {
                    ApplicationArea = WarrantyApp;
                    ToolTip = 'Specifies duration of Parts Warranty for B2C Customers';
                    Editable = not Rec."WRN Extended Warranty";
                }
            }
        }
    }
}