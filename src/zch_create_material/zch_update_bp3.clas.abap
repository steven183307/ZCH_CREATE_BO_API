CLASS zch_update_bp3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_BP3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "BP basic data
    DATA update_bp TYPE STRUCTURE FOR UPDATE I_BusinessPartnerTP_3.
    DATA update_bp2 TYPE TABLE FOR UPDATE I_BusinessPartnerTP_3.
    "Email
    DATA update_email TYPE STRUCTURE FOR UPDATE I_BusPartEmailAddressTP_3.
    DATA update_email2 TYPE TABLE FOR UPDATE I_BusPartEmailAddressTP_3.
    "Role
    DATA update_role TYPE STRUCTURE FOR UPDATE I_BusinessPartnerRoleTP_3.
    DATA update_role2 TYPE TABLE FOR UPDATE I_BusinessPartnerRoleTP_3.

    update_bp = VALUE #(
          %key-BusinessPartner = 'CHASE03'

          ).
    APPEND update_bp TO update_bp2.
    update_bp = VALUE #(
         %key-BusinessPartner = 'CHASE04'
         ).
    APPEND update_bp TO update_bp2.

*    update_email = VALUE #(
*            %key-AddressNumber = '0000000521'
*            %key-BusinessPartner = '0001000100'
*            %key-OrdinalNumber = '001'
*
*            %key-Person = ''
*            EmailAddress = 'ericyang@soetek.com.tw'
*            %control-EmailAddress = cl_abap_behv=>flag_changed
*            ).
*
*    APPEND update_email TO update_email2.
*
**    update_email = VALUE #(
**            %key-AddressNumber = '0000040793'
**            %key-BusinessPartner = 'CHASE04'
**            %key-OrdinalNumber = '001'
**            %key-Person = '0000040792'
**            EmailAddress = 'chase1018@gmail.com'
**            %control-EmailAddress = cl_abap_behv=>flag_changed
**            ).
**
**    APPEND update_email TO update_email2.
*    update_role = VALUE #(
*            %key-BusinessPartner = 'CHASE03'
*            %key-BusinessPartnerRole = 'FLCU01'
*            ValidFrom = '20230929'
*            ValidTo = '20231116'
*            %control-ValidFrom = cl_abap_behv=>flag_changed
*            %control-ValidTo = cl_abap_behv=>flag_changed
*             ).
*
*    APPEND update_role TO update_role2.
*
**        update_role = VALUE #(
**            %key-BusinessPartner = 'CHASE03'
**            %key-BusinessPartnerRole = 'CRM003'
**            ValidFrom = '20230909'
**            ValidTo = '20231128'
**            %control-ValidFrom = cl_abap_behv=>flag_changed
**            %control-ValidTo = cl_abap_behv=>flag_changed
**             ).
**
**    APPEND update_role TO update_role2.
**
*    update_role = VALUE #(
*            %key-BusinessPartner = 'CHASE04'
*            %key-BusinessPartnerRole = 'FLCU00'
*            ValidFrom = '20230919'
*            ValidTo = '20231116'
*            %control-ValidFrom = cl_abap_behv=>flag_changed
*            %control-ValidTo = cl_abap_behv=>flag_changed
*             ).
*
*    APPEND update_role TO update_role2.
READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner
ALL FIELDS WITH VALUE #( (
businesspartner = 'CHASE03'
)
(
businesspartner = 'CHASE04'
) ) RESULT DATA(partner).

READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner BY \_businesspartnerrole
ALL FIELDS WITH VALUE #( (
 %tky = partner[ 1 ]-%tky
 )
 (
 %tky = partner[ 2 ]-%tky
 )
 )
 RESULT DATA(curr_role).

 LOOP AT curr_role ASSIGNING FIELD-SYMBOL(<updated_role>).
 if <updated_role>-%tky-BusinessPartnerRole = 'CRM003'.
 <updated_role>-%is_draft = if_abap_behv=>mk-off.
 <updated_role>-validfrom = '20220129'.
 <updated_role>-validto = '20240929'.

 MODIFY ENTITY i_businesspartnerroletp_3
