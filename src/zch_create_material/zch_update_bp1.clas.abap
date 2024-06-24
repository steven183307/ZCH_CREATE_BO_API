CLASS zch_update_bp1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_BP1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner
    ALL FIELDS WITH VALUE #(
    (
    businesspartner = 'CHASE03'
    )
      (
    businesspartner = 'CHASE04'
    )
     ) RESULT DATA(partner).
    DATA c TYPE string.
    DATA update_bp TYPE STRUCTURE FOR UPDATE i_businesspartnertp_3.
    DATA update_bp2 TYPE TABLE FOR UPDATE i_businesspartnertp_3.

    LOOP AT partner ASSIGNING FIELD-SYMBOL(<new_partner>).
*      IF  sy-tabix = 1.
*        c = 'change one12'.
*      ELSE.
*        c = 'change two23'.
*      ENDIF.
      update_bp = VALUE #(
                %key-BusinessPartner = <new_partner>-BusinessPartner

                FirstName =  'change one12'
                Language = 'D'
                %control-firstname = cl_abap_behv=>flag_changed
                %control-language = cl_abap_behv=>flag_changed
                %is_draft = if_abap_behv=>mk-off
       ).
      APPEND update_bp TO update_bp2.
    ENDLOOP.
    MODIFY ENTITY i_businesspartnertp_3
    UPDATE FROM update_bp2

    REPORTED DATA(reported) FAILED DATA(failed).

*      CLEAr : update_bp2 ,update_bp.




    IF Failed IS NOT INITIAL.
      LOOP AT reported-businesspartner ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'product1 error' ).
        out->write( lv_result1 ).
      ENDLOOP.


    ELSE.
      COMMIT ENTITIES RESPONSE OF i_businesspartnertp_3
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).
*      COMMIT ENTITIES
*          RESPONSE OF I_ProductTP_2
*              FAILED DATA(failed_commit)
*              REPORTED DATA(reported_commit).

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-businesspartner ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'product2 error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.

    ENDIF.


  ENDMETHOD.
ENDCLASS.
