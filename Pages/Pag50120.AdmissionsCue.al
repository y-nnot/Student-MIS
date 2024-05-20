page 50120 "Admissions Cue"
{
    Caption = 'Admissions Cue';
    PageType = CardPart;
    SourceTable = AdmissionsCue;

    layout
    {
        area(content)
        {
            cuegroup("Admission Stats")
            {


                field("All Applicants"; Rec."All Applicants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the All Applicants field.';
                }
                field("Approved Applicants"; Rec."Approved Applicants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Applicants field.';
                }
                field("Rejected Applicants"; Rec."Rejected Applicants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rejected Applicants field.';
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
