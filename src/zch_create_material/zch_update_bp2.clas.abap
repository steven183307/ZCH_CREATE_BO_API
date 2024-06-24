CLASS zch_update_bp2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_BP2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "BP basic data
    DATA update_bp TYPE STRUCTURE FOR UPDATE I_BusinessPartnerTP_3.
    DATA update_bp2 TYPE TABLE FOR UPDATE I_BusinessPartnerTP_3.
    "Address
    DATA update_address TYPE STRUCTURE FOR UPDATE I_BusinessPartnerAddressTP_3.
    DATA update_address2 TYPE TABLE FOR UPDATE I_BusinessPartnerAddressTP_3.
    "Address usage
    DATA update_ausage TYPE STRUCTURE FOR UPDATE I_BusinessPartnerAddrUsageTP_3.
    DATA update_ausage2 TYPE TABLE FOR UPDATE I_BusinessPartnerAddrUsageTP_3.
    "address cell phone
    DATA update_addcell TYPE STRUCTURE FOR UPDATE I_BusPartMobilePhoneNumberTP_3.
    DATA update_addcell2 TYPE TABLE FOR UPDATE I_BusPartMobilePhoneNumberTP_3.
    "address Telephone
    DATA update_addtel TYPE STRUCTURE FOR UPDATE I_BusPartTelephoneNumberTP_3.
    DATA update_addtel2 TYPE TABLE FOR UPDATE I_BusPartTelephoneNumberTP_3.
    "Email
    DATA update_email TYPE STRUCTURE FOR UPDATE I_BusPartEmailAddressTP_3.
    DATA update_email2 TYPE TABLE FOR UPDATE I_BusPartEmailAddressTP_3.
    "Role
    DATA update_role TYPE STRUCTURE FOR UPDATE I_BusinessPartnerRoleTP_3.
    DATA update_role2 TYPE TABLE FOR UPDATE I_BusinessPartnerRoleTP_3.

    update_bp = VALUE #(
          %key-BusinessPartner = 'CHASE03'
          FirstName = 'CHANGE NAME'
          Language = 'D'
          GenderCodeName = '2'
          BirthDate = '20231016'

          %control-firstname = cl_abap_behv=>flag_changed
          %control-language = cl_abap_behv=>flag_changed
          %control-GenderCodeName = cl_abap_behv=>flag_changed
          %control-BirthDate = cl_abap_behv=>flag_changed
          %is_draft = if_abap_behv=>mk-off
          ).
    APPEND update_bp TO update_bp2.
    update_bp = VALUE #(
         %key-BusinessPartner = 'CHASE04'
         FirstName = 'CHANGE NAME2'
         Language = 'D'
         GenderCodeName = '1'
         BirthDate = '20231016'

         %control-firstname = cl_abap_behv=>flag_changed
         %control-language = cl_abap_behv=>flag_changed
         %control-GenderCodeName = cl_abap_behv=>flag_changed
         %control-BirthDate = cl_abap_behv=>flag_changed
         %is_draft = if_abap_behv=>mk-off
         ).
    APPEND update_bp TO update_bp2.

    update_address = VALUE #(
         %key-BusinessPartner = 'CHASE03'
         %key-AddressNumber = '0000040790'
         StreetName = 'OMG1'
         HouseNumber = '1234'
         CityName = 'Taipei10'
         Country = 'TW'
         PostalCode = '223'
         %control-StreetName = cl_abap_behv=>flag_changed
         %control-HouseNumber = cl_abap_behv=>flag_changed
         %control-CityName = cl_abap_behv=>flag_changed
         %control-Country = cl_abap_behv=>flag_changed
         %control-PostalCode = cl_abap_behv=>flag_changed
         %is_draft = if_abap_behv=>mk-off
         ).
    APPEND update_address TO update_address2.

    update_address = VALUE #(
         %key-BusinessPartner = 'CHASE04'
         %key-AddressNumber = '0000040793'
         StreetName = 'OMG2'
         HouseNumber = '1234'
         CityName = 'Taipei10'
         Country = 'TW'
         PostalCode = '223'
         %control-StreetName = cl_abap_behv=>flag_changed
         %control-HouseNumber = cl_abap_behv=>flag_changed
         %control-CityName = cl_abap_behv=>flag_changed
         %control-Country = cl_abap_behv=>flag_changed
         %control-PostalCode = cl_abap_behv=>flag_changed
         %is_draft = if_abap_behv=>mk-off
         ).
    APPEND update_address TO update_address2.

    update_addcell = VALUE #(
          %key-BusinessPartner = 'CHASE03'
          %key-AddressNumber = '0000040790'
          %key-OrdinalNumber = '001'
          %key-Person = '0000040789'
          OrdinalNumberForEdit = '001'
          CompleteTelephoneNumber = '22001016'
          MobilePhoneNumber = '09123451016'
          MobilePhoneCountry = 'TW'
          %control-OrdinalNumberForEdit = cl_abap_behv=>flag_changed
          %control-CompleteTelephoneNumber = cl_abap_behv=>flag_changed
          %control-MobilePhoneNumber = cl_abap_behv=>flag_changed
          %control-MobilePhoneCountry = cl_abap_behv=>flag_changed
