CLASS zch_update_bp5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_BP5 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    MODIFY ENTITIES OF I_BusinessPartnerTP_3 ENTITY BusPartEmailAddress
   UPDATE
   FIELDS ( EmailAddress )
   WITH VALUE #( ( EmailAddress = 'mytestid@sap.com'
   %tky-%is_draft = if_abap_behv=>mk-off
   %tky-BusinessPartner = 'CHASE03'
   %tky-AddressNumber = '0000040790'
   %tky-OrdinalNumber = '001'
   %tky-Person =  '0000040789'

   )
*   ( EmailAddress = 'mytestid@sap.com'
*   %tky-%is_draft = if_abap_behv=>mk-off
*   %tky-BusinessPartner = 'CHASE04'
*   %tky-AddressNumber = '0000040793'
*   %tky-OrdinalNumber = '001'
*   %tky-Person =  '0000040792'
*   )
    )
   FAILED DATA(failed) MAPPED DATA(mapped) REPORTED DATA(reported).

    COMMIT ENTITIES
    RESPONSE OF i_businesspartnertp_3
     FAILED DATA(failed_commit)
     REPORTED DATA(reported_commit).

       IF failed_commit IS NOT INITIAL.
          LOOP AT reported_commit-buspartemailaddress ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
            DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
            out->write( 'businesspartner2 error' ).
            out->write( lv_result2 ).
          ENDLOOP.
          LOOP AT reported_commit-businesspartner ASSIGNING FIELD-SYMBOL(<lt_proudct4>).
            DATA(lv_result4) = <lt_proudct4>-%msg->if_message~get_text( ).
            out->write( 'businesspartner4 error' ).
            out->write( lv_result4 ).
          ENDLOOP.
          out->write( 'failed commit error' ).
        ELSE.
          out->write( 'success' ).
        ENDIF.
  ENDMETHOD.
ENDCLASS.
