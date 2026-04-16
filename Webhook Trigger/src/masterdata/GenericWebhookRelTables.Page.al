namespace PieterKok.WebhookTrigger.MasterData;

page 90301 "Generic Webhook Rel. Tables"
{
    ApplicationArea = All;
    Caption = 'Generic Webhook Related Tables';
    Editable = false;
    PageType = List;
    SourceTable = "Generic Webhook Rel. Table";
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