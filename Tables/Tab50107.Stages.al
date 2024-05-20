table 50107 Stages
{
    Caption = 'Stages';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Stage List";
    // LookupPageId = "Stage Units";

    fields
    {
        field(1; "Stage ID"; Code[10])
        {
            Caption = 'Stage ID';
        }
        field(2; Program; Code[100])
        {
            Caption = 'Program';
            TableRelation = Program;
        }
        field(3; "Fee Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Stage ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Stage ID", "Fee Amount")
        {

        }
    }
}
