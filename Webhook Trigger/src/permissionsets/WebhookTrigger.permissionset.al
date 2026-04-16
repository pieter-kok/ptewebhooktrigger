namespace PieterKok.WebhookTrigger.Security;

using PieterKok.WebhookTrigger.MasterData;

permissionset 90300 "Webhook Trigger"
{
    Assignable = true;
    Caption = 'Webhook Trigger', MaxLength = 30;
    Permissions =
        tabledata "Generic Webhook" = RIMD,
        tabledata "Generic Webhook Rel. Table" = RIMD,
        table "Generic Webhook" = X,
        table "Generic Webhook Rel. Table" = X,
        page "Generic Webhook Rel. Tables" = X,
        page "Generic Webhooks" = X;
}