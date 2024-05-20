page 50122 "StageUnits Card"
{
    Caption = 'Stage Units Card';
    PageType = Card;
    SourceTable = "Stage Units";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Unit Code "; Rec."Unit Code ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Code  field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }
}
