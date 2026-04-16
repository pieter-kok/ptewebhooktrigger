namespace PieterKok.WebhookTrigger.MasterData;
using System.Reflection;

table 90300 "Generic Webhook"
{
    Caption = 'Generic Webhook';
    DataClassification = CustomerContent;
    DrillDownPageId = "Generic Webhooks";
    LookupPageId = "Generic Webhooks";

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));
            ToolTip = 'Specifies the id of the table that is used to trigger the generic webhook.';
        }
        field(10; "Table Name"; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table), "Object ID" = field("Table ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the name of the table that is used to trigger the generic webhook.';
        }
    }

    keys
    {
        key(PK; "Table ID")
        {
            Clustered = true;
        }
    }
}