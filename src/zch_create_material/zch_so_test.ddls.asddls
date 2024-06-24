//@AbapCatalog.sqlViewName: 'CSALESORDERFS'
//@ClientHandling.algorithm:#SESSION_VARIABLE
//@VDM.viewType: #CONSUMPTION
//@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
//@AccessControl.personalData.blocking: #BLOCKED_DATA_EXCLUDED
//@AccessControl.privilegedAssociations: [ '_SDDocumentPartnerCard' ]
@EndUserText.label: 'Sales Order'
@Search.searchable: true

//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Sales Document(Item)'
@ObjectModel: { semanticKey: ['SalesDocument'],
                representativeKey: 'SalesDocument',
                usageType.dataClass: #TRANSACTIONAL,
                usageType.serviceQuality:  #C,
                usageType.sizeCategory: #L }

//@VDM.usage.type:[#ACTION_RESULT_STRUCTURE]
@AbapCatalog.extensibility: {
  extensible: true,
  dataSources: ['_SalesDocument'],
  allowNewDatasources: false,
//  elementSuffix: '',
  quota: { maximumFields: 404,
           maximumBytes: 40400 },
  allowNewCompositions: true }

@UI.headerInfo:{
    typeNamePlural: 'Sales Document(Item)',
    typeName: 'Sales DocumentItem',

    typeImageUrl: '/sap/bc/ui5_ui5/sap/sd_sov2_mans1/images/ManageSalesOrder.jpg',
//    title.value: 'SalesDocumentItem',
    description: {type: #STANDARD,
                  label: 'SalesDocumentItem'
     }
    }

define view entity zch_so_test
  as select from ZTDI_VBAK as _SalesDocument

{
      @UI.facet: [
        {
                    label: 'Header Info',
                    id: 'HeaderInfo',
                    type: #COLLECTION,
                    position: 10
        }
        ,
        {
                    label: 'Customer Info2',
                    id: 'HeaderInfo2',
                    type: #COLLECTION,
                    position: 10
        }
        ,
        {
        label: 'Header1',
        type: #IDENTIFICATION_REFERENCE,
        parentId: 'HeaderInfo',
        targetQualifier: 'Header'
        }

        ,
        {
        label: 'Customer',
        type: #IDENTIFICATION_REFERENCE,
        purpose: #STANDARD,
        parentId: 'HeaderInfo2',
        targetQualifier: 'Header2'
        }
                ,
        {
        label: 'Header2',
        type: #IDENTIFICATION_REFERENCE,
        purpose: #STANDARD,
        parentId: 'HeaderInfo',

        targetQualifier: 'Header1'
        }
      ]

//      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      @Search.fuzzinessThreshold: 0.5
      @UI.lineItem: [{position: 10, label: 'SalesDocument'}]
      @UI.selectionField:[{position: 20}]
      @EndUserText.label: 'SO No.'
      @EndUserText.quickInfo: '銷售單號'
      @ObjectModel.text.element: ['SalesOrganizationName']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZTDI_VBAP_VH', element: 'SalesDocument' }}]
      @Consumption.semanticObject: 'SalesDocument'
      @UI.identification : [{position: 30  , qualifier: 'Header'},{iconUrl: '/sap/bc/ui5_ui5/sap/mm_po_manages1' , semanticObjectBinding: [{ localElement: 'SalesOrganization', element: 'SalesOrganization' }]}] 
  key SalesDocument,


      @UI.selectionField:[{position: 40}]
//      @UI.identification: []
      @UI.lineItem: [{position: 20,label: 'SalesDocumentDate' }]
           SalesDocumentDate,

      @UI.identification: [{position: 10 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 30,label: 'SalesOrganization' }]
      @ObjectModel.text.element: ['SalesOrganizationName']
      @AnalyticsDetails.query.display: #KEY_TEXT
      @Consumption: {
     semanticObject: 'SalesOrganization'  ,
     semanticObjectMapping: {
     element: 'SalesOrganization'
     }
     }
      SalesOrganization,
      @UI.identification: [{position: 20 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 40,label: 'OrganizationName'}]
      SalesOrganizationName
//      ,
//      @UI.identification: [{position: 30 , qualifier: 'Header1'}]
//      @UI.lineItem: [{position: 50,label: 'DistributionChannel'}]
//      DistributionChannel,
//      @UI.identification: [{position: 40 , qualifier: 'Header1'}]
//      @UI.lineItem: [{position: 60,label: 'ChannelName'}]
//      DistributionChannelName,
//      @UI.identification: [{position: 50 , qualifier: 'Header1'}]
//      @UI.lineItem: [{position: 70,label: 'OrganizationDivision'}]
//      OrganizationDivision,
//      @UI.identification: [{position: 60 , qualifier: 'Header1'}]
//      @UI.lineItem: [{position: 80,label: 'DivisionName'}]
//      DivisionName,
//      @UI.identification: [{position: 40  , qualifier: 'Header'}]
//      @UI.lineItem: [{position: 90,label: 'TransactionCurrency'}]
//      TransactionCurrency,
//      @UI.selectionField:[{position: 30}]
//      @UI.identification: [{position: 10 , qualifier: 'Header2',label: 'SoldToPartyCustomer'}]
//      @UI.lineItem: [{position: 100,label: 'SoldToParty'}]
//      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZTDI_KNA1_VH', element: 'Customer' }}]
//      @Consumption: {
//    semanticObject: 'Customer',
//    semanticObjectMapping: {
//    element: 'Customer'
//    }
    //    ,
    //    valueHelpDefinition: [{ entity: { name: 'D_SlsDocSoldToPartyCVH',
    //                                      element: 'Customer' }
    //                           } ]
//    }
//      AGCustomer,
//      @UI.identification: [{position: 20 , qualifier: 'Header2',label: 'SoldToPartyName'}]
//      @UI.lineItem: [{position: 110,label: 'SoldToPartyName'}]
//      _SoldToParty.CustomerName as SoldToPartyname,
//      @UI.identification: [{position: 30 , qualifier: 'Header2',label: 'PayerPartyCustomer'}]
//      @UI.lineItem: [{position: 120,label: 'PayerParty'}]
//      RECustomer,
//      @UI.identification: [{position: 40 , qualifier: 'Header2',label: 'PayerPartyName'}]
//      @UI.lineItem: [{position: 130,label: 'PayerPartyName'}]
//      _PayerParty.CustomerName  as PayerPartyname,
//      @UI.identification: [{position: 50 , qualifier: 'Header2',label: 'BillToPartyCustomer'}]
//      @UI.lineItem: [{position: 140,label: 'BillToParty'}]
//      RGCustomer,
//      @UI.identification: [{position: 60 , qualifier: 'Header2',label: 'BillToPartyname'}]
//      @UI.lineItem: [{position: 150,label: 'BillToPartyname'}]
//      _BillToParty.CustomerName as BillToPartyname,
//      @UI.identification: [{position: 70 , qualifier: 'Header2',label: 'ShipToPartyCustomer'}]
//      @UI.lineItem: [{position: 160,label: 'ShipToParty'}]
//      WECustomer,
//      @UI.identification: [{position: 80 , qualifier: 'Header2',label: 'ShipToPartyName'}]
//      @UI.lineItem: [{position: 170,label: 'ShipToPartyName'}]
//      _ShipToParty.CustomerName as ShipToPartyname
}
