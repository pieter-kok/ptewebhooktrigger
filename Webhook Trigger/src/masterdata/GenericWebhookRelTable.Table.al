namespace PieterKok.WebhookTrigger.MasterData;
using System.Reflection;

table 90301 "Generic Webhook Rel. Table"
{
    Caption = 'Generic Rel. Table';
    DataClassification = CustomerContent;
    LookupPageId = "Generic Webhook Rel. Tables";
    DrillDownPageId = "Generic Webhook Rel. Tables";

    fields
    {
        field(1; "Table ID"; Integer)
        {
            AllowInCustomizations = AsReadWrite;
            Caption = 'Table ID';
            TableRelation = "Generic Webhook";
            ToolTip = 'Specifies the id of the generic webhook table.';
        }
        field(2; "Related Table ID"; Integer)
        {
            Caption = 'Related Table ID';
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

    local procedure ValidateRelatedTableId()
    var
        InvalidRelatedTableErr: Label '%1 cannot be the same as %2 (%3).', Comment = '%1=FieldCaption Related Table ID, %2=FieldCaption Table ID, %3=Table ID';
    begin
        if "Related Table ID" = "Table ID" then
            Error(InvalidRelatedTableErr, "Related Table ID", "Table ID", "Table ID");
    end;
}