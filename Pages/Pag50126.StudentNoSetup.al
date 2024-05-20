page 50126 "Student No Setup"
{
    Caption = 'Student No Setup';
    PageType = Card;
    SourceTable = "Student Number Setup";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Student Number"; Rec."Student Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Number field.';
                }
            }
        }
    }
}
