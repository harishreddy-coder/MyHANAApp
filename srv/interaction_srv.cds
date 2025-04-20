using app.interactions as my from '../db/interactions';

using { sap } from '@sap/cds-common-content';

service CatalogService {

@requires : 'authenticated-user'
@cds.redirection.target
@odata.draft.enabled: true
entity Interactions_Header  as projection on my.Headers;

@requires : 'Admin'
entity Interactions_Items   as projection on my.Items;

@readonly
entity Languages as projection on sap.common.Languages;

@readonly
@restrict : [{
    grant : 'READ',
    where : 'country_code = ''USA'''
}]
entity HearView as projection on my.Headers;


}