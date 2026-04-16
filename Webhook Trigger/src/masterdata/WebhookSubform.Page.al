namespace PieterKok.WebhookTrigger.MasterData;

page 90302 "Webhook Subform PTE"
{
    ApplicationArea = All;
    Caption = 'Webhook Subform';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Webhook Rel. Table PTE";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Related Table ID"; Rec."Related Table ID")
                {
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Related Table Name");
                    end;
                }
                field("Related Table Name"; Rec."Related Table Name") { }
            }
        }
    }
}