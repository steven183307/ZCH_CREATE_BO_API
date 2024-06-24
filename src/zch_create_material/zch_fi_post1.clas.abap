CLASS zch_fi_post1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_FI_POST1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_je_deep TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post,
          lv_cid     TYPE abp_behv_cid.

    TRY.
        lv_cid = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
      CATCH cx_uuid_error.
        ASSERT 1 = 0.
    ENDTRY.

    APPEND INITIAL LINE TO lt_je_deep ASSIGNING FIELD-SYMBOL(<je_deep>).
    <je_deep>-%cid = lv_cid.
    <je_deep>-%param = VALUE #(
    companycode = '1000' " Success
    documentreferenceid = 'BKPFF'
    createdbyuser = 'CB9980000038'
    businesstransactiontype = 'RFBU'
    accountingdocumenttype = 'KZ' "(改DZ)
    documentdate = sy-datlo
    postingdate = sy-datlo
    accountingdocumentheadertext = 'KZ rules'

*    _onetimecustomersupplier = VALUE  #(
*      BankNumber = '89001'
*      BankAccount = '富邦銀行'
*      BankCountry = 'YATW'
*      AccountTaxType = 'S'
**      Country = 'YATW'
*
*      %control = VALUE #( bankaccount = cl_abap_behv=>flag_changed
*                          bankcountry = cl_abap_behv=>flag_changed
*                          banknumber = cl_abap_behv=>flag_changed
*                          accounttaxtype = cl_abap_behv=>flag_changed
**                          country = cl_abap_behv=>flag_changed
*                           )
*
*     )

    _glitems = VALUE #(
    ( glaccountlineitem = |001|
      glaccount = '0011001000'
      HouseBank = '89001' "( KZ +
      HouseBankAccount = '富邦銀行' "( KZ +
      _currencyamount = VALUE #( ( currencyrole = '00'

                                   journalentryitemamount = '100' "( KZ 正值 DZ負值 )
                                   currency = 'TWD' ) ) )
    ( glaccountlineitem = |002|
      glaccount = '0010010000'
*            HouseBank = '89001'
*      HouseBankAccount = '富邦銀行'
      _currencyamount = VALUE #( ( currencyrole = '00'
                                   journalentryitemamount = '-100'

                                   currency = 'TWD'
                                   ) )
                                    ) )
    ).

    MODIFY ENTITIES OF i_journalentrytp
    ENTITY journalentry
    EXECUTE post FROM lt_je_deep

    FAILED DATA(ls_failed_deep)
    REPORTED DATA(ls_reported_deep)
    MAPPED DATA(ls_mapped_deep).

    IF ls_failed_deep IS NOT INITIAL.
      LOOP AT ls_reported_deep-journalentry ASSIGNING FIELD-SYMBOL(<ls_reported_deep>).
        DATA(lv_result) = <ls_reported_deep>-%msg->if_message~get_text( ).
        out->write( lv_result ).
      ENDLOOP.
    ELSE.
      COMMIT ENTITIES BEGIN
      RESPONSE OF i_journalentrytp
      FAILED DATA(lt_commit_failed)
      REPORTED DATA(lt_commit_reported).
      COMMIT ENTITIES END.
      IF lt_commit_failed IS INITIAL.
        out->write( lt_commit_reported-journalentry ).
      ELSE.
        LOOP AT lt_commit_reported-journalentry ASSIGNING FIELD-SYMBOL(<ls_commit_reported>).
          DATA(lv_commit_reported) = <ls_commit_reported>-%msg->if_message~get_text( ).
          out->write( lv_commit_reported ).
        ENDLOOP.
        out->write( 'ERROR' ).
      ENDIF.

    ENDIF.
*Response
*If the journal entry has been posted successfully, the operation returns the journal entry number, fiscal year, and company code in lt_commit_reported.
*If the journal entry could not be reversed, the operation returns the error message in ls_reported_deep.



  ENDMETHOD.
ENDCLASS.
