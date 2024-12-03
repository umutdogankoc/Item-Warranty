pageextension 50102 "WRN Sales Order Subform Ext." extends "Sales Order Subform"
{
    layout
    {
        addafter("Shipment Date")
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
            field("WRN Extended Warranty"; Rec."WRN Extended Warranty")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies if line is an extended warranty line';
            }
            field("WRN Extended Warranty Duration"; Rec."WRN Extended Warranty Duration")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies duration of extended warranty';
            }
            field("WRN Ext. War. Linked Line No."; Rec."WRN Ext. War. Linked Line No.")
            {
                ApplicationArea = WarrantyApp;
                ToolTip = 'Specifies order line no which warranty is being applied';
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
                Caption = 'Assign Warranty Items';
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