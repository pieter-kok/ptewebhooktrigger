namespace PieterKok.WebhookTrigger.MasterData;

page 90301 "Webhook Card PTE"
{
    ApplicationArea = All;
    Caption = 'Webhook Card';
    DataCaptionExpression = Rec."Table Name";
    DataCaptionFields = "Table Name";
    PageType = Card;
    SourceTable = "Webhook PTE";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Table ID"; Rec."Table ID")
                {
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Table Name");
                    end;
                }
                field("Table Name"; Rec."Table Name") { }
            }
            part("Webhook Subform"; "Webhook Subform PTE")
            {
                Caption = 'Related Tables';
                SubPageLink = "Table ID" = field("Table ID");
            }
        }
    }
}