*          %is_draft = if_abap_behv=>mk-on
        ).
    APPEND update_addcell TO update_addcell2.

    update_addcell = VALUE #(
          %key-BusinessPartner = 'CHASE04'
          %key-AddressNumber = '0000040793'
          %key-OrdinalNumber = '001'
          %key-Person = '0000040792'
          OrdinalNumberForEdit = '001'
          CompleteTelephoneNumber = '22001016'
          MobilePhoneNumber = '09123451016'
          MobilePhoneCountry = 'TW'
          %control-OrdinalNumberForEdit = cl_abap_behv=>flag_changed
          %control-CompleteTelephoneNumber = cl_abap_behv=>flag_changed
          %control-MobilePhoneNumber = cl_abap_behv=>flag_changed
          %control-MobilePhoneCountry = cl_abap_behv=>flag_changed
*          %is_draft = if_abap_behv=>mk-on
        ).
    APPEND update_addcell TO update_addcell2.

    update_addtel = VALUE #(
            %key-AddressNumber = '0000040790'
            %key-BusinessPartner = 'CHASE03'
            %key-OrdinalNumber = '002'
            %key-Person = '0000040789'
            PhoneNumber = '888881016'
            DestinationLocationCountry = 'TH'
            %control-PhoneNumber = cl_abap_behv=>flag_changed
            %control-DestinationLocationCountry = cl_abap_behv=>flag_changed
             ).

    APPEND update_addtel TO update_addtel2.

    update_addtel = VALUE #(
            %key-AddressNumber = '0000040793'
            %key-BusinessPartner = 'CHASE04'
            %key-OrdinalNumber = '001'
            %key-Person = '0000040792'
            PhoneNumber = '888881016'
            DestinationLocationCountry = 'TH'
            %control-PhoneNumber = cl_abap_behv=>flag_changed
            %control-DestinationLocationCountry = cl_abap_behv=>flag_changed
             ).

    APPEND update_addtel TO update_addtel2.
    update_email = VALUE #(
            %key-AddressNumber = '0000000521'
            %key-BusinessPartner = '0001000100'
            %key-OrdinalNumber = '001'

            %key-Person = ''
            EmailAddress = 'ericyang@soetek.com.tw'
            %control-EmailAddress = cl_abap_behv=>flag_changed
            ).

    APPEND update_email TO update_email2.

*    update_email = VALUE #(
*            %key-AddressNumber = '0000040793'
*            %key-BusinessPartner = 'CHASE04'
*            %key-OrdinalNumber = '001'
*            %key-Person = '0000040792'
*            EmailAddress = 'chase1018@gmail.com'
*            %control-EmailAddress = cl_abap_behv=>flag_changed
*            ).
*
*    APPEND update_email TO update_email2.
    update_role = VALUE #(
            %key-BusinessPartner = 'CHASE03'
            %key-BusinessPartnerRole = 'FLCU01'
            ValidFrom = '20230929'
            ValidTo = '20231116'
            %control-ValidFrom = cl_abap_behv=>flag_changed
            %control-ValidTo = cl_abap_behv=>flag_changed
             ).

    APPEND update_role TO update_role2.

*        update_role = VALUE #(
*            %key-BusinessPartner = 'CHASE03'
*            %key-BusinessPartnerRole = 'CRM003'
*            ValidFrom = '20230909'
*            ValidTo = '20231128'
*            %control-ValidFrom = cl_abap_behv=>flag_changed
*            %control-ValidTo = cl_abap_behv=>flag_changed
*             ).
*
*    APPEND update_role TO update_role2.
*
    update_role = VALUE #(
            %key-BusinessPartner = 'CHASE04'
            %key-BusinessPartnerRole = 'FLCU00'
            ValidFrom = '20230919'
            ValidTo = '20231116'
            %control-ValidFrom = cl_abap_behv=>flag_changed
            %control-ValidTo = cl_abap_behv=>flag_changed
             ).

    APPEND update_role TO update_role2.


    MODIFY ENTITIES OF i_businesspartnertp_3
*    ENTITY BusinessPartner
*    UPDATE FROM update_bp2
*    ENTITY BusPartAddress
*    UPDATE FROM update_address2
**    MODIFY ENTITY i_businesspartneraddresstp_3
**    UPDATE FROM update_address2
*    ENTITY BusPartMobileNumber
*    UPDATE FROM update_addcell2
*    ENTITY BusPartPhoneNumber
*    UPDATE FROM update_addtel2
*     ENTITY BusPartEmailAddress
*     UPDATE FROM update_email2
    ENTITY BusinessPartnerRole
    UPDATE FROM update_role2

   REPORTED DATA(reported)
   FAILED DATA(failed).

    IF Failed IS NOT INITIAL.
      LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'businesspartner1 error' ).
        out->write( lv_result1 ).
      ENDLOOP.


    ELSE.
      COMMIT ENTITIES RESPONSE OF i_businesspartnertp_3
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-businesspartnerrole ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'businesspartner2 error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
