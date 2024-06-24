CLASS zch_create_bom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_BOM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA:

      create_BOM_headers TYPE TABLE FOR CREATE I_BillOfMaterialTP_2,

      create_BOM_header  TYPE STRUCTURE FOR CREATE I_BillOfMaterialTP_2.





    create_BOM_header = VALUE #(

     %cid                    = '123'

     Material = 'SG30'

*     BillOFMaterialVariant = '01'

     BillOfMaterialVariantUsage = '1'

*     Plant = '1000'

     BillOfMaterialCategory = 'M'



           %control = VALUE #( Material                   = cl_abap_behv=>flag_changed

                               BillOFMaterialVariant      = cl_abap_behv=>flag_changed

                               BillOfMaterialVariantUsage = cl_abap_behv=>flag_changed

                               Plant                      = cl_abap_behv=>flag_changed

                               BillOfMaterialCategory     = cl_abap_behv=>flag_changed

                               )

                               ).



    APPEND create_BOM_header TO create_BOM_headers.
        create_BOM_header = VALUE #(

     %cid                    = '1234'

     Material = 'SG24'

*     BillOFMaterialVariant = '01'

     BillOfMaterialVariantUsage = '1'

*     Plant = ''

     BillOfMaterialCategory = 'M'



           %control = VALUE #( Material                   = cl_abap_behv=>flag_changed

                               BillOFMaterialVariant      = cl_abap_behv=>flag_changed

                               BillOfMaterialVariantUsage = cl_abap_behv=>flag_changed

                               Plant                      = cl_abap_behv=>flag_changed

                               BillOfMaterialCategory     = cl_abap_behv=>flag_changed

                               )

                               ).



    APPEND create_BOM_header TO create_BOM_headers.
    MODIFY ENTITIES OF i_billofmaterialtp_2
     ENTITY BillOfMaterial
     CREATE FROM create_BOM_headers
*     SET FIELDS WITH VALUE
*     #(

*     (
**     Material = '10000005'
**     BillOFMaterialVariant = '01'
***     BillOfMaterialVariantUsage = '1'
**     Plant = '1000'
**     BillOfMaterialCategory = 'M'
**
**     )
*
* )

     MAPPED DATA(ls_mapped)
     FAILED DATA(ls_failed)
     REPORTED DATA(ls_reported).

    IF ls_failed IS NOT INITIAL.

      LOOP AT ls_reported-billofmaterial ASSIGNING FIELD-SYMBOL(<ls_po_reported>).
        DATA(lv_result) = <ls_po_reported>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error1' ).
        out->write( lv_result ).
      ENDLOOP.

    ELSE.
      COMMIT ENTITIES BEGIN
      RESPONSE OF i_billofmaterialtp_2
      FAILED DATA(ls_save_failed)
      REPORTED DATA(ls_save_reported).

      IF ls_save_failed IS NOT INITIAL.

        LOOP AT ls_save_reported-billofmaterial ASSIGNING FIELD-SYMBOL(<fs_po_mapped2>).
          DATA(lv_result3) = <fs_po_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.

      ELSE.
        LOOP AT ls_mapped-billofmaterial ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
*          CONVERT KEY OF I_ProductTP_2 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
*          out->write( 'Purchase Order:'  && ls_po_key-PurchaseOrder ).

        ENDLOOP.
        out->write( 'SUCCESS' ).
      ENDIF.


      COMMIT ENTITIES END.

    ENDIF.





  ENDMETHOD.
ENDCLASS.
