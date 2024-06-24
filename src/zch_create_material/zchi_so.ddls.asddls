@AccessControl: { authorizationCheck: #CHECK
//                  privilegedAssociations: [ '_OutputRequest', '_CreatedByUser', '_LastChangedByUser' ]}
}
@Metadata: {
  allowExtensions: true,
  ignorePropagatedAnnotations: true
}

@ObjectModel: {
   modelingPattern:       #TRANSACTIONAL_QUERY,
   supportedCapabilities: [#TRANSACTIONAL_PROVIDER],
   usageType: {
     serviceQuality: #C,
     sizeCategory:   #L,
     dataClass:      #TRANSACTIONAL
   },
   semanticKey: ['SalesDocument']
//   query.implementedBy: 'ABAP:CL_S4RAP_STICKY_QRY'
 }

@AbapCatalog.extensibility: {
  extensible: true,
  elementSuffix: 'ZDH',
  dataSources: ['SalesDocument'],
  allowNewDatasources: true,
  quota: {
    maximumFields: 1000,
    maximumBytes: 100000
  }
}

//@VDM: {
//  viewType: #CONSUMPTION,
//  usage.type: [#TRANSACTIONAL_PROCESSING_SERVICE]
//}
@Search.searchable: true
//@EndUserText.label: 'Sales Order'
@EndUserText.label: 'so app call  app'
define root view entity zchi_so
  provider contract transactional_query
  as projection on ZTDI_VBAK as SalesDocument


  association [0..1] to I_SalesDocumentPartner    as _AG                      on  $projection.SalesDocument = _AG.SalesDocument
                                                                              and _AG.PartnerFunction       = 'AG'
  association [0..1] to I_SalesDocumentPartner    as _RE                      on  $projection.SalesDocument = _RE.SalesDocument
                                                                              and _RE.PartnerFunction       = 'RE'
  association [0..1] to I_SalesDocumentPartner    as _RG                      on  $projection.SalesDocument = _RG.SalesDocument
                                                                              and _RG.PartnerFunction       = 'RG'
  association [0..1] to I_SalesDocumentPartner    as _WE                      on  $projection.SalesDocument = _WE.SalesDocument
                                                                              and _WE.PartnerFunction       = 'WE'

//  association [0..1] to I_Customer                as _SoldToParty             on  _AG.Customer = _SoldToParty.Customer
//
//  association [0..1] to I_Customer                as _ShipToParty             on  $projection.WECustomer = _ShipToParty.Customer
//
//  association [0..1] to I_Customer                as _BillToParty             on  $projection.RECustomer = _BillToParty.Customer
//
//  association [0..1] to I_Customer                as _PayerParty              on  $projection.RGCustomer = _PayerParty.Customer

  association [0..1] to I_SalesOrganizationText   as _SalesOrganizationText   on  $projection.SalesOrganization   = _SalesOrganizationText.SalesOrganization
                                                                              and _SalesOrganizationText.Language = $session.system_language
  association [0..1] to I_DistributionChannelText as _DistributionChannelText on  $projection.DistributionChannel   = _DistributionChannelText.DistributionChannel
                                                                              and _DistributionChannelText.Language = $session.system_language
  association [0..1] to I_DivisionText            as _DivisionText            on  $projection.OrganizationDivision = _DivisionText.Division

{
          @Search: {
            defaultSearchElement: true,
            fuzzinessThreshold: 0.9,
            ranking: #HIGH }
  key SalesDocument,
  
      SalesDocumentDate,

      
      SalesOrganization,
      _SalesOrganizationText,
      DistributionChannel,
      _DistributionChannelText,
      OrganizationDivision,
      _DivisionText,
      TransactionCurrency
//      _AG.Customer                                    as agcustome,
//      _SoldToParty,
//      _RE.Customer                                     as RECustomer,
//      _PayerParty,
//      _RG.Customer                                     as RGCustomer,
//      _BillToParty,
//      _WE.Customer                                     as WECustomer,
//      _ShipToParty
}
