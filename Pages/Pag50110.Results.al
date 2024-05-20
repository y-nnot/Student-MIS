page 50110 Results
{
    Caption = 'Results';
    PageType = Card;
    SourceTable = Result;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student No"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No field.';
                    TableRelation = "customer";
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.';
                    TableRelation = "Program";
                    LookupPageId = "programs card";
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                    TableRelation = "Unit";
                    LookupPageId = "Units";
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Score field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
            }
        }
    }
}
