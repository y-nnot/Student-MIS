page 50101 StudentRC
{
    Caption = 'StudentRC';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {

        }
    }
    actions
    {
        area(Sections)
        {
            group(Student)
            {
                action("Student List")
                {

                    ApplicationArea = All;
                    RunObject = page "Customer list";

                }
            }
            group(Lecturer)
            {
                action("Lecturer List")
                {

                    ApplicationArea = All;
                    RunObject = page "Lecturer list";

                }

                action("Add Results")
                {

                    ApplicationArea = All;
                    RunObject = page "Results";

                }
            }
        }

        area(Embedding)
        {
            action("Profile")
            {
                ApplicationArea = All;
                RunObject = page "Units";
            }
            action("Register Units")
            {
                ApplicationArea = All;
                RunObject = page "Units";
            }

            action(Results)
            {
                ApplicationArea = All;
                RunObject = report "Results Report";
            }

        }
    }



}
