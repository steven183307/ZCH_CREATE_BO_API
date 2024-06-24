CLASS zch_md_modify DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_MD_MODIFY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA update_MD TYPE STRUCTURE FOR UPDATE i_materialdocumenttp.
    DATA update_MD2 TYPE TABLE FOR UPDATE i_materialdocumenttp.

    DATA update_MDitem TYPE STRUCTURE FOR UPDATE I_MaterialDocumentItemTP.
    DATA update_MDitem2 TYPE TABLE FOR UPDATE I_MaterialDocumentItemTP.

    update_MD = VALUE #(

        %key-MaterialDocument = '4900000176'
        %key-MaterialDocumentYear = '2023'

        MaterialDocumentHeaderText = '20231012'

        %control-MaterialDocumentHeaderText = cl_abap_behv=>flag_changed
         ).
    APPEND update_MD TO update_MD2.

    MODIFY ENTITIES OF i_materialdocumenttp
     ENTITY MaterialDocument
     UPDATE FROM update_MD2

     REPORTED DATA(reported)
     FAILED DATA(failed).

      IF Failed IS NOT INITIAL.
        LOOP AT reported-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
          DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
          out->write( 'businesspartner1 error' ).
          out->write( lv_result1 ).
        ENDLOOP.


      ELSE.

    COMMIT ENTITIES RESPONSE OF i_materialdocumenttp
    FAILED DATA(failed_commit)
    REPORTED DATA(reported_commit).

        IF failed_commit IS NOT INITIAL.
          LOOP AT reported_commit-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct3>).
            DATA(lv_result3) = <lt_proudct3>-%msg->if_message~get_text( ).
            out->write( 'businesspartner3 error' ).
            out->write( lv_result3 ).
          ENDLOOP.

          out->write( 'failed commit error' ).
        ELSE.
          out->write( 'success' ).

        ENDIF.

      ENDIF.
  ENDMETHOD.
ENDCLASS.
