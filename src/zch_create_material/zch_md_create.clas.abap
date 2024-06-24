CLASS zch_md_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_MD_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA create_MATERIALDOCUMENT TYPE STRUCTURE FOR CREATE i_materialdocumenttp.
    DATA create_MATERIALDOCUMENT2 TYPE TABLE FOR CREATE i_materialdocumenttp.
    DATA create_MATERIALDOCUMENTitem TYPE STRUCTURE FOR CREATE i_materialdocumenttp\_MaterialDocumentItem.
    DATA create_MATERIALDOCUMENTitem2 TYPE TABLE FOR CREATE i_materialdocumenttp\_MaterialDocumentItem.

    create_MATERIALDOCUMENT = VALUE #(
            %cid = 'CID_001'
            goodsmovementcode = '06'
            postingdate = '20231013'
            documentdate = '20231213'
            MaterialDocumentHeaderText = '取消184'
            %control-goodsmovementcode = cl_abap_behv=>flag_changed
            %control-postingdate = cl_abap_behv=>flag_changed
            %control-documentdate = cl_abap_behv=>flag_changed
            %control-MaterialDocumentHeaderText = cl_abap_behv=>flag_changed
            ).
    APPEND create_MATERIALDOCUMENT  TO create_MATERIALDOCUMENT2.

    create_MATERIALDOCUMENTitem =  VALUE #(
                    %cid_ref = 'CID_001'
                    %target = VALUE #( (
                        %cid = 'CID_ITM_001'
                        plant = '6310'
                        material = 'MATERIAL1212A'
                        GoodsMovementType = '561'
                        storagelocation = '631B'
                        QuantityInEntryUnit = 1
                        entryunit = 'ST'
                        %control-plant = cl_abap_behv=>flag_changed
                        %control-material = cl_abap_behv=>flag_changed
                        %control-GoodsMovementType = cl_abap_behv=>flag_changed
                        %control-storagelocation = cl_abap_behv=>flag_changed
                        %control-QuantityInEntryUnit = cl_abap_behv=>flag_changed
                        %control-entryunit = cl_abap_behv=>flag_changed
                         ) ) ).
    APPEND create_MATERIALDOCUMENTitem  TO create_MATERIALDOCUMENTitem2.
    DATA: lt_cancel_item TYPE TABLE FOR ACTION IMPORT i_materialdocumenttp\\MaterialDocumentItem~Cancel.

    lt_cancel_item = VALUE #( (
                    %cid_ref = 'CID_001'
                    %key-MaterialDocument = '4900000184'
                    %key-MaterialDocumentYear = '2023'
                    %key-MaterialDocumentItem = '0001'
                    ) ).

    MODIFY ENTITIES OF i_materialdocumenttp
     ENTITY MaterialDocument

     CREATE FROM create_MATERIALDOCUMENT2
     ENTITY MaterialDocument
     CREATE BY \_MaterialDocumentItem
     FROM create_MATERIALDOCUMENTitem2

     ENTITY MaterialDocumentItem
     EXECUTE Cancel FROM lt_cancel_item



     MAPPED DATA(mapped)
     REPORTED DATA(reported)
     FAILED DATA(failed).


    IF failed IS NOT INITIAL.
      LOOP AT reported-materialdocument  ASSIGNING FIELD-SYMBOL(<ls_materialdocument>).
        DATA(lv_materialdocument) = <ls_materialdocument>-%msg->if_message~get_text( ).
        out->write( 'materialdocument Error1' ).
        out->write( lv_materialdocument ).
      ENDLOOP.
      LOOP AT reported-materialdocumentitem  ASSIGNING FIELD-SYMBOL(<ls_materialdocumentitem>).
        DATA(lv_materialdocumentitem) = <ls_materialdocumentitem>-%msg->if_message~get_text( ).
        out->write( 'materialdocumentitem Error1' ).
        out->write( lv_materialdocumentitem ).
      ENDLOOP.
    ELSE.

      COMMIT ENTITIES BEGIN
      RESPONSE OF i_materialdocumenttp
             FAILED DATA(failed_commit)
             REPORTED DATA(reported_commit).

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-materialdocument  ASSIGNING FIELD-SYMBOL(<ls_materialdocument_f>).
          DATA(lv_materialdocument_f) = <ls_materialdocument_f>-%msg->if_message~get_text( ).
          out->write( 'Commit materialdocument Error' ).
          out->write( lv_materialdocument_f ).
        ENDLOOP.
        LOOP AT reported_commit-materialdocumentitem  ASSIGNING FIELD-SYMBOL(<ls_materialdocumentitem_f>).
          DATA(lv_materialdocumentitem_f) = <ls_materialdocumentitem_f>-%msg->if_message~get_text( ).
          out->write( 'Commit materialdocumentitem Error' ).
          out->write( lv_materialdocumentitem_f ).
        ENDLOOP.

        out->write( 'error' ).
      ELSE.

        LOOP AT mapped-materialdocument ASSIGNING FIELD-SYMBOL(<keys_header>).

          CONVERT KEY OF i_materialdocumentTp
          FROM <keys_header>-%pid
          TO <keys_header>-%key.
        ENDLOOP.

        LOOP AT mapped-materialdocumentitem ASSIGNING FIELD-SYMBOL(<keys_item>).

          CONVERT KEY OF i_materialdocumentitemtp
          FROM <keys_item>-%pid
          TO <keys_item>-%key.
        ENDLOOP.
        out->write( 'SUCCESS' ).
        out->write( <keys_header>-%key-MaterialDocument ).
        out->write( <keys_header>-%key-MaterialDocumentYear ).
        out->write( <keys_item>-%key ).

      ENDIF.
      COMMIT ENTITIES END.
    ENDIF.



  ENDMETHOD.
ENDCLASS.
