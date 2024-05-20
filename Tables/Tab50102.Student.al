table 50102 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;
    DrillDownPageId = Application;
    LookupPageId = Application;

    fields
    {
        field(1; "Reg No"; Code[50])
        {
            Caption = 'Reg No';
            Editable = false;
            TableRelation = "Student Number Setup";

        }
        field(2; "First Name"; Text[100])
        {
            Caption = 'First Name';
            Editable = false;
        }
        field(3; "Last Name"; Text[100])
        {
            Caption = 'Last Name';
            Editable = false;
        }
        field(4; "Application ID"; Code[50])
        {
            Caption = 'Application ID';
            TableRelation = Application;

            trigger OnValidate()
            var
                Applications: Record Application;
                StageFee: Record Stages;
            begin
                Applications.Reset();
                if Applications.Get("Application ID") then begin
                    "First Name" := Applications."First Name";
                    "Last Name" := Applications."Last Name";
                    Sponsorship := Applications.Sponsorship;
                    Gender := Applications.Gender;
                    "Reg.Status" := Applications.Status;
                    Contact := Applications.Contact;
                    City := Applications.City;
                    Address := Applications.Address;
                    "Fee Balance" := StageFee."Fee Amount";

                end;
            end;
        }

        field(5; Address; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; City; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Contact; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; " Posting Group"; text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Fee Balance"; Decimal)
        {
            // TableRelation = Stages;
            DataClassification = ToBeClassified;
            Editable = false;


        }

        field(10; Sponsorship; Option)
        {
            OptionMembers = ,Government,Self;
            Editable = false;

        }

        field(11; "Phone No."; Code[15])
        {
            DataClassification = ToBeClassified;
        }

        field(12; Stage; Code[5])
        {
            DataClassification = ToBeClassified;
            TableRelation = Stages;
            trigger OnValidate()
            var
                FeeBal: Record Stages;
            begin
                FeeBal.Reset();
                if FeeBal.Get(Stage) then
                    Rec."Fee Balance" := FeeBal."Fee Amount"

            end;


        }

        field(13; "Program"; Text[200])
        {
            Caption = 'Program';
            TableRelation = Program;


        }
        field(14; Gender; Enum Gender)
        {
            Caption = 'Gender';
            Editable = false;
        }

        field(15; "Reg.Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Pending,Registered,Rejected;
            Editable = false;
        }

        field(16; "Registration Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; " Registered By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Units Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Program Units";

            trigger OnValidate()
            var
                ProgUnits: Record "Program Units";
            begin
                ProgUnits.Reset();
                if ProgUnits.Get("Units Code") then begin
                    Name := ProgUnits.Name;
                    "Credit Hour" := ProgUnits."Credit Hour";
                end;
            end;
        }

        field(19; Name; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(20; "Credit Hour"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "E-mail"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Reg No")
        {
            Clustered = true;

        }
    }
    trigger OnInsert()
    var
        MyInt: Integer;
        StudNoSetup: Record "Student Number Setup";
        NoSeriesMgmnt: Codeunit "NoSeriesManagement";

    begin
        "Registration Date" := CurrentDateTime;
        " Registered By" := UserId;

        if "Reg No" = '' then begin
            StudNoSetup.Get();
            NoSeriesMgmnt.InitSeries(StudNoSetup."Student Number", StudNoSetup."Student Number", WorkDate(), "Reg No", StudNoSetup."Student Number");
        end;
    end;
}
