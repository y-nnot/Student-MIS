page 50116 "Programs List"
{
    Caption = 'Programs List';
    PageType = List;
    SourceTable = "Program";
    CardPageId = "Programs Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
        }
    }
}
