@EndUserText.label: 'Language projection view - Processor'
@AccessControl.authorizationCheck: #CHECK

@UI: {
 headerInfo: { typeName: 'Language', typeNamePlural: 'Languages', title: { type: #STANDARD, value: 'ID' } } }

@Search.searchable: true

define root view entity ZC_LAN_M_007
  as projection on ZI_LAN_M_007
{
      @UI.facet: [ { id:              'Language',
                       purpose:         #STANDARD,
                       type:            #DATAPOINT_REFERENCE,
                       label:           'Language',
                       position:        10,
                       targetQualifier: 'Rating' } ]

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10 } ] }
      @Search.defaultSearchElement: true
  key language_id          as Id,

      @UI: {
          lineItem:       [ { position: 40, importance: #MEDIUM } ],
          identification: [ { position: 40 } ] }
      language_name        as Name,

      @UI: {
                lineItem:       [ { position: 50, importance: #MEDIUM } ],
                identification: [ { position: 50 , label: 'Description' } ] }
      language_description as Description,

      @UI: {
         lineItem:       [ { position: 70, importance: #MEDIUM, type: #AS_DATAPOINT } ],
         dataPoint: { title: 'Rating', visualization: #RATING, targetValue: 5 },
         identification: [ { position: 70, label: 'Rating [0-5]' } ] }
      language_rating      as Rating
}
