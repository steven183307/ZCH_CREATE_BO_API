@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery(header)'

@UI.headerInfo:{
    typeNamePlural: 'Delivery Document(Header)',
    typeName: 'Delivery Document',
    title.value: 'DeliveryDocument',
    description: {type: #STANDARD

     }
    }
@Search.searchable: true

define view entity zch_dn as select from ZTDI_LIKP 

//  association [1..*] to ZTDC_LIPS as  _ZTDC_LIPS on $projection.DeliveryDocument =  _ZTDC_LIPS.DeliveryDocument

{
      @UI.facet: [
//       {
//                   id: 'DeliveryItem',
//                    purpose: #STANDARD,
//                    position: 60,
//                    type: #LINEITEM_REFERENCE,
//                    targetElement: '_ZTDC_LIPS',
//                    label: 'Delivery Document(Item)'
//        },
      {
                      label: 'Delivery Info',
                      id: 'COLLFAC1',
                      type: #COLLECTION,
                      position: 10
      },{
                      label: 'Delivery Data',
                      parentId: 'COLLFAC1',
                      type: #IDENTIFICATION_REFERENCE,
                      position: 20,
                      targetQualifier: 'header'
      }
      ]
      @Search.defaultSearchElement: true
      @UI.identification: [{position: 10 , label: 'DeliveryDocument' , qualifier: 'header'}]
      @UI.lineItem: [{position: 10,label: 'DeliveryDocument'}]
  key DeliveryDocument,
      
  key DeliveryDocumentItem,
      @UI.identification: [{position: 20 , label: 'DocumentDate' , qualifier: 'header'}]
      @UI.lineItem: [{position: 20,label: 'DocumentDate'}]
      DocumentDate,
      @UI.identification: [{position: 30 , label: 'PlannedGoodsIssueDate' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'PlannedGoodsIssueDate'}]
      PlannedGoodsIssueDate,
      @UI.identification: [{position: 40 , label: 'ActualGoodsMovementDate' , qualifier: 'header'}]
      @UI.lineItem: [{position: 40,label: 'ActualGoodsMovementDate'}]
      ActualGoodsMovementDate,
      @UI.identification: [{position: 50 , label: 'ShipToParty' , qualifier: 'header'}]
      @UI.lineItem: [{position: 50,label: 'ShipToParty'}]
      ShipToParty,
       @UI.identification: [{position: 60 , label: 'ShipToPartyName' , qualifier: 'header'}]
      @UI.lineItem: [{position: 50,label: 'ShipToPartyName'}]
      ShipToPartyName,

      Material,
      DeliveryDocumentItemText,
      ActualDeliveryQuantity,
      DeliveryQuantityUnit,
      BaseUnit,
      Plant,
      StorageLocation,
      ReferenceSDDocument,
      ReferenceSDDocumentItem
//      _ZTDC_LIPS

}
