CLASS zch_fi_post_vendor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_FI_POST_VENDOR IMPLEMENTATION.


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

    companycode = '6310' " Success
    documentreferenceid = 'BKPFF'
    createdbyuser = 'CB9980000038'
    businesstransactiontype = 'RFBU'
    accountingdocumenttype = 'KZ'
    documentdate = sy-datlo
    postingdate = sy-datlo
    accountingdocumentheadertext = 'TEST rules'

        _glitems = VALUE #(
    ( glaccountlineitem = |001|
      glaccount = '0011008000'

      HouseBank = 'TWDP1'
      HouseBankAccount = 'TWDPA'
      ValueDate = sy-datlo

      _currencyamount = VALUE #( ( currencyrole = '00'
                                   journalentryitemamount = '-26,250'
                                   currency = 'TWD' ) ) ) )




      _apitems = VALUE #(
          ( glaccountlineitem = |002|
           Supplier = '0063100088'
            GLAccount = '5100000024'
            _currencyamount = VALUE #(  (  currencyrole = '00'
                                       journalentryitemamount = '26,250'
                                       currency = 'TWD'

                                       ) ) ) )

    ).
*    _glitems = VALUE #(
*    ( glaccountlineitem = |001|
*      glaccount = '0010010000'
*      _currencyamount = VALUE #( ( currencyrole = '00'
*                                   journalentryitemamount = '-100'
*                                   currency = 'TWD' ) ) )
*    ( glaccountlineitem = |002|
*      glaccount = '0021100000'
*      _currencyamount = VALUE #( ( currencyrole = '00'
*
*                                   journalentryitemamount = '-26,250'
*                                   currency = 'TWD'
*
*                                   ) )
*      _profitabilitysupplement = VALUE #( Customer = '0063100088'
*
*                                           )
*                                   )
*    ( glaccountlineitem = |002|
*      glaccount = '0010010000'
*      _currencyamount = VALUE #( ( currencyrole = '00'
*                                   journalentryitemamount = '100'
*                                   currency = 'TWD' ) ) ) )
*    ).
*    PostingFiscalPeriod = '25'？
*    _onetimecustomersupplier = VALUE #(
*    BankAccount = ''
*    BankNumber = ''
*    AccountTaxType = ''
*
*
*     )
*    _apitems = VALUE #(
*
*    ( glaccountlineitem = |002|
*      GLAccount = '5100000000'
*      Supplier = '1000010'
*
*      _currencyamount = VALUE #( ( currencyrole = '00'
*
*                                   journalentryitemamount = '-10,500'
*                                   currency = 'TWD' ) )
*    )
*
*    )

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
  ENDMETHOD.
ENDCLASS.
