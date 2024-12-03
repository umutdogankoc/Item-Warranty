pageextension 50106 "WRN Posted Sal. Inv. Sub. Ext." extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Line Amount")
        {

            field("WRN Labor Warranty Start Date"; Rec."WRN Labor Warranty Start Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Labor Warranty Start Date field.', Comment = '%';
            }
            field("WRN Labor Warranty End Date"; Rec."WRN Labor Warranty End Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Labor Warranty End Date field.', Comment = '%';
            }
            field("WRN Parts Warranty Start Date"; Rec."WRN Parts Warranty Start Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Parts Warranty Start Date field.', Comment = '%';
            }
            field("WRN Parts Warranty End Date"; Rec."WRN Parts Warranty End Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Parts Warranty End Date field.', Comment = '%';
            }
        }
    }
}