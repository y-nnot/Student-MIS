table 50112 "Student Number Setup"
{
    Caption = 'Student Number Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
        }
        field(2; "Student Number"; Code[50])
        {
            Caption = 'Student Number';
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
