namespace PieterKok.WebhookTrigger.MasterData;

page 90300 "Webhook List PTE"
{
    ApplicationArea = All;
    Caption = 'Webhooks';
    CardPageId = "Webhook Card PTE";
    AdditionalSearchTerms = 'Webhook List';
    PageType = List;
    Editable = false;
    SourceTable = "Webhook PTE";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Table ID"; Rec."Table ID") { }
                field("Table Name"; Rec."Table Name") { }
            }
        }
    }
}