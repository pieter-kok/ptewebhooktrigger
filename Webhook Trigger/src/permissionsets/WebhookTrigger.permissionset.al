namespace PieterKok.WebhookTrigger.Security;

using PieterKok.WebhookTrigger.MasterData;

permissionset 90300 "Webhook Trigger PTE"
{
    Assignable = true;
    Caption = 'Webhook Trigger', MaxLength = 30;
    Permissions =
        table "Webhook PTE" = X,
        tabledata "Webhook PTE" = RIMD,
        table "Webhook Rel. Table PTE" = X,
        tabledata "Webhook Rel. Table PTE" = RIMD,
        codeunit "Webhook Rel. Table Helper PTE" = X,
        page "Webhook Card PTE" = X,
        page "Webhook List PTE" = X,
        page "Webhook Rel. Tables PTE" = X,
        page "Webhook Subform PTE" = X;
}