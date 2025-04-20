using CatalogService as service from '../../srv/interaction_srv';

annotate service.Interactions_Header with @(
    UI.HeaderInfo :{
        Title : {
            $Type : 'UI.DataField',
            Value : Partner
        },
        TypeName : 'Incident',
        TypeNamePlural : 'Incidents',
        Description : {Value: Country.descr}
    },

 UI.HeaderFacets : [
  {
    $Type : 'UI.ReferenceFacet',
    Target : '@UI.FieldGroup#Admin'
  }
 ],
 UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Label: 'Partner',
            Value: Partner,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: Country_code,
        },
        {
            $Type                  : 'UI.DataField',
            Label                  : 'Country',
            ![@Common.FieldControl]: #ReadOnly,
            Value                  : Country.descr,
        }
    ]
},
UI.FieldGroup #Admin       : {Data : [
    {
        $Type : 'UI.DataField',
        Value : createdBy
    },
    {
        $Type : 'UI.DataField',
        Value : modifiedBy
    },
    {
        $Type : 'UI.DataField',
        Value : createdAt
    },
    {
        $Type : 'UI.DataField',
        Value : modifiedAt
    }
    ]
},
UI.Facets                    : [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Interaction Items',
        Target: 'items/@UI.LineItem'
    }
],
UI.LineItem                  : [
    {
        $Type: 'UI.DataField',
        Label: 'Partner',
        Value: Partner,
    },
    {
        $Type                  : 'UI.DataField',
        Label                  : 'Country',
        ![@Common.FieldControl]: #ReadOnly,
        Value                  : Country.name,
    },
]
 
) ;
annotate service.Interactions_Items with @(
UI.HeaderInfo                : {
    Title         : {
        $Type: 'UI.DataField',
        Value: text,
    },
    TypeName      : 'Interaction Item',
    TypeNamePlural: 'Interaction Items'
},
UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Label: 'Text',
            Value: text,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Date',
            Value: date,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Currency',
            Value: currency_code,
        }
    ]
},
UI.Facets                    : [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Item Translations',
        Target: 'texts/@UI.LineItem'
    }
],
UI.LineItem                  : [
    {
        $Type: 'UI.DataField',
        Label: 'Text',
        Value: text,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Date',
        Value: date,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Price',
        Value: price,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Currency',
        Value: currency_code,
    }
]
);

annotate service.Interactions_Items.texts with @(UI: {
Identification : [{Value: text}],
SelectionFields: [
    locale,
    text
],
LineItem       : [
    {
        Value: locale,
        Label: 'Locale'
    },
    {Value: text}
]
});

annotate service.Interactions_Items.texts with {
ID @UI.Hidden;
};

// Add Value Help for Locales
annotate service.Interactions_Items.texts {
locale @(
    ValueList.entity: 'Languages',
    Common.ValueListWithFixedValues,
)
}