pageextension 50117 Students extends "Customer Card"
{
    layout
    {
        addbefore(General)
        {
            field(Session; Rec.Stage)
            {
                ApplicationArea = All;
            }

            field(Program; Rec.Program)
            {
                ApplicationArea = All;
            }

            field(Status; Rec.Status)
            {
                ApplicationArea = All;
            }

            field(Gender; Rec.Gender)
            {
                ApplicationArea = All;
            }

            field("Home County"; Rec."Fee Amount")
            {
                ApplicationArea = All;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}