report 50103 "Send Email Report"
{
    Caption = 'Send Email Report';
    UsageCategory = Tasks;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }

            trigger OnAfterGetRecord()
            var
                Email: Codeunit Email;
                EmailMsg: Codeunit "Email Message";
                EmailBody: Label 'Dear Student, <br> <p> Congratulations for Securing a chance to Study at our University.</p> <p>Please find the attached copy of your Admission Letter </p> <hr>';
                OutStr: OutStream;
                Cust: Record Customer;
                RecRef: RecordRef;
                TempBlob: Codeunit "Temp Blob";
                InStr: InStream;
            begin
                Customer.TestField("E-Mail");
                EmailMsg.Create(Customer."E-Mail", Customer.Name + 'Statement', ', true');
                EmailMsg.AppendToBody(EmailBody);
                TempBlob.CreateOutStream(OutStr);

                Customer.Reset();
                Customer.SetRange("No.", Customer."No.");
                if Customer.FindFirst() then begin

                    RecRef.GetTable(Customer);
                    TempBlob.CreateOutStream(OutStr);
                    Report.SaveAs(Report::"Student Report", '', ReportFormat::Pdf, OutStr);
                    TempBlob.CreateInStream(InStr);
                    EmailMsg.AddAttachment(Customer."No." + '.pdf', '', InStr);

                end;

                Email.Send(EmailMsg);
            end;
        }

    }
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('Email has bee sent Successfully');
    end;
}
