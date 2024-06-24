CLASS zch_update_bom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_BOM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "BOM Basic data
    DATA update_bom TYPE STRUCTURE FOR UPDATE I_BillOfMaterialTP_2.
    DATA update_bom2 TYPE TABLE FOR UPDATE I_BillOfMaterialTP_2.
    "BOM item data
    DATA update_item TYPE STRUCTURE FOR UPDATE I_BillOfMaterialItemTP_2.
    DATA update_item2 TYPE TABLE FOR UPDATE I_BillOfMaterialItemTP_2.

    update_bom = VALUE #(
            %key-BillOfMaterial = '00000067'
            %key-BillOfMaterialCategory = 'M'
            %key-BillOfMaterialVariant = '01'
*            %key-BillOfMaterialVersion = ''
*            %key-EngineeringChangeDocument = ''
            %key-Material = 'SG30'
            %key-Plant = '1310'
            BOMGroup = 'A'
*            BOMHeaderBaseUnit = 'EA'
            BOMHeaderQuantityInBaseUnit = '100'
            BOMHeaderText = 'TEST'
            %control-BOMGroup =  cl_abap_behv=>flag_changed
*            %control-BOMHeaderBaseUnit =  cl_abap_behv=>flag_changed
            %control-BOMHeaderQuantityInBaseUnit =  cl_abap_behv=>flag_changed
            %control-BOMHeaderText =  cl_abap_behv=>flag_changed
            ).

    APPEND update_bom TO update_bom2.

    update_item = VALUE #(
            %key-BillOfMaterial = '00000067'
            %key-BillOfMaterialCategory = 'M'
            %key-BillOfMaterialVariant = '01'
*            %key-BillOfMaterialVersion = ''
            %key-BillOfMaterialItemNodeNumber = '00000001'
            %key-Material = 'SG30'
            %key-Plant = '1310'
            BillOfMaterialComponent = 'RM128'
            BillOfMaterialItemQuantity = '10'
            %control-BillOfMaterialComponent =  cl_abap_behv=>flag_changed
            %control-BillOfMaterialItemQuantity =  cl_abap_behv=>flag_changed
             ).

    APPEND update_item TO update_item2.

    MODIFY ENTITIES OF i_billofmaterialtp_2
*    ENTITY BillOfMaterial
*    UPDATE FROM update_bom2
    ENTITY BillOfMaterialItem
    UPDATE FROM update_item2

     MAPPED DATA(mapped)
   FAILED DATA(failed)
   REPORTED DATA(reported).

    IF Failed IS NOT INITIAL.
      LOOP AT reported-billofmaterialitem ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'BOM1 error' ).
        out->write( lv_result1 ).
      ENDLOOP.


    ELSE.
      COMMIT ENTITIES RESPONSE OF i_billofmaterialtp_2
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-billofmaterialitem ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'BOM2 error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
