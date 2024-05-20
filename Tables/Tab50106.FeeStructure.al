table 50106 "Fee Structure"
{
    Caption = 'Fee Structure';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "S No"; Code[2])
        {
            Caption = 'S No';
        }
        field(2; Item; Text[100])
        {
            Caption = 'Item';
        }
        field(3; Stage; Text[100])
        {
            Caption = 'Stage';
            TableRelation = Stages;
        }

        field(4; Amount; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "S No")
        {
            Clustered = true;
        }
    }
}
