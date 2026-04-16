namespace PieterKok.WebhookTrigger.MasterData;

page 90301 "Gen. Webhook Rel. Tables PTE"
{
    ApplicationArea = All;
    Caption = 'Generic Webhook Related Tables';
    Editable = false;
    PageType = List;
    SourceTable = "Gen. Webhook Rel. Table PTE";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Related Table ID"; Rec."Related Table ID") { }
                field("Related Table Name"; Rec."Related Table Name") { }
            }
        }
    }
}