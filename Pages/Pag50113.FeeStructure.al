page 50113 "Fee Structure "
{
    Caption = 'Fee Structure ';
    PageType = Card;
    SourceTable = "Fee Structure";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("S No"; Rec."S No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S No field.';
                }
                field(Item; Rec.Item)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item field.';
                }
                field(Session; Rec.Stage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Session field.';
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Programs field';
                }
            }
        }
    }
}
