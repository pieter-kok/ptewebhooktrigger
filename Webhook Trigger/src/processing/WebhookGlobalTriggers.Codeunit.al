namespace PieterKok.WebhookTrigger.Processing;

using PieterKok.WebhookTrigger.MasterData;

codeunit 90302 "Webhook Global Triggers PTE"
{
    Access = Internal;
    Permissions =
        tabledata "Webhook PTE" = r,
        tabledata "Webhook Rel. Table PTE" = r,
        tabledata "Webhook Trigger PTE" = rmi;

    internal procedure GetDatabaseTableTriggerSetup(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean; var OnDatabaseRename: Boolean)
    var
        Webhook: Record "Webhook PTE";
        WebhookRelTable: Record "Webhook Rel. Table PTE";
        TableIsSetup: Boolean;
    begin
        Webhook.SetLoadFields("Table ID");
        if Webhook.Get(TableId) then
            TableIsSetup := true;

        WebhookRelTable.SetRange("Related Table ID", TableId);
        if not WebhookRelTable.IsEmpty() then
            TableIsSetup := true;

        if TableIsSetup then begin
            OnDatabaseInsert := true;
            OnDatabaseModify := true;
            OnDatabaseDelete := true;
            OnDatabaseRename := true;
        end;
    end;

    internal procedure DatabaseInsert(RecRef: RecordRef)
    begin
        UpdateWebhookTriggers(RecRef, Enum::"Webhook Trigger Type PTE"::Insert);
    end;

    internal procedure DatabaseModify(RecRef: RecordRef)
    begin
        UpdateWebhookTriggers(RecRef, Enum::"Webhook Trigger Type PTE"::Modify);
    end;

    internal procedure DatabaseDelete(RecRef: RecordRef)
    begin
        UpdateWebhookTriggers(RecRef, Enum::"Webhook Trigger Type PTE"::Delete);
    end;

    internal procedure DatabaseRename(RecRef: RecordRef; xRecRef: RecordRef)
    begin
        UpdateWebhookTriggers(RecRef, xRecRef, Enum::"Webhook Trigger Type PTE"::Rename);
    end;


    local procedure UpdateWebhookTriggers(RecRef: RecordRef; WebhookTriggerType: Enum "Webhook Trigger Type PTE")
    var
        Webhook: Record "Webhook PTE";
    //WebhookRelTable: Record "Webhook Rel. Table PTE";
    begin
        Webhook.SetLoadFields("Table ID");
        if Webhook.Get(RecRef.Number()) then
            UpdateWebhookTrigger(RecRef.Number(), RecRef.RecordId(), GetRecRefSystemId(RecRef), WebhookTriggerType);

        // TODO: Implement table relations on Webhook Rel. Table PTE to make the following work.
        // WebhookRelTable.SetRange("Related Table ID", RecRef.Number());
        // if not WebhookRelTable.FindSet() then
        // repeat
        // GetWebhookRecRef(RecRef);
        // UpdateWebhookTrigger(WebhookRecRef.Number(), WebhookRecRef.RecordId(), GetRecRefSystemId(WebhookRecRef), WebhookTrigger.TriggerType::Modify, RecRef.Number(), RecRef.RecordId(), GetRecRefSystemId(RecRef), WebhookTriggerType);
        // until WebhookRelTable.Next() = 0;
    end;

    local procedure UpdateWebhookTriggers(RecRef: RecordRef; xRecRef: RecordRef; WebhookTriggerType: Enum "Webhook Trigger Type PTE")
    var
        Webhook: Record "Webhook PTE";
    //WebhookRelTable: Record "Webhook Rel. Table PTE";
    begin
        Webhook.SetLoadFields("Table ID");
        if Webhook.Get(RecRef.Number()) then
            UpdateWebhookTrigger(RecRef.Number(), RecRef.RecordId(), GetRecRefSystemId(RecRef), WebhookTriggerType);

        //TODO: Implement table relations on Webhook Rel. Table PTE to make the following work.

        //WebhookRelTable.SetRange("Related Table ID", RecRef.Number());
        //if not WebhookRelTable.FindSet() then
        //repeat
        //GetWebhookRecRef(RecRef);
        //UpdateWebhookTrigger(WebhookRecRef.Number(), WebhookRecRef.RecordId(), GetRecRefSystemId(WebhookRecRef), Enum::"Webhook Trigger Type PTE"::Modify, RecRef.Number(), RecRef.RecordId(), GetRecRefSystemId(RecRef), Enum::"Webhook Trigger Type PTE"::Delete);
        //UpdateWebhookTrigger(WebhookRecRef.Number(), WebhookRecRef.RecordId(), GetRecRefSystemId(WebhookRecRef), Enum::"Webhook Trigger Type PTE"::Modify, RecRef.Number(), RecRef.RecordId(), GetRecRefSystemId(RecRef), Enum::"Webhook Trigger Type PTE"::Insert);
        //until WebhookRelTable.Next() = 0;
    end;

    local procedure UpdateWebhookTrigger(TriggerTableId: Integer; TriggerRecordId: RecordId; TriggerSystemId: Guid; TriggerWebhookTriggerType: Enum "Webhook Trigger Type PTE")
    begin
        UpdateWebhookTrigger(TriggerTableId, TriggerRecordId, TriggerSystemId, TriggerWebhookTriggerType, TriggerTableId, TriggerRecordId, TriggerSystemId, TriggerWebhookTriggerType);
    end;

    local procedure UpdateWebhookTrigger(TriggerTableId: Integer; TriggerRecordId: RecordId; TriggerSystemId: Guid; TriggerWebhookTriggerType: Enum "Webhook Trigger Type PTE"; SourceTableId: Integer; SourceRecordId: RecordId; SourceSystemId: Guid; SourceWebhookTriggerType: Enum "Webhook Trigger Type PTE")
    var
        WebhookTrigger: Record "Webhook Trigger PTE";
    begin
        WebhookTrigger.SetRange("Trigger Table ID", TriggerTableId);
        WebhookTrigger.SetRange("Trigger System ID", TriggerSystemId);
        WebhookTrigger.SetRange("Trigger Record Trigger Type", TriggerWebhookTriggerType);
        WebhookTrigger.SetRange("Source Table ID", SourceTableId);
        WebhookTrigger.SetRange("Source System ID", SourceSystemId);
        WebhookTrigger.SetRange("Source Record Trigger Type", SourceWebhookTriggerType);
        if WebhookTrigger.FindFirst() then begin
            WebhookTrigger."Trigger Guid" := Guid.CreateSequentialGuid();
            WebhookTrigger.Modify(true);
        end else begin
            WebhookTrigger.Init();
            WebhookTrigger."Key" := Guid.CreateSequentialGuid();
            WebhookTrigger."Trigger Table ID" := TriggerTableId;
            WebhookTrigger."Trigger Record ID" := TriggerRecordId;
            WebhookTrigger."Trigger System ID" := TriggerSystemId;
            WebhookTrigger."Trigger Record Trigger Type" := TriggerWebhookTriggerType;
            WebhookTrigger."Trigger Guid" := Guid.CreateSequentialGuid();
            WebhookTrigger."Source Table ID" := SourceTableId;
            WebhookTrigger."Source Record ID" := SourceRecordId;
            WebhookTrigger."Source System ID" := SourceSystemId;
            WebhookTrigger."Source Record Trigger Type" := SourceWebhookTriggerType;
            WebhookTrigger.Insert(true);
        end;
    end;

    local procedure GetRecRefSystemId(RecRef: RecordRef): Guid
    var
        SystemIdFieldRef: FieldRef;
    begin
        SystemIdFieldRef := RecRef.Field(RecRef.SystemIdNo());
        exit(SystemIdFieldRef.Value())
    end;
}