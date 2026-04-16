namespace PieterKok.WebhookTrigger.MasterData;
using System.Reflection;

table 90300 "Webhook PTE"
{
    Caption = 'Webhook';
    DataClassification = CustomerContent;
    DrillDownPageId = "Webhook List PTE";
    LookupPageId = "Webhook List PTE";

    fields
    {
        field(1; "Table ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Table ID';
            NotBlank = true;
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