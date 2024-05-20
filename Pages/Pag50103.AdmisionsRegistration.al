page 50103 "Admisions & Registration"
{
    Caption = 'Admisions';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Team Member")
            {
                ApplicationArea = All;
            }

            part(LC; "Admissions Cue")
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        area(Sections)
        {

            group(Setups)
            {
                action("Applications Setups")
                {
                    ApplicationArea = All;
                    RunObject = page "Appliations Setups";

                }
                action("Registration No Setup")
                {
                    ApplicationArea = All;
                    RunObject = page "Student No Setup";
                }
            }
            group(Applications)
            {
                action("All Applicants")
                {
                    ApplicationArea = All;
                    RunObject = page "Applications";
                }
                action("Pending Applicants")
                {
                    ApplicationArea = All;
                    RunObject = page "Applications";


                }

                action("Approved Applicants")
                {
                    ApplicationArea = All;
                    RunObject = page "Customer List";
                }

                action("Rejected Applicants")
                {
                    ApplicationArea = All;
                    RunObject = page "Customer List";
                }
            }
        }

        area(Embedding)
        {


            action(Students)
            {
                ApplicationArea = All;
                RunObject = page "Customer List";
            }
        }

        area(Creation)
        {
            action("Applicant List")
            {
                ApplicationArea = All;
                RunObject = page "Customer List";
                RunPageMode = Create;
            }

            action("New Applicant")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";

            }

        }

        area(Processing)
        {
            action("Fee Structure")
            {
                ApplicationArea = All;
                RunObject = page "Fee Structure ";
            }

            action("View Courses")
            {
                ApplicationArea = All;
                RunObject = page "Vendor List";
            }
        }

        area(Reporting)
        {
            action("Applicants List")
            {
                ApplicationArea = All;
                RunObject = report "Analysis Report";
            }

            action("Students Results")
            {
                ApplicationArea = All;
                RunObject = report "Results Report";
            }
        }
    }

}
