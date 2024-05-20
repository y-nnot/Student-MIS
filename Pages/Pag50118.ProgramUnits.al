page 50118 "Program Units"
{
    Caption = 'Program Units';
    PageType = ListPart;
    SourceTable = "Program Units";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Unit Code"; Rec."Code")
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
                    ToolTip = 'Specifies the value of the Stage field.';
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
