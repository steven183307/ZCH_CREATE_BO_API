@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Document(Item)'


@UI.headerInfo:{
    typeNamePlural: 'Sales Document(Item)',
    typeName: 'Sales DocumentItem',
    title.value: 'SalesDocumentItem',
    description: {type: #STANDARD,
                  label: 'SalesDocumentItem'
     }
    }

define view entity zch_soitem_i   as select from ZTDI_VBAP

  association [1..1] to ZTDC_VBEP  as _ZTDC_VBEP  on  $projection.SalesDocument     = _ZTDC_VBEP.SalesDocument
                                                      and $projection.SalesDocumentItem = _ZTDC_VBEP.SalesDocumentItem

  association [1..*] to ZTDC_LIKP as _ZTDC_LIKP on  $projection.SalesDocument     = _ZTDC_LIKP.ReferenceSDDocument
                                                      and $projection.SalesDocumentItem = _ZTDC_LIKP.ReferenceSDDocumentItem

{
      @UI.facet: [
      {
                   id: 'SalesItem',
                    purpose: #STANDARD,
                    position: 60,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZTDC_LIKP',
                    label: 'Delivery Document(Header)'
        },
//              {
//                   id: 'SalesItem1',
//                    purpose: #STANDARD,
//                    position: 60,
//                    type: #LINEITEM_REFERENCE,
//                    targetElement: '_ZTDC_VBEP',
//                    label: 'Schedule line date'
//        },

      {
                    label: 'Header Info',
                    id: 'HeaderInfo',
                    type: #COLLECTION,
                    position: 10
        },{
                    label: 'Header Info2',
                    id: 'HeaderInfo2',
                    type: #COLLECTION,
                    position: 20
        }
        ,
        {
        label: 'Header3',
        type: #IDENTIFICATION_REFERENCE,
        purpose: #STANDARD,
        parentId: 'HeaderInfo',
        position: 10,
        targetQualifier: 'Header'
        },
        {
        label: 'Header4',
        type: #IDENTIFICATION_REFERENCE,
        purpose: #STANDARD,
        parentId: 'HeaderInfo',
        position: 20,
        targetQualifier: 'Header1'
        }

        ]

      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      //      @UI.lineItem: [{position: 10,label: 'SalesDocument'}]
      @Search.defaultSearchElement: true
      @UI.selectionField:[{position: 40}]
      @Search.fuzzinessThreshold: 0.8
  key SalesDocument,
      @UI.identification: [{position: 20 , label: 'SalesDocumentItem' , qualifier: 'Header'}]
      @UI.lineItem: [{position: 10,label: 'SalesDocumentItem'}]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key SalesDocumentItem,
      TransactionCurrency,
      @UI.identification: [{position: 10 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 20,label: 'Material'}]
      Material,
      @UI.identification: [{position: 20 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 30,label: 'SalesDocumentItemText'}]
      SalesDocumentItemText,
      @UI.identification: [{position: 30 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 40,label: 'OrderQuantity'}]
      OrderQuantity,
      @UI.identification: [{position: 40 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 50,label: 'OrderQuantityUnit'}]
      OrderQuantityUnit,
      @UI.identification: [{position: 50 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 60,label: 'NetPriceAmount'}]
      NetPriceAmount,
      @UI.identification: [{position: 60 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 70,label: 'NetPriceQuantity'}]
      NetPriceQuantity,
      @UI.identification: [{position: 70 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 80,label: 'NetPriceQuantityUnit'}]
      NetPriceQuantityUnit,
      @UI.identification: [{position: 80 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 90,label: 'NetAmount'}]
      NetAmount,
      @UI.identification: [{position: 90 , qualifier: 'Header1' ,label: 'DeliveryDate'}]
      @UI.lineItem: [{position: 100,label: 'DeliveryDate'}]
      _ZTDC_VBEP.DeliveryDate as DeliveryDate,
      @UI.identification: [{position: 100 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 100,label: 'Plant'}]
      Plant,
      @UI.identification: [{position: 110 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 110,label: 'PlantName'}]
      PlantName,
      @UI.identification: [{position: 120 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 120,label: 'ShippingPoint'}]
      ShippingPoint,
      @UI.identification: [{position: 130 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 130,label: 'ShippingPointName'}]
      ShippingPointName,
      
//      _ZTDC_VBEP,
      _ZTDC_LIKP

}
