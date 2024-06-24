CLASS zch_md_cancel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_MD_CANCEL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_cancel_header TYPE TABLE FOR ACTION IMPORT i_materialdocumenttp\\MaterialDocument~Cancel.

    lt_cancel_header = VALUE #( (
                    %key-MaterialDocument = '4900000184'
                    %key-MaterialDocumentYear = '2023'


                     ) ).
    DATA: lt_cancel_item TYPE TABLE FOR ACTION IMPORT i_materialdocumenttp\\MaterialDocumentItem~Cancel.

    lt_cancel_item = VALUE #( (
                    %key-MaterialDocument = '4900000184'
                    %key-MaterialDocumentYear = '2023'
                    %key-MaterialDocumentItem = '0001'
                    ) ).


    MODIFY ENTITIES OF i_materialdocumenttp
*    ENTITY MaterialDocument
*    EXECUTE Cancel FROM lt_cancel_header
    ENTITY MaterialDocumentItem
    EXECUTE Cancel FROM lt_cancel_item


    MAPPED DATA(mapped)
    FAILED DATA(failed)
    REPORTED DATA(reported).

    IF Failed IS NOT INITIAL.
      LOOP AT reported-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'header data error' ).
        out->write( lv_result1 ).
      ENDLOOP.
      LOOP AT reported-materialdocumentitem ASSIGNING FIELD-SYMBOL(<lt_proudct21>).
        DATA(lv_result21) = <lt_proudct21>-%msg->if_message~get_text( ).
        out->write( 'item data error' ).
        out->write( lv_result21 ).
      ENDLOOP.
      out->write( 'failed error' ).
    ELSE.

      COMMIT ENTITIES BEGIN
      RESPONSE OF i_materialdocumenttp
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).

      COMMIT ENTITIES END.

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct22>).
          DATA(lv_result22) = <lt_proudct22>-%msg->if_message~get_text( ).
          out->write( 'header commit error' ).
          out->write( lv_result22 ).
        ENDLOOP.
        LOOP AT reported_commit-materialdocumentitem ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'item commit error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.
    ENDIF.

*    IF Failed IS NOT INITIAL.
*      LOOP AT reported-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
*        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
*        out->write( 'businesspartner1 error' ).
*        out->write( lv_result1 ).
*      ENDLOOP.
*      LOOP AT reported-materialdocumentitem ASSIGNING FIELD-SYMBOL(<lt_proudct21>).
*        DATA(lv_result21) = <lt_proudct21>-%msg->if_message~get_text( ).
*        out->write( 'businesspartner1 error' ).
*        out->write( lv_result21 ).
*      ENDLOOP.
*    ENDIF.
*
**    IF Failed IS NOT INITIAL.
**      LOOP AT reported-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
**        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
**        out->write( 'businesspartner1 error' ).
**        out->write( lv_result1 ).
**      ENDLOOP.
**    ELSE.
**      LOOP AT mapped-materialdocument ASSIGNING FIELD-SYMBOL(<keys_header>).
**
**        CONVERT KEY OF i_materialdocumentTp
**        FROM <keys_header>-%pid
**        TO <keys_header>-%key.
**      ENDLOOP.
**              out->write( <keys_header> ).
**    ENDIF.
*    COMMIT ENTITIES RESPONSE OF I_MaterialDocumentTP
*     FAILED DATA(failed_commit)
*     REPORTED DATA(reported_commit).
*    IF failed_commit IS NOT INITIAL.
*      LOOP AT reported_commit-materialdocument ASSIGNING FIELD-SYMBOL(<lt_proudct22>).
*        DATA(lv_result22) = <lt_proudct22>-%msg->if_message~get_text( ).
*        out->write( 'product22 error' ).
*        out->write( lv_result22 ).
*      ENDLOOP.
*      LOOP AT reported_commit-materialdocumentitem ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
*        DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
*        out->write( 'product2 error' ).
*        out->write( lv_result2 ).
*      ENDLOOP.
*      out->write( 'failed commit error' ).
*    ELSE.
*      out->write( 'success' ).
*    ENDIF.


  ENDMETHOD.
ENDCLASS.
