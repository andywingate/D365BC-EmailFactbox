pageextension 50501 "Posted Sales Invoice Email Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addfirst(factboxes)
        {
            part(SentEmails; "Sent Emails for Document")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        SentEmailTemp: Record "Sent Email" temporary;
        Email: Codeunit Email;
    begin
        SentEmailTemp := Email.GetSentEmailsForRecord(Database::"Sales Invoice Header", Rec.SystemId);
        CurrPage.SentEmails.Page.AddBuffer(SentEmailTemp);
    end;
}