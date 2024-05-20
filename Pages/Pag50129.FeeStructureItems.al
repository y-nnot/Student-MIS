page 50129 "Fee Structure Items"
{
    Caption = 'Fee Structure Items';
    PageType = ListPart;
    SourceTable = "Fee Structure";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Programs field';
                }
            }
        }
    }
}
