page 50105 Application
{
    Caption = 'Application';
    PageType = Card;
    SourceTable = Application;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application ID"; Rec."Application ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Application ID field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Name field.';

                    trigger OnValidate()
                    var
                        Applicant: Record Application;
                    begin
                        Applicant.Get(Rec."Application ID");
                        if Applicant."First Name" = '' then
                            Error('Please Fill in the Mandatory Fields');
                    end;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
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
                    TableRelation = "Program";
                    LookupPageId = "Programs card";
                }
                field("Mode of Study"; Rec."Mode of Study")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
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
        }
    }


    actions
    {
        area(processing)
        {
            group("Process")
            {
                action("Submit Application")
                {
                    Caption = 'Submit';
                    ApplicationArea = all;
                    Image = SendApprovalRequest;
                    ToolTip = 'Submit the applicant for Registration and Billing.';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()

                    var
                        Customer: Record Customer;
                        Application: Record Application;
                    begin
                        Application.Reset();
                        if Application.Get(Rec."Application ID") then begin
                            Customer.Init();
                            Customer."No." := Application."Application ID";
                            Customer.Name := Application."First Name" + ' ' + Application."Last Name";
                            // Customer.Sponsorship := Application.Sponsorship;
                            // Customer."Mode of Study" := Application."Mode of Study";
                            Customer.Program := Application.Program;


                            // Customer.Insert();
                            Message('Application Submitted');
                            Rec."Status" := Rec."Status"::Submited;
                            Rec.Modify();


                        end
                        else
                            Error('The application must be in Pending status to be approved.');
                    end;


                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = ' File Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }

                // action("RejectApplicant")
                // {
                //     Caption = 'Reject Applicant';
                //     ApplicationArea = all;
                //     Image = Reject;
                //     ToolTip = 'Reject the application.';
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()

                //     var
                //         Custmer: Record Customer;
                //         Application: Record Application;
                //     begin
                //         ;
                //         begin
                //             Message('Application Rejected, Try Again Later');
                //             Rec."Status" := Rec."Status"::Rejected;
                //             Rec.Modify();
                //         end

                //     end;
                // }
            }
        }
    }


}


