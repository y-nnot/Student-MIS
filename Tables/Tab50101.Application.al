table 50101 Application
{
    Caption = 'Application';
    DataClassification = CustomerContent;
    DrillDownPageId = Applications;
    LookupPageId = Applications;

    fields
    {
        field(1; "Application ID"; Code[20])
        {
            Caption = 'Application ID';
            Editable = false;
        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(5; "Grade "; Code[2])
        {
            Caption = 'Grade ';
        }
        field(6; "Program"; Text[100])
        {
            Caption = 'Program';
        }

        field(7; Address; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; City; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Contact; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Mode of Study"; Option)
        {
            Caption = 'Mode of Study';
            OptionMembers = ,Regular,Evening,Weekends;
        }
        field(11; Sponsorship; Option)
        {
            Caption = 'Sponsorship';
            OptionMembers = ,Self,Government;

        }
        field(12; Gender; Enum Gender)
        {
            Caption = 'Gender';

        }
        field(13; PWD; Boolean)
        {
            Caption = 'PWD';
        }

        field(14; Status; Option)
        {
            Caption = 'Application Status';
            Editable = false;
            OptionMembers = ,Submited,Pending,Approved,Rejected;

        }
    }
    keys
    {
        key(PK; "Application ID")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Application ID", "First Name")
        {

        }
    }

    trigger OnInsert()  //Insert applicant number automatically from No. Series when creating a new application
    var
        ApplicationSetup: Record "Applications Setups"; // Get records from Applicaions setups table
        NoSeriesMgnt: Codeunit NoSeriesManagement; // The codeunit that helps us create the record automatically
    begin
        if "Application ID" = '' then begin
            ApplicationSetup.Get();
            ApplicationSetup.TestField("Applicant No");
            NoSeriesMgnt.InitSeries(ApplicationSetup."Applicant No", ApplicationSetup."Applicant No", WorkDate(), "Application ID", ApplicationSetup."Applicant No");
        end;
    end;

}
