tableextension 50101 "WRN Item Ext." extends Item
{
    fields
    {

        field(50100; "WRN B2C War.Dur.Labor"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2C Warranty Duration Labor';
            CharAllowed = '09MM';
        }

        field(50101; "WRN B2C War.Dur.Parts"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2C Warranty Duration Parts';
            CharAllowed = '09MM';
        }
        field(50102; "WRN B2B War.Dur.Labor"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2B Warranty Duration Labor';
            CharAllowed = '09MM';
        }
        field(50103; "WRN B2B War.Dur.Parts"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'B2B Warranty Duration Parts';
            CharAllowed = '09MM';
        }
        field(50104; "WRN Extended Warranty"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Extended Warranty';
        }
        field(50105; "WRN Extended Warranty Duration"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Extended Warranty Duration';
            CharAllowed = '09MM';
        }
        modify("Item Category Code")
        {
            trigger OnAfterValidate()
            begin
                if not Rec."WRN Extended Warranty" then
                    ValidateWarrantyFields();
            end;
        }
    }
    local procedure ValidateWarrantyFields()
    var
        ItemCategory: Record "Item Category";
    begin
        if Rec."Item Category Code" <> '' then begin
            ItemCategory.SetLoadFields("WRN B2B War.Dur.Labor", "WRN B2B War.Dur.Parts", "WRN B2C War.Dur.Labor", "WRN B2C War.Dur.Parts");
            ItemCategory.ReadIsolation := IsolationLevel::ReadUncommitted;
            if ItemCategory.Get("Item Category Code") then begin
                Rec."WRN B2B War.Dur.Labor" := ItemCategory."WRN B2B War.Dur.Labor";
                Rec."WRN B2B War.Dur.Parts" := ItemCategory."WRN B2B War.Dur.Parts";
                Rec."WRN B2C War.Dur.Labor" := ItemCategory."WRN B2C War.Dur.Labor";
                Rec."WRN B2C War.Dur.Parts" := ItemCategory."WRN B2C War.Dur.Parts";
            end;
        end;
    end;
}

