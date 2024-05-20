table 50109 "Academic Cues"
{
    Caption = 'Academic Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
        }

        field(2; "All Programs"; Integer)
        {
            Caption = 'All Programs';
            FieldClass = FlowField;
            CalcFormula = count(Program);
        }
        field(3; "Registered Students"; Integer)
        {
            Caption = 'Registered Students';
            FieldClass = FlowField;
            CalcFormula = count(Application);
        }
        field(4; "All Units"; Integer)
        {
            Caption = 'All Units';
            FieldClass = FlowField;
            CalcFormula = count(Unit);
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
