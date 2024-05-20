page 50112 "Appliations Setups"
{
    Caption = 'Appliations Setup';
    PageType = Card;
    SourceTable = "Applications Setups";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Applicant No"; Rec."Applicant No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applicant No field.';
                }
            }
        }
    }
}