UPDATE FROM VALUE #( ( VALUE #(
 %data-validto = <updated_role>-validto
 %data-validfrom = <updated_role>-validfrom
 %control-validto = cl_abap_behv=>flag_changed
 %control-validfrom = cl_abap_behv=>flag_changed
 %is_draft = if_abap_behv=>mk-off

 %tky = CORRESPONDING #( <updated_role>-%tky )
 ) ) ) REPORTED DATA(reported) FAILED DATA(failed).

            COMMIT ENTITIES RESPONSE OF i_businesspartnertp_3
        FAILED DATA(failed_commit)
        REPORTED DATA(reported_commit).
    ENDIF.

ENDLOOP.

*    LOOP AT update_bp2 ASSIGNING FIELD-SYMBOL(<ls_g>).
*
*      IF <ls_g>-BusinessPartner = 'CHASE03'.
*
**        update_email = VALUE #(
**            %key-AddressNumber = '0000040790'
**            %key-BusinessPartner = 'CHASE03'
**            %key-OrdinalNumber = '001'
**            %key-Person = '0000040789'
**            EmailAddress = 'chase1118@gmail.com'
**            %control-EmailAddress = cl_abap_behv=>flag_changed
**            ).
**
**        APPEND update_email TO update_email2.
*        update_role = VALUE #(
*            %key-BusinessPartner = 'CHASE03'
*            %key-BusinessPartnerRole = 'FLCU01'
*            ValidFrom = '20230909'
*            ValidTo = '20281116'
*            %control-ValidFrom = cl_abap_behv=>flag_changed
*            %control-ValidTo = cl_abap_behv=>flag_changed
*             ).
*
*        APPEND update_role TO update_role2.
**
**        update_role = VALUE #(
**            %key-BusinessPartner = 'CHASE03'
**            %key-BusinessPartnerRole = 'CRM003'
**            ValidFrom = '20220909'
**            ValidTo = '20241228'
**            %control-ValidFrom = cl_abap_behv=>flag_changed
**            %control-ValidTo = cl_abap_behv=>flag_changed
**             ).
**
**        APPEND update_role TO update_role2.
*      ELSE.
*
*        update_role = VALUE #(
*            %key-BusinessPartner = 'CHASE04'
*            %key-BusinessPartnerRole = 'FLCU00'
*            ValidFrom = '20220909'
*            ValidTo = '20281116'
*            %control-ValidFrom = cl_abap_behv=>flag_changed
*            %control-ValidTo = cl_abap_behv=>flag_changed
*             ).
*
*        APPEND update_role TO update_role2.
**        update_email = VALUE #(
**                %key-AddressNumber = '0000040793'
**                %key-BusinessPartner = 'CHASE04'
**                %key-OrdinalNumber = '001'
**                %key-Person = '0000040792'
**                EmailAddress = 'chase1218@gmail.com'
**                %control-EmailAddress = cl_abap_behv=>flag_changed
**                ).
**
**        APPEND update_email TO update_email2.
*      ENDIF.
*
*      MODIFY ENTITIES OF i_businesspartnertp_3
**       ENTITY BusPartEmailAddress
**       UPDATE FROM update_email2
*      ENTITY BusinessPartnerRole
*      UPDATE FROM update_role2
*
*     REPORTED DATA(reported)
*     FAILED DATA(failed).

*      IF Failed IS NOT INITIAL.
*        LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
*          DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
*          out->write( 'businesspartner1 error' ).
*          out->write( lv_result1 ).
*        ENDLOOP.
*        LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<lt_proudct3>).
*          DATA(lv_result3) = <lt_proudct3>-%msg->if_message~get_text( ).
*          out->write( 'businesspartner3 error' ).
*          out->write( lv_result3 ).
*        ENDLOOP.
*
*        ELSE.



        IF failed_commit IS NOT INITIAL.
          LOOP AT reported_commit-businesspartnerrole ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
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

*       ENDIF.
*      CLEAR: update_email2 , update_role2 , reported , failed ,failed_commit
*        ,reported_commit.
*
*    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
