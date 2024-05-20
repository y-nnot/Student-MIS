page 50117 "Units Card"
{
    Caption = 'Units Card';
    PageType = Card;
    SourceTable = Unit;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Unit Code")
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
