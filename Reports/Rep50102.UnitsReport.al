report 50102 "Units Report"
{
    Caption = 'Units Report';
    DefaultLayout = RDLC;
    RDLCLayout = './layout/Units Report.RDL';
    dataset

    {
        dataitem(Unit; Unit)

        {
            RequestFilterFields = Stage, "Credit Hour";

            column(CompanyLogo; Company.Picture) { }
            column(CompanyName; Company.Name) { }
            column(CompanyAddress; Company.Address) { }
            column(CompanyEmail; Company."E-Mail") { }
            column(CompanyPhone; Company."Phone No.") { }
            column(Code; "Unit Code")
            {
            }
            column(Name; Name)
            {
            }
            column(Stage; Stage)
            {
            }
            column(CreditHour; "Credit Hour")
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
