namespace PieterKok.WebhookTrigger.Security;

using PieterKok.WebhookTrigger.MasterData;

permissionset 90300 "Webhook Trigger PTE"
{
    Assignable = true;
    Caption = 'Webhook Trigger', MaxLength = 30;
    Permissions =
        tabledata "Gen. Webhook PTE" = RIMD,
        tabledata "Gen. Webhook Rel. Table PTE" = RIMD,
        table "Gen. Webhook PTE" = X,
        table "Gen. Webhook Rel. Table PTE" = X,
        page "Gen. Webhook Rel. Tables PTE" = X,
        page "Gen. Webhooks PTE" = X;
}