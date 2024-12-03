codeunit 50101 "WRN Enable Warranty Extension"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", OnGetEssentialExperienceAppAreas, '', false, false)]
    local procedure "Application Area Mgmt._OnGetEssentialExperienceAppAreas"(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup."Warranty App" := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", OnValidateApplicationAreas, '', false, false)]
    local procedure "Application Area Mgmt._OnValidateApplicationAreas"(ExperienceTierSetup: Record "Experience Tier Setup"; TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        if ExperienceTierSetup.Essential then
            if not TempApplicationAreaSetup."Warranty App" then
                Error('Example App Area should be part of Essential in order for the Example Extension to work.');
    end;

    internal procedure IsWarrantyManagementApplicationAreaEnabled(): Boolean
    var
        ApplicationAreaSetup: Record "Application Area Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(ApplicationAreaSetup, CompanyName) then
            exit(ApplicationAreaSetup."Warranty App");
    end;

    internal procedure EnableWarrantyManagementExtension()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        ApplicationAreaMgmtFacade.RefreshExperienceTierCurrentCompany();
    end;

    internal procedure InstallCustomerWarrantyFields()
    var
        CustRec: Record Customer;
    begin
        CustRec.SetRange("VAT Registration No.", '');
        CustRec.SetLoadFields("VAT Registration No.", "WRN Customer Warranty Type");
        CustRec.ReadIsolation := IsolationLevel::ReadUncommitted;
        if CustRec.FindSet() then begin
            repeat
                CustRec."WRN Customer Warranty Type" := CustRec."WRN Customer Warranty Type"::B2C;
                CustRec.Modify();
            until CustRec.Next() = 0;
        end;
    end;

    internal procedure InstallItemWarrantyDurations()
    var
        ItemRec: Record Item;
        ItemCategoryRec: Record "Item Category";
    begin
        ItemRec.SetRange("WRN Extended Warranty", false);
        ItemRec.SetFilter("Item Category Code", '<>%1', '');
        ItemRec.SetLoadFields("Item Category Code", "WRN B2B War.Dur.Labor", "WRN B2B War.Dur.Parts", "WRN B2C War.Dur.Labor", "WRN B2C War.Dur.Parts");
        ItemRec.ReadIsolation := IsolationLevel::ReadUncommitted;
        if ItemRec.FindSet() then begin
            repeat
                ItemCategoryRec.Get(ItemRec."Item Category Code");
                ItemRec."WRN B2B War.Dur.Labor" := ItemCategoryRec."WRN B2B War.Dur.Labor";
                ItemRec."WRN B2B War.Dur.Parts" := ItemCategoryRec."WRN B2B War.Dur.Parts";
                ItemCategoryRec."WRN B2C War.Dur.Labor" := ItemCategoryRec."WRN B2C War.Dur.Labor";
                ItemCategoryRec."WRN B2C War.Dur.Parts" := ItemCategoryRec."WRN B2C War.Dur.Parts";
                ItemRec.Modify();
            until ItemRec.Next() = 0;
        end;

    end;
}