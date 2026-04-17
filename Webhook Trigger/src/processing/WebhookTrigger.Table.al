namespace PieterKok.WebhookTrigger.Processing;

using System.Reflection;

table 90310 "Webhook Trigger PTE"
{
    Caption = 'Webhook Trigger';
    DataClassification = CustomerContent;
    DrillDownPageId = "Webhook Triggers PTE";
    LookupPageId = "Webhook Triggers PTE";

    fields
    {
        field(1; "Key"; Guid)
        {
            Caption = 'Key';
            NotBlank = true;
            ToolTip = 'Specifies the unique identifier for the webhook trigger record.';
        }
        field(2; "Trigger Table ID"; Integer)
        {
            Caption = 'Trigger Table ID';
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));
            ToolTip = 'Specifies the id of the webhook trigger table.';
        }
        field(3; "Trigger Table Name"; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table), "Object ID" = field("Trigger Table ID")));
            Caption = 'Trigger Table Name';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the name of the webhook trigger table.';
        }
        field(4; "Trigger System ID"; Guid)
        {
            Caption = 'Trigger System ID';
            ToolTip = 'Specifies the system id of the trigger table record.';
        }
        field(5; "Trigger Record ID"; RecordId)
        {
            Caption = 'Trigger Record ID';
            ToolTip = 'Specifies the record id of the trigger table record.';
        }
        field(6; "Trigger Record Trigger Type"; Enum "Webhook Trigger Type PTE")
        {
            Caption = 'Trigger Record Trigger Type';
            ToolTip = 'Specifies the trigger type of the trigger record. Modifications on referenced source records are considered to be modifications of the trigger record.';
        }
        field(7; "Trigger Guid"; Guid)
        {
            Caption = 'Trigger Guid';
            ToolTip = 'Specifies a chronological guid that enables changing the webhook trigger record when the exact values were already present.';
        }
        field(8; "Source Table ID"; Integer)
        {
            Caption = 'Source Table ID';
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));
            ToolTip = 'Specifies the id of the table that was the source for creating or modifying the webhook trigger record.';
        }
        field(9; "Source Table Name"; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table), "Object ID" = field("Source Table ID")));
            Caption = 'Source Table Name';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the name of the table that was the source for creating or modifying the webhook trigger record.';
        }
        field(10; "Source System ID"; Guid)
        {
            Caption = 'Source System ID';
            ToolTip = 'Specifies the system id of the table that was the source for creating or modifying the webhook trigger record.';
        }
        field(11; "Source Record ID"; RecordId)
        {
            Caption = 'Source Record ID';
            ToolTip = 'Specifies the record id of the table that was the source for creating or modifying the webhook trigger record.';
        }
        field(12; "Source Record Trigger Type"; Enum "Webhook Trigger Type PTE")
        {
            Caption = 'Source Record Trigger Type';
            ToolTip = 'Specifies the trigger type of the source record.';
        }
    }

    keys
    {
        key(PK; "Key")
        {
            Clustered = true;
        }
    }

    var
        WebhookTriggerHelper: Codeunit "Webhook Trigger Helper PTE";

    internal procedure OpenTriggerRecord()
    begin
        TestField("Trigger Record ID");
        WebhookTriggerHelper.OpenRecord("Trigger Record ID");

    end;

    internal procedure OpenSourceRecord()
    begin
        TestField("Source Record ID");
        WebhookTriggerHelper.OpenRecord("Source Record ID");
    end;
}
