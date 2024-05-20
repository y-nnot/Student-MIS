page 50109 "Programs Card"
{
    Caption = 'Programs';
    PageType = Card;
    SourceTable = "Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Proram ID"; Rec."Program ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Proram ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }



            }

            part(Units; "Program Units")
            {
                ApplicationArea = Basic, Suit;
                SubPageLink = " Program ID" = field("Program ID");

            }
        }

    }
}
