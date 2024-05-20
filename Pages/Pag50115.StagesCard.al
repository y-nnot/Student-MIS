page 50115 "Stages Card"
{
    Caption = 'Stages Card';
    PageType = Card;
    SourceTable = Stages;


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
            part(Units; "Stage Units Lines")
            {
                ApplicationArea = Basic, Suit;
                SubPageLink = "Stage ID" = field("Stage ID");

            }
        }
    }
}
