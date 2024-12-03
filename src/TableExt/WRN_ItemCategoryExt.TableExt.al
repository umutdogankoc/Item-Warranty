tableextension 50100 "WRN Item Category Ext." extends "Item Category"
{
    fields
    {
        field(50100; "WRN B2C War.Dur.Labor"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2C Warranty Duration Labor';
            Access = Internal;
            CharAllowed = '09MM';
        }

        field(50101; "WRN B2C War.Dur.Parts"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2C Warranty Duration Parts';
            Access = Internal;
            CharAllowed = '09MM';
        }
        field(50102; "WRN B2B War.Dur.Labor"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2B Warranty Duration Labor';
            Access = Internal;
            CharAllowed = '09MM';
        }
        field(50103; "WRN B2B War.Dur.Parts"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2B Warranty Duration Parts';
            Access = Internal;
            CharAllowed = '09MM';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}