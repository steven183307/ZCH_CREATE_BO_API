CLASS zch_reverse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_REVERSE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_jr  TYPE TABLE FOR ACTION IMPORT i_journalentrytp~Reverse,
          lv_cid TYPE abp_behv_cid.

    TRY.
        lv_cid = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
      CATCH cx_uuid_error.
        ASSERT 1 = 0.
    ENDTRY.

    APPEND INITIAL LINE TO lt_jr ASSIGNING FIELD-SYMBOL(<jr>).

    <jr>-companycode = '1000'.
    <jr>-fiscalyear = '2023'.
    <jr>-accountingdocument = '0100000055'.
    <jr>-%param = VALUE #(
    postingdate = sy-datlo
    reversalreason = '01'
    createdbyuser = 'CB9980000038'

    ).

    MODIFY ENTITIES OF i_journalentrytp
    ENTITY journalentry
    EXECUTE reverse FROM lt_jr


    FAILED DATA(ls_failed)
    REPORTED DATA(ls_reported)
    MAPPED DATA(ls_mapped).

    LOOP AT ls_reported-journalentry ASSIGNING FIELD-SYMBOL(<ls_reported>).
      DATA(lv_result) = <ls_reported>-%msg->if_message~get_text( ).
      out->write( lv_result ).
    ENDLOOP.

    IF ls_failed-journalentry IS INITIAL.

      COMMIT ENTITIES BEGIN
      RESPONSE OF i_journalentrytp
      FAILED DATA(lt_commit_failed)
      REPORTED DATA(lt_commit_reported).

      "Error handling goes here
      "Convert the %pid to the drawn db key
      if lt_commit_failed is INITIAL.
      LOOP AT ls_mapped-journalentry ASSIGNING FIELD-SYMBOL(<ls_mapped>).

        CONVERT KEY OF i_journalentrytp FROM <ls_mapped>-%pid TO DATA(lv_key).
        <ls_mapped>-companycode = lv_key-companycode.
        <ls_mapped>-fiscalyear = lv_key-fiscalyear.
        <ls_mapped>-accountingdocument = lv_key-accountingdocument.
        EXIT.
      ENDLOOP.

      DATA(lv_accountingdocument) = <ls_mapped>-accountingdocument.
      DATA(lv_fiscal) = <ls_mapped>-fiscalyear.
      DATA(lv_companycode) = <ls_mapped>-companycode.

      out->write(  'Reversed Successfully' ).
      out->write(  'COMPANY CODE:' ). out->write(  lv_companycode ).
      out->write(  'FISCAL YEAR:' ). out->write(  lv_fiscal ).
      out->write(  'ACCOUNTING DOC:' ). out->write( lv_accountingdocument ).
      ELSE.
        LOOP AT lt_commit_reported-journalentry ASSIGNING FIELD-SYMBOL(<ls_commit_reported>).
          DATA(lv_commit_reported) = <ls_commit_reported>-%msg->if_message~get_text( ).
          out->write( lv_commit_reported ).
        ENDLOOP.
       out->write( 'commit error' ).

      ENDIF.

      COMMIT ENTITIES END.

    ELSE.
    out->write( 'data error' ).
    ENDIF.


ENDMETHOD.
ENDCLASS.
