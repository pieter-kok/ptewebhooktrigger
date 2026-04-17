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
- Trigger Table Trigger Type
  Data Type: Enum
  Specifies the trigger type for the trigger table. When the source table a related table, all trigger types of the source table are considered to be a modification trigger.
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
- Source Table Trigger Type
  Data Type: Enum
  Specifies the trigger type for the source table. When the source table a related table, all trigger types of the source table are considered to be a modification trigger.

A non-editable list page with the name "Webhook Triggers PTE" that has UsageCategory Tasks contains all the mentioned fields.

## Webhook Trigger API
All elements regarding the webhook trigger can be found in the folder /src/api/.

An API page "Webhook Trigger API PTE" is available ChangeTrackingEnabled=true. 
This webhook trigger page must contain all fields avaiThis is the api which will be used by external systems to subscribe webhooks on.