page 50123 "Student Registration"
{
    Caption = 'Student Registration';
    PageType = Card;
    SourceTable = Student;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(" Student No."; Rec."Reg No")
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
                field("Sponshorship"; Rec."Sponsorship")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Posting Group"; Rec." Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field("Fee Balance"; Rec."Fee Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';

                }

                field("Mobile Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s mobile telephone number.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                    TableRelation = Stages;
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
                    Editable = false;
                }
            }
            part("Units Line"; "Stage Units Lines")
            {
                ApplicationArea = Basic, Suit;
                // SubPageLink = "Code" = field("Reg No");

            }

        }

        area(factboxes)
        {
            part(Control82; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Applicant Picture';
                SubPageLink = "No." = FIELD("Application ID");
                Visible = true;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                // SubPageLink = "Table ID" = CONST(23),
                //               "No." = FIELD("No.");
            }

            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Process")
            {
                action("Bill Student")


                {
                    Caption = 'Bill Student';
                    ApplicationArea = all;
                    Image = ReceivableBill;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    trigger OnAction()
                    var
                        Stage: Record "Stages";
                        GLEntry: Record "Gen. Journal Line";
                        GLSetup: Record "General Ledger Setup";
                        JournalBatchName: Code[10];
                        ConfirmBilling: Boolean;
                        StageIDLink: Code[20];
                        customer: Record "Customer";
                    begin
                        StageIDLink := Rec."stage"; // Assume "Stage ID" is how you link stage to student/customer
                        if StageIDLink = '' then
                            Error('Please select a stage for the Student.');

                        if Stage.Get(StageIDLink) then begin
                            ConfirmBilling := Confirm(StrSubstNo('Do you want to bill the student for %1?', Format(Stage."Fee Amount")), false);
                            if ConfirmBilling then begin
                                Rec."Fee Balance" := Stage."Fee Amount";
                                // Rec."Fee Balance" := Rec."Fee Balance" + Stage."Fee Amount";
                                Rec.Modify();
                                Message('Student balance updated to %1.', Format(Rec."Fee Balance"));

                                // Ensure General Ledger Setup has default values
                                if not GLSetup.Get() then
                                    Error('General ledger setup is not defined.');

                                // Define the default Journal Batch Name
                                JournalBatchName := 'DEFAULT';

                                // Create General Journal Line
                                GLEntry.Init();
                                GLEntry."Journal Template Name" := 'GENERAL';
                                GLEntry."Journal Batch Name" := JournalBatchName;
                                GLEntry."Line No." := GLEntry."Line No." + 10000;
                                GLEntry."Account No." := Rec."Reg No";  // Assuming this is the customer account number
                                GLEntry."Posting Date" := Today();
                                GLEntry."Document Type" := GLEntry."Document Type"::"Invoice";
                                GLEntry."Account Type" := GLEntry."Account Type"::Customer;
                                GLEntry.Description := StrSubstNo('Billing for stage %1', Stage."Stage ID");
                                GLEntry.Amount := Stage."Fee Amount";
                                GLEntry."Amount (LCY)" := Stage."Fee Amount";

                                GLEntry.Insert();

                                Message('General journal entry created for %1.', Format(GLEntry.Amount));
                            end;
                        end
                        else
                            Error('Selected stage does not exist.');
                    end;
                }


                action("Register Student")
                {
                    Caption = 'Register Student';
                    ApplicationArea = all;
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()

                    var
                        Customer: Record Customer;
                        Student: Record Student;
                    begin
                        if Student.Get(Rec."Reg No") then begin
                            Customer.Init();
                            Customer."No." := Student."Reg No";
                            Customer.Name := Student."First Name" + ' ' + Student."Last Name";
                            // Customer.Sponsorship := Application.Sponsorship;
                            // Customer."Mode of Study" := Application."Mode of Study";
                            Customer.Program := Student.Program;


                            Customer.Insert();
                            Message('Applicant Registered');
                            Rec."Reg.Status" := Rec."Reg.Status"::Registered;
                            Rec.Modify();


                        end
                        else
                            Error('The application must be in Suubmitted status to be Registered.');
                    end;
                }

                action("Reject Student")
                {
                    Caption = 'Reject Applicant';
                    ApplicationArea = all;
                    Image = Reject;
                    ToolTip = 'Reject the application.';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()

                    var
                        Custmer: Record Customer;
                        Application: Record Application;
                    begin
                        ;
                        begin
                            Message('Application Rejected, Try Again Later');
                            Rec."Reg.Status" := Rec."Reg.Status"::Rejected;
                            Rec.Modify();
                        end

                    end;
                }
                action(Email)
                {
                    ApplicationArea = All;
                    Caption = 'Send Email';
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Send an email to this customer.';

                    trigger OnAction()
                    var
                        TempEmailItem: Record "Email Item" temporary;
                        EmailScenario: Enum "Email Scenario";
                    begin
                        TempEmailItem.AddSourceDocument(Database::Customer, Rec.SystemId);
                        TempEmailitem."Send to" := Rec."E-Mail";
                        TempEmailItem.Send(false, EmailScenario::Default);
                    end;
                }
            }
        }
    }


}
