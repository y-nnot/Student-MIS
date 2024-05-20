table 50100 Unit
{
    Caption = 'Unit';
    DataClassification = ToBeClassified;
    DrillDownPageId = Units;
    LookupPageId = Units;

    fields
    {
        field(1; "Unit Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Stage; Text[100])
        {
            Caption = 'Stage';
            DataClassification = CustomerContent;
        }
        field(4; "Credit Hour"; Code[3])
        {
            Caption = 'Credit Hour';
            DataClassification = CustomerContent;
        }
        field(5; "Program ID"; Code[20])
        {
            Caption = 'Program ID';
        }
    }
    keys
    {
        key(PK; "Unit Code", "Program ID")
        {
            Clustered = true;
        }
    }
}
