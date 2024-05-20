table 50103 "Program"
{
    Caption = 'Program';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Programs List";

    fields
    {
        field(1; "Program ID"; Code[20])
        {
            Caption = 'Proram ID';
        }
        field(2; Name; Text[200])
        {
            Caption = 'Name';
        }

        field(4; Student; Text[50])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "Program ID")
        {
            Clustered = true;
        }
    }
}
