namespace PieterKok.WebhookTrigger.Processing;

using Microsoft.Utilities;

codeunit 90303 "Webhook Trigger Helper PTE"
{
    internal procedure OpenRecord(CurrentRecordId: RecordId)
    var
        PageManagement: Codeunit "Page Management";
        RecRef: RecordRef;
        EmptyRecordId: RecordId;
        RecordDoesNotExistErr: Label 'Record does not exist anymore: %1', Comment = '%1=RecordId';
    begin
        if CurrentRecordId = EmptyRecordId then
            exit;

        RecRef := CurrentRecordId.GetRecord();
        if RecRef.Number() = 0 then
            Error(RecordDoesNotExistErr, Format(CurrentRecordId));

        RecRef.SetRecFilter();
        if not RecRef.FindFirst() then
            Error(RecordDoesNotExistErr, Format(CurrentRecordId));

        PageManagement.PageRun(RecRef);
    end;
}