table 50108 "Program Units"
{
    Caption = 'Program Units';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Unit Code';
            TableRelation = Unit;
            trigger OnValidate()
            var
                Units: Record Unit;
            begin
                Units.Reset();
                if Units.Get(Units."Unit Code") then begin
                    Name := Units.Name;
                    Stage := Units.Stage;
                    "Credit Hour" := Units."Credit Hour";
                end;
            end;
        }
        field(2; Name; Text[200])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(3; Stage; Code[50])
        {
            Caption = 'Stage';
            Editable = false;
        }
        field(4; "Credit Hour"; Code[3])
        {
            Caption = 'Credit Hour';
            Editable = false;
        }
        field(5; " Program ID"; Code[20])
        {
            Caption = 'Program ID';
            TableRelation = Program;
            DataClassification = CustomerContent;
        }
        field(6; "Reg No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Student;
        }
    }
    keys
    {
        key(PK; "Code", " Program ID")
        {
            Clustered = true;
        }
    }
}
