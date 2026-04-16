namespace PieterKok.WebhookTrigger.MasterData;

codeunit 90300 "Webhook Rel. Table Helper PTE"
{
    Access = Internal;

    internal procedure ValidateRelatedTableId(WebhookRelTable: Record "Webhook Rel. Table PTE")
    var
        InvalidRelatedTableErr: Label '%1 cannot be the same as %2 (%3).', Comment = '%1=FieldCaption Related Table ID, %2=FieldCaption Table ID, %3=Table ID';
    begin
        if WebhookRelTable."Related Table ID" = WebhookRelTable."Table ID" then
            Error(InvalidRelatedTableErr, WebhookRelTable.FieldCaption("Related Table ID"), WebhookRelTable.FieldCaption("Table ID"), WebhookRelTable."Table ID");
    end;
}