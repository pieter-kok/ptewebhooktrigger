namespace PieterKok.WebhookTrigger.Processing;

page 90311 "Webhook Triggers PTE"
{
    ApplicationArea = All;
    Caption = 'Webhook Triggers';
    PageType = List;
    SourceTable = "Webhook Trigger PTE";
    Editable = false;
    UsageCategory = Tasks;
    SourceTableView = order(descending);

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Key"; Rec."Key") { }
                field("Trigger Table ID"; Rec."Trigger Table ID") { }
                field("Trigger Table Name"; Rec."Trigger Table Name") { }
                field("Trigger System ID"; Rec."Trigger System ID") { }
                field("Trigger Record Trigger Type"; Rec."Trigger Record Trigger Type") { }
                field("Trigger Guid"; Rec."Trigger Guid") { }
                field("Source Table ID"; Rec."Source Table ID") { }
                field("Source Table Name"; Rec."Source Table Name") { }
                field("Source System ID"; Rec."Source System ID") { }
                field("Source Record Trigger Type"; Rec."Source Record Trigger Type") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TriggerRecord)
            {
                ApplicationArea = All;
                Caption = 'Trigger Record';
                Image = DecreaseIndent;
                ToolTip = 'Opens the trigger record, if it still exists.';

                trigger OnAction()
                begin
                    Rec.OpenTriggerRecord();
                end;
            }
            action(SourceRecord)
            {
                ApplicationArea = All;
                Caption = 'Source Record';
                Image = Indent;
                ToolTip = 'Opens the source record, if it still exists.';

                trigger OnAction()
                begin
                    Rec.OpenSourceRecord();
                end;
            }
        }

        area(Promoted)
        {
            actionref(TriggerRecord_Promoted; TriggerRecord) { }
            actionref(SourceRecord_Promoted; SourceRecord) { }
        }
    }
}
