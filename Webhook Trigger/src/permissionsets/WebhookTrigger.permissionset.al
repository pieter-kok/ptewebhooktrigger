namespace PieterKok.WebhookTrigger.Security;

using PieterKok.WebhookTrigger.General;
using PieterKok.WebhookTrigger.MasterData;
using PieterKok.WebhookTrigger.Processing;

permissionset 90300 "Webhook Trigger PTE"
{
    Assignable = true;
    Caption = 'Webhook Trigger', MaxLength = 30;
    Permissions =
        table "Webhook PTE" = X,
        tabledata "Webhook PTE" = RIMD,
        table "Webhook Rel. Table PTE" = X,
        tabledata "Webhook Rel. Table PTE" = RIMD,
        table "Webhook Trigger PTE" = X,
        tabledata "Webhook Trigger PTE" = RIMD,
        codeunit "Global Triggers Subscr. PTE" = X,
        codeunit "Webhook Global Triggers PTE" = X,
        codeunit "Webhook Rel. Table Helper PTE" = X,
        codeunit "Webhook Trigger Helper PTE" = X,
        page "Webhook Card PTE" = X,
        page "Webhook List PTE" = X,
        page "Webhook Rel. Tables PTE" = X,
        page "Webhook Subform PTE" = X,
        page "Webhook Triggers PTE" = X;
}