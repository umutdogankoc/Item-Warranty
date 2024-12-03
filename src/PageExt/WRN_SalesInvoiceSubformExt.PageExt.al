pageextension 50105 "WRN Sales Invoice Subform Ext." extends "Sales Invoice Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field("WRN War.Dur.Labor"; Rec."WRN War.Dur.Labor")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies Duration of Labor Warranty';
            }
            field("WRN War.Dur.Parts"; Rec."WRN War.Dur.Parts")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies Duration of Part Warranty';
            }
        }
    }

    actions
    {
        addafter(SelectMultiItems)
        {
            action(SelectWarrantyItems)
            {
                AccessByPermission = TableData Item = R;
                ApplicationArea = WarrantyApp;
                Caption = 'Asssign Warranty Items';
                Image = WarrantyLedger;
                ToolTip = 'Assign additional warranty to current item';
                trigger OnAction()
                begin
                    Rec.TestField("WRN Extended Warranty", false);
                    Rec.SelectWarrantyItems();
                end;
            }
        }
    }
}