@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo:{

    typeNamePlural: 'Sales Document(Header)',
    typeName: 'Sales Document22222',
    title.value: 'SalesDocument',
    description: {
    type:#STANDARD
    ,
    value: 'SalesDocument'

    }
    }

@Search.searchable: true

define root view entity zch_so_test01
  as projection on zch_so_test01_i

  association [1..*] to zch_soitem as _zch_soitem on $projection.SalesDocument = _zch_soitem.SalesDocument

{
      @UI.facet: [
        {
                    id: 'SalesItem',
                    position: 60,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZCH_SOITEM'
                    ,
                    label: 'Sales Document(Item)111'
        },
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

      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      @Search.fuzzinessThreshold: 0.5
      @UI.lineItem: [{position: 10, label: 'SalesDocument'}]
      @UI.selectionField:[{position: 20}]
      @EndUserText.label: 'SO No.'
      @EndUserText.quickInfo: '銷售單號'
      @ObjectModel.text.element: ['SalesOrganizationName']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZTDI_VBAP_VH', element: 'SalesDocument' }}]
  key SalesDocument,


      @UI.selectionField:[{position: 40}]
      @UI.identification: [{position: 30  , qualifier: 'Header'}]
      @UI.lineItem: [{position: 20,label: 'SalesDocumentDate'}]
      SalesDocumentDate,
      @UI.identification: [{position: 10 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 30,label: 'SalesOrganization'}]
      @ObjectModel.text.element: ['SalesOrganizationName']
      SalesOrganization,
      @UI.identification: [{position: 20 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 40,label: 'OrganizationName'}]
      SalesOrganizationName,
      @UI.identification: [{position: 30 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 50,label: 'DistributionChannel'}]
      DistributionChannel,
      @UI.identification: [{position: 40 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 60,label: 'ChannelName'}]
      DistributionChannelName,
      @UI.identification: [{position: 50 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 70,label: 'OrganizationDivision'}]
      OrganizationDivision,
      @UI.identification: [{position: 60 , qualifier: 'Header1'}]
      @UI.lineItem: [{position: 80,label: 'DivisionName'}]
      DivisionName,
      @UI.identification: [{position: 40  , qualifier: 'Header'}]
      @UI.lineItem: [{position: 90,label: 'TransactionCurrency'}]
      TransactionCurrency,
      @UI.selectionField:[{position: 30}]
      @UI.identification: [{position: 10 , qualifier: 'Header2',label: 'SoldToPartyCustomer'}]
      @UI.lineItem: [{position: 100,label: 'SoldToParty'}]
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZTDI_KNA1_VH', element: 'Customer' }}]
      AGCustomer,
      @UI.identification: [{position: 20 , qualifier: 'Header2',label: 'SoldToPartyName'}]
      @UI.lineItem: [{position: 110,label: 'SoldToPartyName'}]
      _SoldToParty.CustomerName as SoldToPartyname,
      @UI.identification: [{position: 30 , qualifier: 'Header2',label: 'PayerPartyCustomer'}]
      @UI.lineItem: [{position: 120,label: 'PayerParty'}]
      RECustomer,
      @UI.identification: [{position: 40 , qualifier: 'Header2',label: 'PayerPartyName'}]
      @UI.lineItem: [{position: 130,label: 'PayerPartyName'}]
      _PayerParty.CustomerName  as PayerPartyname,
      @UI.identification: [{position: 50 , qualifier: 'Header2',label: 'BillToPartyCustomer'}]
      @UI.lineItem: [{position: 140,label: 'BillToParty'}]
      RGCustomer,
      @UI.identification: [{position: 60 , qualifier: 'Header2',label: 'BillToPartyname'}]
      @UI.lineItem: [{position: 150,label: 'BillToPartyname'}]
      _BillToParty.CustomerName as BillToPartyname,
      @UI.identification: [{position: 70 , qualifier: 'Header2',label: 'ShipToPartyCustomer'}]
      @UI.lineItem: [{position: 160,label: 'ShipToParty'}]
      WECustomer,
      @UI.identification: [{position: 80 , qualifier: 'Header2',label: 'ShipToPartyName'}]
      @UI.lineItem: [{position: 170,label: 'ShipToPartyName'}]
      _ShipToParty.CustomerName as ShipToPartyname,

      _zch_soitem

}
