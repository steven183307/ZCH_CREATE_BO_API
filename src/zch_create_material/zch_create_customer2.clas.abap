CLASS zch_create_customer2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_CUSTOMER2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     MODIFY ENTITIES OF i_businesspartnertp_3
     ENTITY businesspartner
     CREATE FIELDS ( BusinessPartner CorrespondenceLanguage BusinessPartnerCategory LastName ) WITH VALUE #(
     ( %cid = 'bp1'
       BusinessPartner ='CHASE118'
       CorrespondenceLanguage = 'M'
       %is_draft = if_abap_behv=>mk-off
       BusinessPartnerCategory = '1'
       LastName = 'CHASE10'
       %control-BusinessPartnerCategory = if_abap_behv=>mk-on
       %control-CorrespondenceLanguage = if_abap_behv=>mk-on
       %control-lastname = if_abap_behv=>mk-on )
     ( %cid = 'bp2'
       BusinessPartner ='CHASE119'
       %is_draft = if_abap_behv=>mk-off
       CorrespondenceLanguage = 'M'
       BusinessPartnerCategory = '1'
       LastName = 'CHASE11'
       %control-BusinessPartnerCategory = if_abap_behv=>mk-on
       %control-CorrespondenceLanguage = if_abap_behv=>mk-on
       %control-lastname = if_abap_behv=>mk-on )
      )

     CREATE BY  \_businesspartneraddress
     FIELDS ( country cityname ) WITH VALUE #(
      (
     %cid_ref = 'bp1'

     %target = VALUE #(
     (
     %cid = 'bp1_1'
     country = 'IN'
     cityname = 'TEST07'

     )
     )
     )
     (
     %cid_ref = 'bp2'
     %target = VALUE #(
     (
     %cid = 'bp2_1'
     country = 'TD'
     cityname = 'AAA' ) ) )
     )
     CREATE BY \_BusinessPartnerRole
     SET FIELDS WITH VALUE #(

     (  %cid_ref = 'bp1'
*        %key-BusinessPartner = 'CHASE118'

        %target = VALUE #( (
        %cid = '9'
*        BusinessPartner = 'CHASE118'
        BusinessPartnerRole = 'FLCU00'
        ValidFrom = '20230919'
        ValidTo = '99991230'
     ) ) )

     (  %cid_ref = 'bp2'
*        %key-BusinessPartner = 'CHASE119'

        %target = VALUE #( (
        %cid = '10'
*        BusinessPartner = 'CHASE119'
        BusinessPartnerRole = 'FLCU01'
        ValidFrom = '20230919'
        ValidTo = '99991230'
     ) ) )

     )
      MAPPED DATA(mapped)
      REPORTED DATA(reported)
      FAILED DATA(failed).

    IF failed IS NOT INITIAL.
     LOOP AT reported-businesspartner ASSIGNING FIELD-SYMBOL(<fs_bp_mapped>).
        DATA(lv_result5) = <fs_bp_mapped>-%msg->if_message~get_text(  ).
        out->write( lv_result5 ).
      ENDLOOP.
      LOOP AT reported-buspartaddress ASSIGNING FIELD-SYMBOL(<fs_bp_mapped1>).
        DATA(lv_result6) = <fs_bp_mapped1>-%msg->if_message~get_text(  ).
        out->write( lv_result6 ).
      ENDLOOP.
      LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<fs_bp_mapped2>).
        DATA(lv_result7) = <fs_bp_mapped2>-%msg->if_message~get_text(  ).
        out->write( lv_result7 ).
      ENDLOOP.

      out->write( 'failed IS NOT INITIAL' ).
    ELSE.
      COMMIT ENTITIES
     RESPONSE OF i_businesspartnertp_3
     FAILED DATA(failed_commit)
     REPORTED DATA(reported_commit).


      IF failed_commit IS NOT INITIAL.
        out->write( 'failed_commit Error' ).
        LOOP AT reported_commit-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped2>).
          DATA(lv_result3) = <fs_po_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.

      ELSE.
        LOOP AT mapped-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).

*          CONVERT KEY OF i_businesspartnertp_3 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
*          out->write( 'BusinessPartner:'  && ls_po_key-BusinessPartner ).

        ENDLOOP.
        out->write( 'SUCCESS' ).
      ENDIF.

*            COMMIT ENTITIES END.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
