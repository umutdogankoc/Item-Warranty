codeunit 50102 "WRN Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', false, false)]
    local procedure "Sales-Post_OnAfterSalesInvLineInsert"(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header"; var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; PreviewMode: Boolean)
    var
        SalesLine2: Record "Sales Line";
    begin
        if not SalesLine."WRN Extended Warranty" then begin

            SalesInvLine."WRN Labor Warranty Start Date" := SalesInvLine."Posting Date";
            SalesInvLine."WRN Parts Warranty Start Date" := SalesInvLine."Posting Date";
            SalesInvLine."WRN Labor Warranty End Date" := CalcDate(SalesLine."WRN War.Dur.Labor", SalesInvLine."Posting Date");
            SalesInvLine."WRN Parts Warranty End Date" := CalcDate(SalesLine."WRN War.Dur.Parts", SalesInvLine."Posting Date");

            SalesLine2.SetRange("Document Type", SalesLine."Document Type");
            SalesLine2.SetRange("Document No.", SalesLine."Document No.");
            SalesLine2.SetRange("WRN Extended Warranty", true);
            SalesLine2.SetRange("WRN Ext. War. Linked Line No.", SalesLine."Line No.");
            SalesLine2.SetLoadFields("WRN Extended Warranty Duration");
            SalesLine2.ReadIsolation := IsolationLevel::ReadUncommitted;
            if SalesLine2.FindSet() then begin
                repeat
                    SalesInvLine."WRN Labor Warranty End Date" := CalcDate(SalesLine2."WRN Extended Warranty Duration", SalesInvLine."WRN Labor Warranty End Date");
                until SalesLine2.Next() = 0;
            end;

            SalesInvLine.Modify();
        end;
    end;

}