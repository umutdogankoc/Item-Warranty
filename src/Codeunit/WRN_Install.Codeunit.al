codeunit 50100 "WRN Install"
{
    Subtype = Install;

    var
        EnableWrnExt: Codeunit "WRN Enable Warranty Extension";

    trigger OnInstallAppPerCompany()
    var
        AppInfo: ModuleInfo;
    begin
        if AppInfo.DataVersion = Version.Create(0, 0, 0, 0) then begin
            HandleFreshInstall();
        end
        else
            HandeReinstall();
    end;

    local procedure HandleFreshInstall()
    begin
        if (EnableWrnExt.IsWarrantyManagementApplicationAreaEnabled()) then
            exit;
        EnableWrnExt.EnableWarrantyManagementExtension();
        EnableWrnExt.InstallCustomerWarrantyFields();
        EnableWrnExt.InstallItemWarrantyDurations();
    end;

    local procedure HandeReinstall()
    begin
        EnableWrnExt.InstallCustomerWarrantyFields();
    end;

}