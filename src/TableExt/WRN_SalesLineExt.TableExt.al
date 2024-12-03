tableextension 50103 "WRN Sales Line Ext." extends "Sales Line"
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

        modify("No.")
        {
            trigger OnAfterValidate()
            var
                ItemRec: Record Item;
                SalesHeaderRec: Record "Sales Header";
            begin
                if Rec.Type = Rec.Type::Item then begin
                    SalesHeaderRec := Rec.GetSalesHeader();
                    Rec."WRN Customer Warranty Type" := SalesHeaderRec."WRN Customer Warranty Type";
                    GetWarrantyDuration();
                end;
            end;
        }
    }

    local procedure GetWarrantyDuration()
    var
        ItemRec: Record Item;
    begin
        ItemRec.SetLoadFields("WRN B2B War.Dur.Labor", "WRN B2B War.Dur.Parts", "WRN B2C War.Dur.Labor", "WRN B2C War.Dur.Parts", "WRN Extended Warranty");
        ItemRec.ReadIsolation := IsolationLevel::ReadUncommitted;
        ItemRec.Get(Rec."No.");
        if not ItemRec."WRN Extended Warranty" then
            case Rec."WRN Customer Warranty Type" of
                Rec."WRN Customer Warranty Type"::B2B:
                    begin
                        Rec.Validate("WRN War.Dur.Labor", ItemRec."WRN B2B War.Dur.Labor");
                        Rec.Validate("WRN War.Dur.Parts", ItemRec."WRN B2B War.Dur.Parts");
                    end;
                Rec."WRN Customer Warranty Type"::B2C:
                    begin
                        Rec.Validate("WRN War.Dur.Labor", ItemRec."WRN B2C War.Dur.Labor");
                        Rec.Validate("WRN War.Dur.Parts", ItemRec."WRN B2C War.Dur.Parts");
                    end;
            end;
    end;

    internal procedure SelectWarrantyItems()
    var
        ItemListPage: Page "Item List";
        SelectionFilter: Text;
        ItemRec: Record Item;

    begin
        ItemRec.SetRange("Sales Blocked", false);
        ItemRec.SetRange("WRN Extended Warranty", true);

        SelectionFilter := ItemListPage.SelectInItemList(ItemRec);
        if SelectionFilter <> '' then begin
            AddWarrantyItems(SelectionFilter, Rec."Line No.");
        end;
    end;

    local procedure AddWarrantyItems(SelectionFilter: Text; xLineNo: Integer)
    var
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        LineSpacing: Integer;
        NextLineNo: Integer;
    begin
        LineSpacing := 10;
        Rec.InitNewLine(SalesLine);
        NextLineNo := xLineNo + LineSpacing;
        ItemRec.SetFilter("No.", SelectionFilter);
        if ItemRec.FindSet() then begin
            SalesLine.Init();
            SalesLine."Line No." := NextLineNo;
            SalesLine.Validate(Type, SalesLine.Type::Item);
            SalesLine.Validate("No.", ItemRec."No.");
            SalesLine.Validate("WRN Extended Warranty", true);
            SalesLine.Validate("WRN Extended Warranty Duration", ItemRec."WRN Extended Warranty Duration");
            SalesLine.Validate("WRN Ext. War. Linked Line No.", xLineNo);
            SalesLine.Insert(true);
            SalesLine.Level := 2;
            SalesLine.Modify();
        end;
    end;
}