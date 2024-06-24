@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery(header)'

define view entity zch_dn_i as select from I_DeliveryDocumentItem 

  association [0..1] to I_DeliveryDocument  as _likp on  $projection.DeliveryDocument = _likp.DeliveryDocument
  association [1..1] to I_SalesDocumentItem as _vbap on  $projection.ReferenceSDDocument     = _vbap.SalesDocument
                                                     and $projection.ReferenceSDDocumentItem = _vbap.SalesDocumentItem
 
                                                
{
  key DeliveryDocument,
  key DeliveryDocumentItem,

      _likp.DocumentDate            as DocumentDate,
      _likp.PlannedGoodsIssueDate   as PlannedGoodsIssueDate,
      _likp.ActualGoodsMovementDate as ActualGoodsMovementDate,
      _likp.ShipToParty             as ShipToParty,

      Material,
      DeliveryDocumentItemText,
      ActualDeliveryQuantity,
      DeliveryQuantityUnit,
      BaseUnit,
      Plant,
      StorageLocation,
      _likp._ShipToParty.CustomerName as ShipToPartyName,
    
      ReferenceSDDocument,
      ReferenceSDDocumentItem
          
}
