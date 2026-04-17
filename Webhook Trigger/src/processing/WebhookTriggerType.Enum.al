namespace PieterKok.WebhookTrigger.Processing;

enum 90300 "Webhook Trigger Type PTE"
{
    value(0; Insert)
    {
        Caption = 'Insert';
    }
    value(1; "Modify")
    {
        Caption = 'Modify';
    }
    value(2; Delete)
    {
        Caption = 'Delete';
    }
    value(3; Rename)
    {
        Caption = 'Rename';
    }
}