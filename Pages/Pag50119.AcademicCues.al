page 50119 "Academic Cues"
{
    Caption = 'Academic Cues';
    PageType = CardPart;
    SourceTable = "Academic Cues";

    layout
    {
        area(content)
        {
            cuegroup("Academics Statistics")
            {
                field("All Programs"; Rec."All Programs")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the All Programs field.';
                }
                field("Registered Students"; Rec."Registered Students")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registered Students field.';
                }
                field("All Units"; Rec."All Units")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the All Units field.';
                }
            }
        }

    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
