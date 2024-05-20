page 50124 "Fee Structure List"
{
    Caption = 'Fee Structure List';
    PageType = List;
    SourceTable = "Fee Structure";
    CardPageId = "Fee Structure ";

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
                field(Stage; Rec.Stage)
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
