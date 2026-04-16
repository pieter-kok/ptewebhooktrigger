# Proof of Concept: Webhook trigger
Modifications from Business Central can be retrieved in external applications by subscribing to a webhook.
The webhook functionality what is part of the standard Business Central application delivers the modifications that have been done in the system to a supplied endpoint.
Custom webhooks can be created based on API pages with the parameter ChangeTrackingAllowed = true. 
The way this functionality works is documented in more detail on https://fredborg.org/?p=914.

Business Central is working more smoothly with as less webhook subscriptions active as possible.
Synchronizations with external applications do however need data from multiple tables to be delivered from Business Central by a webhook.
Besides that, the implementation with API pages for a single table is only sending notifications about modficiations in that specific table.
Related data in other tables are not part of the webhook communications. Multiple webhook subscriptions are necessary to achieve that.
This project adds the possibility to get subscribe to a single webhook to retrieve modifications from multiple and related tables.

## Webhook
All elements regarding the webhook can be found in the folder /src/masterdata/.

The table "Webhook PTE" contains the following fields. 
- Table ID 
  Data Type: Integer
  Table Relation: Object ID from table AllObj, where Object Type is Table 
  Primary Key
- Table Name 
  Data Type: Text[30]
  FlowField based on AllObj.Object Name
  Not editable

A non-editable list page "Webhook List PTE" and a card page "Webhook Card PTE" are part of the solution. Both pages contain both fields. The UsageCategory for the "Webhook List PTE" page must be Administration. The card page has UsageCatergory None.

## Webhook Rel. Table
All elements regarding the webhook rel. table can be found in the folder /src/masterdata/.

The table "Webhook Rel. Table PTE" contains all tables that are related to a webhook table.
This table consists of the following fields
- Table ID 
  Data Type: Integer
  Table Relation: Table ID from Webhook
  Part of primary Key
- Related Table ID 
  Data Type: Integer
  Table Relation: Object ID from table AllObj, where Object Type is Table 
  Part of primary Key
  The value of Related Table ID is not allowed to be the same as Table ID.
- Related Table Name 
  Data Type: Text[30]
  FlowField based on AllObj.Object Name
  Not editable

A non-editable list page "Webhook Rel. Tables PTE" is part of the solution that contains only the fields Related Table ID and Related Table Name. On the Webhook Card PTE page, a list part for the related tables is available. This page is called "Webhook Subform PTE. This page also contains both fields. Both pages are set to UsageCategory None.

## Webhook Trigger
All elements regarding the webhook trigger can be found in the folder /src/processing/.

The table Webhook Trigger contains the following fields
- Key
  Data Type: Guid
  Primary Key
- Trigger Table ID 
  Data Type: Integer
  Table Relation: Table ID from Webhook
- Trigger Table Name 
  Data Type: Text[30]
  FlowField based on AllObj.Object Name
  Not editable
- Trigger System ID  
  Data Type: Guid
- Trigger Record ID
  Data Type: RecordId
- Trigger Insert
  Data Type: Boolean
  Specifies whether the referenced record is inserted
- Trigger Modify
  Data Type: Boolean
  Specifies whether the referenced record is modified or a related is inserted/modified/deleted/renamed
- Trigger Delete
  Data Type: Boolean
  Specifies whether the referenced record is deleted
- Trigger Rename
  Data Type: Boolean
  Specifies whether the referenced record table is renamed
- Trigger Guid
  DataType: Guid
- Source Table ID
  Data Type: Integer
  Table Relation: Object No. from table AllObj, where Type is Table 
  The value can be the table id of the generic webhook table itself or a related table id
- Source Table Name 
  Data Type: Text[30]
  FlowField based on AllObj.Name with a filter on Source Table ID
  Not editable
- Source System ID
  Data Type: Guid
- Source Record ID
  Data Type: RecordId
- Source Insert
  Data Type: Boolean
  Specifies which action on the source table triggered creating the webhook trigger
- Source Modify
  Data Type: Boolean
  Specifies which action on the source table triggered creating the webhook trigger
- Source Delete
  Data Type: Boolean
  Specifies which action on the source table triggered creating the webhook trigger
- Source Rename
  Data Type: Boolean
  Specifies which action on the source table triggered creating the webhook trigger

A non-editable list page with the name "Webhook Triggers PTE" that has UsageCategory Tasks contains all the mentioned fields.

An API page must be created with ChangeTrackingEnabled. This is the api which will be used by external systems to subscribe webhooks on.