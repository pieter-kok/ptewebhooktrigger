namespace PieterKok.WebhookTrigger.MasterData;

page 90300 "Gen. Webhooks PTE"
{
    ApplicationArea = All;
    Caption = 'Generic Webhooks';
    PageType = List;
    SourceTable = "Gen. Webhook PTE";
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
    actions
    {
        area(Processing)
        {
            action("Related Tables")
            {
                Caption = 'Related Tables';
                Image = Relationship;
                RunObject = page "Gen. Webhook Rel. Tables PTE";
                RunPageLink = "Table ID" = field("Table ID");
                ToolTip = 'View and manage related tables for the selected generic webhook.';
            }
        }
        area(Promoted)
        {
            actionref("Related Tables_Promoted"; "Related Tables") { }
        }
    }
}