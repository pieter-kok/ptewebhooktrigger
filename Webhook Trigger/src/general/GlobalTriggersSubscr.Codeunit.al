namespace PieterKok.WebhookTrigger.General;

using PieterKok.WebhookTrigger.Processing;
using System.Environment;

codeunit 90301 "Global Triggers Subscr. PTE"
{
    Access = Internal;
    SingleInstance = true;

    var
        WebhookGlobalTriggersPTE: Codeunit "Webhook Global Triggers PTE";

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", GetDatabaseTableTriggerSetup, '', false, false)]
    local procedure GetDatabaseTableTriggerSetup(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean; var OnDatabaseRename: Boolean)
    begin
        WebhookGlobalTriggersPTE.GetDatabaseTableTriggerSetup(TableId, OnDatabaseInsert, OnDatabaseModify, OnDatabaseDelete, OnDatabaseRename);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", OnDatabaseInsert, '', false, false)]
    local procedure DatabaseInsert(RecRef: RecordRef)
    begin
        WebhookGlobalTriggersPTE.DatabaseInsert(RecRef);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", OnDatabaseModify, '', false, false)]
    local procedure DatabaseModify(RecRef: RecordRef)
    begin
        WebhookGlobalTriggersPTE.DatabaseModify(RecRef);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", OnDatabaseDelete, '', false, false)]
    local procedure DatabaseDelete(RecRef: RecordRef)
    begin
        WebhookGlobalTriggersPTE.DatabaseDelete(RecRef);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", OnDatabaseRename, '', false, false)]
    local procedure DatabaseRename(RecRef: RecordRef; xRecRef: RecordRef)
    begin
        WebhookGlobalTriggersPTE.DatabaseRename(RecRef, xRecRef);
    end;
}