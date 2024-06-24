CLASS zch_create_customer3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_CUSTOMER3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    READ ENTITIES OF i_businesspartnertp_3 ENTITY businesspartner
  ALL FIELDS WITH VALUE #(
  (
  businesspartner = 'CHASE02'
  )
  (
  businesspartner = 'CHASE01'
  )
   ) RESULT DATA(partner).
    DATA update_supplier TYPE STRUCTURE FOR CREATE  i_businesspartnertp_3\_BusinessPartnerRole.
    DATA update_supplier1 TYPE TABLE FOR CREATE  i_businesspartnertp_3\_BusinessPartnerRole.
    DATA l.

    LOOP AT partner ASSIGNING FIELD-SYMBOL(<fs_partner>).
     l = l + 1 .
*    update_supplier = VALUE #(
* %key-BusinessPartner = <fs_partner>-BusinessPartner
*
*        %target = VALUE #( (
*              %cid = l
*              BusinessPartner = <fs_partner>-BusinessPartner
*              BusinessPartnerRole = 'FLCU01'
*              ValidFrom = '20230919'
*              ValidTo = '99991230'  )  ) ) .
*
*    APPEND update_supplier TO update_supplier1.
*


     MODIFY ENTITY i_businesspartnertp_3
     CREATE BY \_BusinessPartnerRole
*     FROM update_supplier1
           FIELDS ( BusinessPartner BusinessPartnerRole ValidFrom ) WITH VALUE #(
           (
             %key-BusinessPartner = <fs_partner>-BusinessPartner
             %target = VALUE #( (
              %cid = l
              BusinessPartner = <fs_partner>-BusinessPartner
              BusinessPartnerRole = 'FLCU01'
              ValidFrom = '20230919'
              ValidTo = '99991230'
           ) ) )
           )

*            MAPPED DATA(mapped)
            REPORTED DATA(reported)
            FAILED DATA(failed).

  ENDLOOP.


      IF failed IS NOT INITIAL.

        LOOP AT reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<fs_bp_mapped2>).
          DATA(lv_result7) = <fs_bp_mapped2>-%msg->if_message~get_text(  ).
          out->write( lv_result7 ).
        ENDLOOP.

        out->write( 'failed IS NOT INITIAL' ).
      ELSE.
        COMMIT ENTITIES
       RESPONSE OF i_businesspartnertp_3
       FAILED DATA(failed_commit)
       REPORTED DATA(reported_commit)
       .

        IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-businesspartnerrole ASSIGNING FIELD-SYMBOL(<fs_rp>).
        DATA(lv_rp) = <fs_rp>-%msg->if_message~get_text(  ).
        out->write( lv_rp ).
        ENDLOOP.
          out->write( 'failed_commit Error' ).

        ELSE.

          out->write( 'SUCCESS' ).
        ENDIF.

*CLEAr: failed_commit ,reported_commit ,mapped,reported, failed.
      ENDIF.

  ENDMETHOD.
ENDCLASS.
