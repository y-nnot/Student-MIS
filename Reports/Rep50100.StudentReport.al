report 50100 "Student Report"
{
    Caption = 'Student Report';
    DefaultLayout = RDLC;
    RDLCLayout = './layout/Students Report.RDL';
    dataset
    {
        dataitem(Student; Student)
        {
            RequestFilterFields = Stage, "Program", "Gender";

            column(CompanyLogo; Company.Picture) { }
            column(CompanyName; Company.Name) { }
            column(CompanyAddress; Company.Address) { }
            column(CompanyEmail; Company."E-Mail") { }
            column(CompanyPhone; Company."Phone No.") { }
            column(RegNo; "Reg No")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(Program; "Program")
            {
            }
            column(Stage; Stage)
            {
            }
            column(Gender; Gender)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnInitReport()
    var
        MyInt: Integer;
    begin
        Company.Get();
        Company.CalcFields(Picture)

    end;

    var
        Company: Record "Company Information";
}


