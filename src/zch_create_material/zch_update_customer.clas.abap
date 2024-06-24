CLASS zch_update_customer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_CUSTOMER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner
    ALL FIELDS WITH VALUE #( (
    businesspartner = 'CHASE54'
    ) ) RESULT DATA(partner).

    READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner BY \_businesspartnerrole
    ALL FIELDS WITH VALUE #( (
     %tky = partner[ 1 ]-%tky
     ) )
     RESULT DATA(curr_role).

    LOOP AT curr_role ASSIGNING FIELD-SYMBOL(<updated_role>).

      <updated_role>-BusinessPartnerRole = 'CRM000'.
*      <updated_role>-%is_draft = if_abap_behv=>mk-off.
*      <updated_role>-validfrom = '20231004'.
*      <updated_role>-validto = '20231230'.

      MODIFY ENTITY i_businesspartnerroletp_3

     UPDATE FROM VALUE #( ( VALUE #(
      %data-BusinessPartnerRole = <updated_role>-BusinessPartnerRole
*      %data-validto = <updated_role>-validto
*      %data-validfrom = <updated_role>-validfrom
*      %control-validto = cl_abap_behv=>flag_changed
*      %control-validfrom = cl_abap_behv=>flag_changed
      %control-BusinessPartnerRole = cl_abap_behv=>flag_changed
*      %is_draft = if_abap_behv=>mk-off
      %tky = CORRESPONDING #( <updated_role>-%tky )
      ) ) )
      REPORTED DATA(reported) FAILED DATA(failed).
      IF failed IS NOT INITIAL.
        LOOP AT reported-businesspartner ASSIGNING FIELD-SYMBOL(<fs_bp_mapped>).
          DATA(lv_result5) = <fs_bp_mapped>-%msg->if_message~get_text(  ).
          out->write( lv_result5 ).
        ENDLOOP.
        LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<fs_bp_mapped2>).
          DATA(lv_result7) = <fs_bp_mapped2>-%msg->if_message~get_text(  ).
          out->write( lv_result7 ).
        ENDLOOP.
      ENDIF.
    ENDLOOP.

    COMMIT ENTITIES RESPONSE OF i_businesspartnertp_3
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
*        LOOP AT mapped-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
**          CONVERT KEY OF I_ProductTP_2 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
**          out->write( 'Purchase Order:'  && ls_po_key-PurchaseOrder ).
*
*        ENDLOOP.
      out->write( 'SUCCESS' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
