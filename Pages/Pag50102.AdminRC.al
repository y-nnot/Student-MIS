page 50102 AdminRC
{
    Caption = 'AdminRC';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {

        }
    }
    actions
    {
        area(Embedding)
        {
            action(" Student Profile")
            {
                ApplicationArea = All;
                RunObject = page "Units";
            }
            action("Register Units")
            {
                ApplicationArea = All;
                RunObject = page "Units";
            }

            action("Student Results")
            {
                ApplicationArea = All;
                RunObject = page "Units";
            }

        }

        area(Creation)
        {
            action("New Student")
            {
                ApplicationArea = All;
                Caption = 'Create Student';
                RunObject = page "Customer List";
            }

            action("Student List")
            {
                ApplicationArea = All;
                Caption = 'Students List';
                RunObject = page "Customer List";
            }

            action("Results")
            {
                ApplicationArea = All;
                Caption = 'Students Result';
                RunObject = page "Customer List";
            }

            action("Programs")
            {
                ApplicationArea = All;
                Caption = 'Program Listt';
                RunObject = page "Customer List";
            }
        }

        area(Reporting)
        {
            action("Students Report")
            {
                ApplicationArea = All;
                Caption = 'Student Report';
                RunObject = page "Customer List";
            }

            action("Lecturers Report")
            {
                ApplicationArea = All;
                Caption = 'Lecturers Report';
                RunObject = page "Customer List";
            }

            action("Admision Report")
            {
                ApplicationArea = All;
                Caption = 'Admision Report';
                RunObject = page "Customer List";
            }
        }
    }
}
