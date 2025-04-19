namespace app.interactions;

using {Country, Currency, cuid, managed} from '@sap/cds/common';

type BusinessKey : String(10);
type Price : Decimal(10, 2);
type Text : String(1024);

entity Headers: cuid, managed {
    Partner : BusinessKey;
    Country : Country;
    items : Composition of many Items on items.interaction = $self;
};

entity Items : cuid {
    text : localized Text;
    date : DateTime;
    @semantics.amount.currencycode : 'currency'
    price : Price;
    currency : Currency;
    interaction : Association to Headers;

};