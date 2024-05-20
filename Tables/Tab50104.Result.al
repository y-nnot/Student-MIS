table 50104 Result
{
    Caption = 'Result';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No"; Code[20])
        {
            Caption = 'Student No';
        }
        field(2; Course; Text[100])
        {
            Caption = 'Course';
        }
        field(3; Unit; Text[100])
        {
            Caption = 'Unit';
        }
        field(4; Score; Code[3])
        {
            Caption = 'Score';
        }
        field(5; Remark; Text[100])
        {
            Caption = 'Remark';
        }
    }
    keys
    {
        key(PK; "Student No", "Course", "Unit")
        {
            Clustered = true;
        }
    }
}
