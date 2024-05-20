table 50110 AdmissionsCue
{
    Caption = 'AdmissionsCue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
        }
        field(2; "All Applicants"; Integer)
        {
            Caption = 'All Applicants';
            FieldClass = FlowField;
            CalcFormula = count(Application);
        }
        field(3; "Approved Applicants"; Integer)
        {
            Caption = 'Approved Applicants';
            FieldClass = FlowField;
            CalcFormula = count(Application);
        }
        field(4; "Rejected Applicants"; Integer)
        {
            Caption = 'Rejected Applicants';
            FieldClass = FlowField;
            CalcFormula = count(Application);
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
