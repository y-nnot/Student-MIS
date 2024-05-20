tableextension 50100 Student extends Customer
{
    fields
    {
        field(50100; Stage; Code[10])
        {
            Caption = 'Stage';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                FeeBal: Record Stages;
            begin
                FeeBal.Reset();
                if FeeBal.Get(Stage) then
                    Rec."Balance" := FeeBal."Fee Amount"

            end;
        }
        field(50101; "Program"; Text[200])
        {
            Caption = 'Program';
            TableRelation = Program;
            DataClassification = ToBeClassified;
        }
        field(50102; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Registered,Rejected;
            DataClassification = ToBeClassified;
        }
        field(50103; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = ,Male,Female;
            DataClassification = ToBeClassified;
        }
        field(50104; "Fee Amount"; Text[20])
        {
            Caption = 'Fee Amount';
            DataClassification = ToBeClassified;
        }
    }
}
