namespace PieterKok.WebhookTrigger.MasterData;
using System.Reflection;

table 90301 "Webhook Rel. Table PTE"
{
    Caption = 'Webhook Rel. Table';
    DataClassification = CustomerContent;
    DrillDownPageId = "Webhook Rel. Tables PTE";
    LookupPageId = "Webhook Rel. Tables PTE";

    fields
    {
        field(1; "Table ID"; Integer)
        {
            AllowInCustomizations = AsReadWrite;
            BlankZero = true;
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = "Webhook PTE";
            ToolTip = 'Specifies the id of the generic webhook table.';
        }
        field(2; "Related Table ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Related Table ID';
            NotBlank = true;
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));
            ToolTip = 'Specifies the id of the related table.';
            trigger OnValidate()
            begin
                ValidateRelatedTableId();
            end;
        }
        field(3; "Related Table Name"; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table), "Object ID" = field("Related Table ID")));
            Caption = 'Related Table Name';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the name of the related table.';
        }
    }

    keys
    {
        key(PK; "Table ID", "Related Table ID")
        {
            Clustered = true;
        }
    }

    var
        WebhookRelTableHelper: Codeunit "Webhook Rel. Table Helper PTE";

    local procedure ValidateRelatedTableId()
    begin
        WebhookRelTableHelper.ValidateRelatedTableId(Rec);
    end;
}