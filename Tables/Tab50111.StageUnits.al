table 50111 "Stage Units"
{
    Caption = 'Stage Units';
    DataClassification = ToBeClassified;
    LookupPageId = "Stage Units Lines";


    fields
    {
        field(1; "Unit Code "; Code[50])
        {
            Caption = 'Unit Code ';

        }
        field(2; Name; Code[100])
        {
            Caption = 'Name';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Core,Common;
        }
        field(4; "Stage ID"; Code[20])
        {
            Caption = 'Stage ID';
        }
        field(5; "Reg No"; Code[20])
        {
            Caption = 'Reg No';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Reg No", "Unit Code ", "Stage ID")
        {
            Clustered = true;
        }
    }
}
