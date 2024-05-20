report 50101 "Results Report"
{
    Caption = 'Results Report';
    DefaultLayout = RDLC;
    RDLCLayout = './layout/Results Report.RDL';
    dataset
    {
        dataitem(Result; Result)
        {
            column(StudentNo; "Student No")
            {
            }
            column(Course; Course)
            {
            }
            column(Unit; Unit)
            {
            }
            column(Score; Score)
            {
            }
            column(Remark; Remark)
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
}
