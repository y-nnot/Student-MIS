page 50114 "Stage List"
{
    Caption = 'Stage List';
    PageType = List;
    SourceTable = Stages;
    CardPageId = "Stages Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Stage ID"; Rec."Stage ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stage ID field.';
                }
                field(Name; Rec.Program)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Fee Amount"; Rec."Fee Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
