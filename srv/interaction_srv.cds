using app.interactions as my from '../db/interactions';

using { sap } from '@sap/cds-common-content';

service CatalogService {

@odata.draft.enabled: true
entity Interactions_Header  as projection on my.Headers;

entity Interactions_Items   as projection on my.Items;

@readonly
entity Languages as projection on sap.common.Languages;


}