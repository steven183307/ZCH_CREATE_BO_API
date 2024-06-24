CLASS zch_create_supplier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_SUPPLIER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITIES OF I_SupplierListTP_2
     ENTITY SupplierList
     CREATE FIELDS ( SupplierListName PurchaserResponsibleUser PurchaserRespWorkAgreement SupplierListType )
     WITH VALUE #( ( %cid = 'CID1'
     SupplierListName = 'Test1'
*     PurchaserResponsibleUser = 'NEIL051'
*     PurchaserRespWorkAgreement = '50089052'
     SupplierListType = '01'

     ) )
     CREATE BY \_SupplierListMaterialGroupTP
     FIELDS ( MaterialGroup )
     WITH VALUE #( ( %cid_ref = 'CID1'
     %target = VALUE #( ( %cid = 'CIDM1'
     MaterialGroup = 'A002'
      ) )
     ) )
     CREATE BY \_SupplierListCompanyCodeTP
     FIELDS ( CompanyCode )
     WITH VALUE #( ( %cid_ref = 'CID1'
     %target = VALUE #( ( %cid = 'CIDC1'
     CompanyCode = '6310' )
     ) ) )
     CREATE BY \_SuplrListBusinessPartnerTP
     FIELDS ( BusinessPartner Supplier SupplierCountryGroup SuplrListSuplrProposalAction SuplrListSupplierIsMandatory )
     WITH VALUE #( ( %cid_ref = 'CID1'
     %target = VALUE #( ( %cid = 'CIDB1'
     BusinessPartner = 'NEIL051'
     Supplier = 'NEIL051'
     SupplierCountryGroup = 'APJ'
     SuplrListSuplrProposalAction = '1'
     SuplrListSupplierIsMandatory = 'X'
     )
     ) ) )
*     CREATE BY \_SuplrListProposedSupplierTP
*     FIELDS ( BusinessPartner Supplier SuplrListSuplrProposalAction SuplrListSupplierApprovalText SuplrListSupplierProposalText SupplierCountryGroup )
*     WITH VALUE #( ( %cid_ref = 'CID1'
*     %target = VALUE #( ( %cid = 'CIDP1'
*     BusinessPartner = '900023584'
*     Supplier = '0000000001'
*     SuplrListSuplrProposalAction = '1'
*     SuplrListSupplierApprovalText = 'Test_text_Approval'
*     SuplrListSupplierProposalText = 'Test_text_Proposal'
*     SupplierCountryGroup = 'APJ'
*     ) ) ) )

    REPORTED DATA(ls_reported)
    MAPPED DATA(ls_mapped)
    FAILED DATA(ls_failed).

    IF ls_failed IS NOT INITIAL.
      LOOP AT ls_reported-supplierlist ASSIGNING FIELD-SYMBOL(<ls_po_reported1>).
        DATA(lv_result1) = <ls_po_reported1>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error1' ).
        out->write( lv_result1 ) .
      ENDLOOP.
      LOOP AT ls_reported-supplierlistmaterialgroup ASSIGNING FIELD-SYMBOL(<ls_po_reported2>).
        DATA(lv_result2) = <ls_po_reported2>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error2' ).
        out->write( lv_result2 ) .
      ENDLOOP.
      LOOP AT ls_reported-supplierlistcompanycode ASSIGNING FIELD-SYMBOL(<ls_po_reported3>).
        DATA(lv_result3) = <ls_po_reported3>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error3' ).
        out->write( lv_result3 ) .
      ENDLOOP.
      LOOP AT ls_reported-suplrlistprpsdbusinesspartner ASSIGNING FIELD-SYMBOL(<ls_po_reported4>).
        DATA(lv_result4) = <ls_po_reported4>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error4' ).
        out->write( lv_result4 ) .
      ENDLOOP.
      out->write( 'failed IS NOT INITIAL' ).

    ELSE.
      COMMIT ENTITIES
         RESPONSE OF I_SupplierListTP_2
             FAILED DATA(failed_commit)
             REPORTED DATA(reported_commit).
      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-supplierlist ASSIGNING FIELD-SYMBOL(<ls_po_reported5>).
          DATA(lv_result5) = <ls_po_reported5>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error5' ).
          out->write( lv_result5 ) .
        ENDLOOP.
        LOOP AT reported_commit-supplierlistmaterialgroup ASSIGNING FIELD-SYMBOL(<ls_po_reported6>).
          DATA(lv_result6) = <ls_po_reported6>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error6' ).
          out->write( lv_result6 ) .
        ENDLOOP.
        LOOP AT reported_commit-supplierlistcompanycode ASSIGNING FIELD-SYMBOL(<ls_po_reported7>).
          DATA(lv_result7) = <ls_po_reported7>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error7' ).
          out->write( lv_result7 ) .
        ENDLOOP.
        LOOP AT reported_commit-suplrlistprpsdbusinesspartner ASSIGNING FIELD-SYMBOL(<ls_po_reported8>).
          DATA(lv_result8) = <ls_po_reported8>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error8' ).
          out->write( lv_result8 ) .
        ENDLOOP.

        out->write( 'failed_commit Error' ).
      ELSE.
      out->write( 'SUCCESS' ).
      ENDIF.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
