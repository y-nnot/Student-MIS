page 50128 "Student Billing Card"
{
    Caption = 'Student Billing Card';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s email address.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s mobile telephone number.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                    TableRelation = Stages;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field("Program"; Rec."Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Program field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';

                }
            }

            part("Fee Structure"; "Fee Structure Items")
            {
                ApplicationArea = Basic, Suit;
                // SubPageLink = "Stage ID" = field("Stage ID");

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
                        StageIDLink := Rec."stage";
                        if StageIDLink = '' then
                            Error('Please select a stage for the Student.');

                        if Stage.Get(StageIDLink) then begin
                            ConfirmBilling := Confirm(StrSubstNo('Do you want to bill the student for %1?', Format(Stage."Fee Amount")), false);
                            if ConfirmBilling then begin
                                Rec."Amount" := Stage."Fee Amount";

                                Rec.Modify();
                                Message('Student balance updated to %1.', Format(Rec."Amount"));

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
                                GLEntry."Account No." := Rec."No.";  // Assuming this is the customer account number
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


            }

        }

    }

}
