CLASS zch_bank_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_BANK_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA create_bank TYPE STRUCTURE FOR CREATE I_BankTP.
    DATA create_bank2 TYPE TABLE FOR CREATE I_BankTP.


create_bank = VALUE #(
   %cid = '01'
    bankcountry = 'CZ'
   %control-bankcountry  = cl_abap_behv=>flag_changed
    BankInternalID = '1093'
   %control-BankInternalID = cl_abap_behv=>flag_changed
   LongBankName = 'Neil Bank'
   %control-LongBankName = cl_abap_behv=>flag_changed
     ).
    APPEND create_bank  TO create_bank2 .


    MODIFY ENTITIES OF I_BankTP
    ENTITY Bank
    CREATE FROM create_bank2


   MAPPED DATA(mapped)
     REPORTED DATA(reported)
     FAILED DATA(failed).
    IF failed IS NOT INITIAL.
      LOOP AT reported-bank  ASSIGNING FIELD-SYMBOL(<ls_Bank>).
        DATA(lv_Bank) = <ls_Bank>-%msg->if_message~get_text( ).
        out->write( 'Bank Error' ).
        out->write( lv_Bank ) .
      ENDLOOP.

      out->write( 'failed IS NOT INITIAL' ).

    ELSE.
      COMMIT ENTITIES
     RESPONSE OF I_BankTP
         FAILED DATA(failed_commit)
         REPORTED DATA(reported_commit).
      IF failed_commit IS NOT INITIAL.
      ELSE.
        out->write( 'SUCCESS' ).
      ENDIF.
*            COMMIT ENTITIES END.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
