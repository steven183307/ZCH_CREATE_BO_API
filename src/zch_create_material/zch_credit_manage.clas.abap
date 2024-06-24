CLASS zch_credit_manage DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREDIT_MANAGE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA create_crdt TYPE STRUCTURE FOR CREATE I_CrdtMBusinessPartnerTP.
*    DATA create_crdt2 TYPE TABLE FOR CREATE I_CrdtMBusinessPartnerTP.
*
*    DATA create_Account TYPE STRUCTURE FOR CREATE I_CrdtMBusinessPartnerTP\_CreditMgmtAccountTP.
*    DATA create_Account2 TYPE TABLE FOR CREATE I_CrdtMBusinessPartnerTP\_CreditMgmtAccountTP.
*
*
*    create_crdt = VALUE #(
*   %cid = '01'
*   BusinessPartner = '0001000038'
*   %control-BusinessPartner = cl_abap_behv=>flag_changed
**    CrdtMgmtBusinessPartnerGroup = '0000'
**   %control-CrdtMgmtBusinessPartnerGroup = cl_abap_behv=>flag_changed
*   CreditRiskClass = 'C'
*   %control-CreditRiskClass = cl_abap_behv=>flag_changed
**   CreditRiskClassLastChangeDate = '20230927'
**   %control-CreditRiskClassLastChangeDate = cl_abap_behv=>flag_changed
*   CreditCheckRule = '01'
*   %control-CreditCheckRule = cl_abap_behv=>flag_changed
*   CreditScoreAndLimitCalcRule = 'STANDARD'
*   %control-CreditScoreAndLimitCalcRule = cl_abap_behv=>flag_changed
*
*     ).
*    APPEND create_crdt  TO create_crdt2 .
*
*    create_Account = VALUE #(
*                         %cid_ref = '01'
*                         BusinessPartner = '1000028'
*
*                         %target = VALUE #( (  %cid = '11'
*                                               BusinessPartner = '1000028'
*                                               CreditSegment = '0000'
*
*                                               CreditLimitAmount = '5.00'
*
*                                                           %control = VALUE #(
*                                                            BusinessPartner = cl_abap_behv=>flag_changed
*                                                            CreditSegment = cl_abap_behv=>flag_changed
*
*                                                            CreditLimitAmount = cl_abap_behv=>flag_changed
*
*                                                             )
*                                     ) )
*     ).
*    APPEND create_Account  TO create_Account2 .
    DATA ls_credt_create TYPE STRUCTURE FOR CREATE I_CrdtMBusinessPartnerTP.
    DATA lt_credt_create TYPE TABLE FOR CREATE I_CrdtMBusinessPartnerTP.

    DATA ls_Account_create TYPE STRUCTURE FOR CREATE I_CrdtMBusinessPartnerTP\_CreditMgmtAccountTP.
    DATA lt_Account_create TYPE TABLE FOR CREATE I_CrdtMBusinessPartnerTP\_CreditMgmtAccountTP.


    ls_credt_create = VALUE #(
                               %cid = '01'
                               BusinessPartner = 'ZNE_004'
                               CreditRiskClass = 'C'
                               CreditCheckRule = '01'
                               CreditScoreAndLimitCalcRule = 'STANDARD'
           %control = VALUE #(
                               BusinessPartner             = cl_abap_behv=>flag_changed
                               CreditRiskClass             = cl_abap_behv=>flag_changed
                               CreditCheckRule             = cl_abap_behv=>flag_changed
                               CreditScoreAndLimitCalcRule = cl_abap_behv=>flag_changed
                        ) ).
    APPEND ls_credt_create  TO lt_credt_create .

    ls_Account_create = VALUE #(
                                 %cid_ref = '01'
                                 BusinessPartner = 'ZNE_004'
              %target = VALUE #( (
                                   %cid = '11'
                                   %key-BusinessPartner = 'ZNE_004'
                                   %key-CreditSegment = '1000'
                                   CreditLimitAmount = '5.00'
                                   CreditLimitCalculatedAmount = '9.00'
              %control = VALUE #(
                                  CreditLimitAmount = cl_abap_behv=>flag_changed
                                  CreditLimitCalculatedAmount = cl_abap_behv=>flag_changed
                                 ) ) ) ).
    APPEND ls_Account_create  TO lt_Account_create .

    MODIFY ENTITIES OF I_CrdtMBusinessPartnerTP
    ENTITY CreditMgmtBusinessPartner
    CREATE FROM lt_credt_create

    CREATE BY \_CreditMgmtAccountTP
    FROM lt_Account_create
*    CREATE BY \_CreditMgmtAccountTP AUTO FILL CID
**    FROM create_account2
*        WITH VALUE #( ( %key = VALUE #( businesspartner = '0001000038' )
*            %target = VALUE #( ( %key = VALUE #( businesspartner = '0001000038'
*                                                 creditsegment = '0000' )
*                                 creditlimitamount = '5.00'
*
*                                ) )
*                             ) )
   MAPPED DATA(mapped)
     REPORTED DATA(reported)
     FAILED DATA(failed).


    IF failed IS NOT INITIAL.
      LOOP AT reported-creditmgmtbusinesspartner  ASSIGNING FIELD-SYMBOL(<ls_BP>).
        DATA(lv_BP) = <ls_BP>-%msg->if_message~get_text( ).
        out->write( 'BP Error' ).
        out->write( lv_BP ) .
      ENDLOOP.
      LOOP AT reported-creditmanagementaccount  ASSIGNING FIELD-SYMBOL(<ls_account>).
        DATA(lv_account) = <ls_account>-%msg->if_message~get_text( ).
        out->write( 'account Error' ).
        out->write( lv_account ) .
      ENDLOOP.
      out->write( 'failed IS NOT INITIAL' ).

    ELSE.
      COMMIT ENTITIES
     RESPONSE OF I_CrdtMBusinessPartnerTP
         FAILED DATA(failed_commit)
         REPORTED DATA(reported_commit).
      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-creditmgmtbusinesspartner  ASSIGNING FIELD-SYMBOL(<ls_BP_F>).
          DATA(lv_BP_F) = <ls_BP_F>-%msg->if_message~get_text( ).
          out->write( 'BP COMMIT Error' ).
          out->write( lv_BP_F ).
        ENDLOOP.
        LOOP AT reported_commit-creditmanagementaccount  ASSIGNING FIELD-SYMBOL(<ls_account_F>).
          DATA(lv_account_F) = <ls_account_F>-%msg->if_message~get_text( ).
          out->write( 'account COMMIT Error' ).
          out->write( lv_account_F ).
        ENDLOOP.
        out->write( 'failed_commit Error' ).
      ELSE.
        out->write( 'SUCCESS' ).
      ENDIF.
*            COMMIT ENTITIES END.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
