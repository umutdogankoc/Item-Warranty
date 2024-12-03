tableextension 50106 "WRN Sales Invoice Line Ext." extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "WRN Customer Warranty Type"; Enum "WRN Customer Warranty Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Warranty Type';
            Editable = false;
        }
        field(50101; "WRN War.Dur.Labor"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Warranty Duration Labor';
            Editable = false;

        }

        field(50102; "WRN War.Dur.Parts"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Warranty Duration Parts';
            Editable = false;
        }
        field(50104; "WRN Extended Warranty"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Extended Warranty';
            Editable = false;
        }
        field(50105; "WRN Extended Warranty Duration"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Extended Warranty Duration';
            Editable = false;
        }
        field(50106; "WRN Ext. War. Linked Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Extended Warranty Linked Line No.';
            Editable = false;
        }

        field(50107; "WRN Labor Warranty Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Labor Warranty Start Date';
        }
        field(50108; "WRN Labor Warranty End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Labor Warranty End Date';
        }
        field(50109; "WRN Parts Warranty Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Parts Warranty Start Date';
        }
        field(50110; "WRN Parts Warranty End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Parts Warranty End Date';
        }
    }
}
