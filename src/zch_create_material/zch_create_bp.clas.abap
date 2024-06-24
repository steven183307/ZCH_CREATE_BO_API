CLASS zch_create_bp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_BP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA update_supplier TYPE STRUCTURE FOR CREATE  i_businesspartnertp_3\_BusinessPartnerRole.
    DATA update_supplier1 TYPE TABLE FOR CREATE  i_businesspartnertp_3\_BusinessPartnerRole.

    DATA create_partner TYPE TABLE FOR CREATE i_businesspartnertp_3.



    create_partner = VALUE #(
*     (
*     %cid = 'bp1'
*     businesspartnercategory = '1'
*     %control-businesspartnercategory = if_abap_behv=>mk-on
*
*     BusinessPartner = 'CHASE07'
*     %control-BusinessPartner = if_abap_behv=>mk-on
**     BusinessPartnerGrouping = ' '
*     lastname = 'CHASE07'
*     %control-lastname = if_abap_behv=>mk-on
*     )
     (
     %cid = 'bp2'
     businesspartnercategory = '1'
     %control-businesspartnercategory = if_abap_behv=>mk-on
     BusinessPartner = 'CHASE98'
     %control-BusinessPartner = if_abap_behv=>mk-on
     lastname = 'CHASE'
     %control-lastname = if_abap_behv=>mk-on
     )
     ).

*    update_supplier = VALUE #(
*      %cid_ref = 'bp1'
*        %target = VALUE #( (  %cid = '1'
*        BusinessPartnerRole = 'FLVN01' )
*
*        )
*    )
*    .
*
*    APPEND update_supplier TO update_supplier1.

    update_supplier = VALUE #(
      %cid_ref = 'bp2'
        %target = VALUE #( (  %cid = '2'
        BusinessPartnerRole = 'FLVN01' )

        )
    )
    .

    APPEND update_supplier TO update_supplier1.

    MODIFY ENTITIES OF i_businesspartnertp_3
     ENTITY businesspartner
     CREATE FROM create_partner

     CREATE BY \_businesspartneraddress
     FIELDS ( country cityname ) WITH VALUE #(
*      (
*     %cid_ref = 'bp1'
*     %target = VALUE #(
*     (
*     %cid = 'bp1_1'
*     country = 'IN'
*     cityname = 'TEST07'
*
*     )
*     )
*     )
     (
     %cid_ref = 'bp2'
     %target = VALUE #(
     (
     %cid = 'bp2_1'
     country = 'IN'
     cityname = 'TEST'

     )
     )
     )
     )
          CREATE BY \_BusinessPartnerRole
     FROM update_supplier1



      MAPPED DATA(mapped)
 REPORTED DATA(reported)
 FAILED DATA(failed).

    IF failed IS NOT INITIAL.
*      LOOP AT reported-BUSINESSPARTNER  ASSIGNING FIELD-SYMBOL(<ls_po_reported>).
*        DATA(lv_result) = <ls_po_reported>-%msg->if_message~get_text( ).
*        out->write( 'EML PO Error1' ).
*        out->write( lv_result ).
*      ENDLOOP.

*      LOOP AT reported_po_headers-purchaseorder ASSIGNING FIELD-SYMBOL(<ls_po_reported2>).
*        DATA(lv_result2) = <ls_po_reported2>-%msg->if_message~get_text( ).
*        out->write( 'EML PO Header Error' ).
*        out->write( lv_result2 ).
*      ENDLOOP.
      out->write( 'failed IS NOT INITIAL' ).
    ELSE.
      COMMIT ENTITIES
     RESPONSE OF i_businesspartnertp_3
     FAILED DATA(failed_commit)
     REPORTED DATA(reported_commit).


      IF failed_commit IS NOT INITIAL.
        out->write( 'failed_commit Error' ).
        LOOP AT reported_commit-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped2>).
          DATA(lv_result3) = <fs_po_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.

      ELSE.
        LOOP AT mapped-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
*          CONVERT KEY OF I_ProductTP_2 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
*          out->write( 'Purchase Order:'  && ls_po_key-PurchaseOrder ).

        ENDLOOP.
        out->write( 'SUCCESS' ).
      ENDIF.

*            COMMIT ENTITIES END.
    ENDIF.

*     MAPPED DATA(mapped)
*     REPORTED DATA(reported)
*     FAILED DATA(failed).
*
*    COMMIT ENTITIES
*     RESPONSE OF i_businesspartnertp_3
*     FAILED DATA(failed_commit)
*     REPORTED DATA(reported_commit).

  ENDMETHOD.
ENDCLASS.
