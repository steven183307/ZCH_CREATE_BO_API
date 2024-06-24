@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Document(Header)'

define root view entity zch_so_test01_i  as select from I_SalesDocument 

  association [0..1] to I_SalesDocumentPartner    as _AG                      on  $projection.SalesDocument = _AG.SalesDocument
                                                                              and _AG.PartnerFunction       = 'AG'
  association [0..1] to I_SalesDocumentPartner    as _RE                      on  $projection.SalesDocument = _RE.SalesDocument
                                                                              and _RE.PartnerFunction       = 'RE'
  association [0..1] to I_SalesDocumentPartner    as _RG                      on  $projection.SalesDocument = _RG.SalesDocument
                                                                              and _RG.PartnerFunction       = 'RG'
  association [0..1] to I_SalesDocumentPartner    as _WE                      on  $projection.SalesDocument = _WE.SalesDocument
                                                                              and _WE.PartnerFunction       = 'WE'

  association [0..1] to I_Customer                as _SoldToParty             on  $projection.AGCustomer = _SoldToParty.Customer

  association [0..1] to I_Customer                as _ShipToParty             on  $projection.WECustomer = _ShipToParty.Customer

  association [0..1] to I_Customer                as _BillToParty             on  $projection.RECustomer = _BillToParty.Customer

  association [0..1] to I_Customer                as _PayerParty              on  $projection.RGCustomer = _PayerParty.Customer

  association [0..1] to I_SalesOrganizationText   as _SalesOrganizationText   on  $projection.SalesOrganization   = _SalesOrganizationText.SalesOrganization
                                                                              and _SalesOrganizationText.Language = $session.system_language
  association [0..1] to I_DistributionChannelText as _DistributionChannelText on  $projection.DistributionChannel   = _DistributionChannelText.DistributionChannel
                                                                              and _DistributionChannelText.Language = $session.system_language
  association [0..1] to I_DivisionText            as _DivisionText            on  $projection.OrganizationDivision = _DivisionText.Division
                                                                              and _DivisionText.Language           = $session.system_language
{
  key SalesDocument,
      SalesDocumentDate,
      SalesOrganization,
      _SalesOrganizationText.SalesOrganizationName                     as SalesOrganizationName,
      DistributionChannel,
      _DistributionChannelText.DistributionChannelName                 as DistributionChannelName,
      OrganizationDivision,
      _DivisionText.DivisionName                                       as DivisionName,
      TransactionCurrency,
      _AG.Customer                                                     as AGCustomer,
      _SoldToParty,
      _RE.Customer                                                     as RECustomer,
      _PayerParty,
      _RG.Customer                                                     as RGCustomer,
      _BillToParty,
      _WE.Customer                                                     as WECustomer,
      _ShipToParty

}
