page 50125 "Student Registration List"
{
    Caption = 'Student Registration List';
    PageType = List;
    SourceTable = Student;
    CardPageId = "Student Registration";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Reg No"; Rec."Reg No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Application ID"; Rec."Application ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application ID field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s city.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';
                }
                field(" Posting Group"; Rec." Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field("Fee Balance"; Rec."Fee Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Sponsorship; Rec.Sponsorship)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s mobile telephone number.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Session field.';
                }
                field("Program"; Rec."Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Program field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Reg.Status"; Rec."Reg.Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reg.Status field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field(" Registered By"; Rec." Registered By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Registered By field.';
                }
            }
        }
    }
}
