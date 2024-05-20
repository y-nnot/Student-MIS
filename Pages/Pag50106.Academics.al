page 50106 Academics
{
    Caption = 'Academics';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(LC; "Academic Cues")
            {
                ApplicationArea = All;
            }

        }

    }


    actions
    {
        area(Sections)
        {
            group(Programs)
            {
                action(Doctorate)
                {
                    ApplicationArea = All;
                    RunObject = page "Vendor Entry Statistics";
                }

                action(Masters)
                {
                    ApplicationArea = All;
                    RunObject = page "Absence Overview by Periods";

                }

                action(Bachelors)
                {
                    ApplicationArea = All;
                    RunObject = page "Academics";
                }

                action(Diploma)
                {
                    ApplicationArea = All;
                    RunObject = page "Academics";
                }

                action(Certificate)
                {
                    ApplicationArea = All;
                    RunObject = page "Customer Card";
                }
            }
            group("Student Registration")
            {
                action("Register Student")
                {
                    ApplicationArea = All;
                    RunObject = page "Student Registration List";
                    RunPageMode = Create;
                }

                action("Bill Student")
                {
                    ApplicationArea = All;
                    RunObject = page "Student Billing";
                    RunPageMode = Create;
                }
            }

            group(Lecturer)
            {
                action("Lecturer List")
                {
                    ApplicationArea = All;
                    RunObject = page "Lecturers";
                    RunPageMode = Create;
                }
            }

        }

        area(Embedding)
        {
            action("All Programs")
            {
                ApplicationArea = All;
                RunObject = page "Programs List";
            }


            action("Stages")
            {
                ApplicationArea = All;
                ;
                RunObject = page "Stage List";
            }

            action(Units)
            {
                ApplicationArea = All;
                ;
                RunObject = page "Units";
            }

        }

        area(Processing)
        {
            action("Fee Structure")
            {
                ApplicationArea = All;
                RunObject = page "Fee Structure List";
            }
            action(Intakes)
            {
                ApplicationArea = All;
                RunObject = page "Item List";
            }

            action("How To Apply")
            {
                ApplicationArea = All;
                RunObject = page "Item List";
            }

        }
        area(Reporting)
        {
            group(Reports)
            {
                action("Units Report")
                {
                    ApplicationArea = All;
                    RunObject = report "Units Report";
                }

                action("Students Report")
                {
                    ApplicationArea = All;
                    RunObject = report "Student Report";
                }
            }
        }
    }
}
