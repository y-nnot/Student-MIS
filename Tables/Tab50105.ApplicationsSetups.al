table 50105 "Applications Setups"
{
    Caption = 'Applications Setups';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[5])
        {
            Caption = 'Primary Key';
        }
        field(2; "Applicant No"; Code[50])
        {
            Caption = 'Applicant No';
            TableRelation = "No. Series";
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
