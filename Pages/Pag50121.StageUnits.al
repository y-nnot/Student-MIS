page 50121 "Stage Units Lines"
{
    Caption = 'Stage Units';
    PageType = ListPart;
    SourceTable = "Stage Units";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
