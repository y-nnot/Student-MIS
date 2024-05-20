page 50104 Applications
{
    Caption = 'Applications';
    PageType = List;
    SourceTable = Application;
    CardPageId = Application;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application ID"; Rec."Application ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application ID field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Grade "; Rec."Grade ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade  field.';
                }
                field("Program"; Rec."Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Program field.';
                }
                field("Mode of Study"; Rec."Mode of Study")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mode of Study field.';
                }
                field(Sponsorship; Rec.Sponsorship)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsorship field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(PWD; Rec.PWD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PWD field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
