reportextension 50100 "WRN Standard Sales Inv. Ext." extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Line)
        {
            column(WRN_Labor_Warranty_Start_Date; Format("WRN Labor Warranty Start Date", 0, 1))
            {

            }
            column(WRN_Labor_Warranty_Start_Date_Caption; fieldcaption("WRN Labor Warranty Start Date"))
            {

            }
            column(WRN_Labor_Warranty_End_Date; Format("WRN Labor Warranty End Date", 0, 1))
            {

            }
            column(WRN_Labor_Warranty_End_Date_Caption; fieldcaption("WRN Labor Warranty End Date"))
            {

            }
            column(WRN_Parts_Warranty_Start_Date; Format("WRN Parts Warranty Start Date", 0, 1))
            {

            }
            column(WRN_Parts_Warranty_Start_Date_Caption; fieldcaption("WRN Parts Warranty Start Date"))
            {

            }
            column(WRN_Parts_Warranty_End_Date; Format("WRN Parts Warranty End Date", 0, 1))
            {

            }
            column(WRN_Parts_Warranty_End_Date_Caption; fieldcaption("WRN Parts Warranty End Date"))
            {

            }
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(WRN_Layout)
        {
            Type = Word;
            LayoutFile = 'src/ReportLayouts/WRN_Layout.docx';
        }
    }
}