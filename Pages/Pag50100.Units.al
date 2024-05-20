page 50100 Units
{
    Caption = 'Units';
    PageType = List;
    SourceTable = Unit;
    CardPageId = "Units Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                    TableRelation = Stages;
                    LookupPageId = "Stages Card";
                    ToolTip = 'Specifies the value of the Faculty field.';
                }
                field("Credit Hour"; Rec."Credit Hour")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Credit Hour field.';
                }
            }
        }
    }
}
