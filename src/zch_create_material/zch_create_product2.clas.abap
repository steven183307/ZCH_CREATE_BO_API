CLASS zch_create_product2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_PRODUCT2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_product TYPE TABLE FOR CREATE I_ProductTP_2.
    DATA create_product TYPE TABLE FOR CREATE I_ProductTP_2.
    DATA create_productdescription TYPE STRUCTURE FOR CREATE  I_ProductTP_2\_ProductDescription.
    DATA create_productdescription2 TYPE TABLE FOR CREATE  I_ProductTP_2\_ProductDescription.

    create_product = VALUE #(
    (
    %cid = '06'
    Product =  'PRODUCT1016'
      )
        (
    %cid = '05'
    Product =  'PRODUCT1017'
      )  ).


    LOOP AT  create_product ASSIGNING FIELD-SYMBOL(<ls_pro>).
      CLEAR: create_productdescription2 , lt_product.
      IF <ls_pro>-Product = 'PRODUCT1016'.
        lt_product = VALUE #( (
  %cid = '01'
  Product =  'PRODUCT1016'
  %control-Product = cl_abap_behv=>flag_changed
  ProductType = 'ROH'
  %control-ProductType = cl_abap_behv=>flag_changed

  IndustrySector = 'M'
  %control-IndustrySector = cl_abap_behv=>flag_changed
  GrossWeight = '0.500'
  %control-GrossWeight = cl_abap_behv=>flag_changed
  WeightUnit = 'KG'
  %control-WeightUnit = cl_abap_behv=>flag_changed
  ProductGroup = 'L002'
  %control-ProductGroup = cl_abap_behv=>flag_changed
  BaseUnit = 'EA'
  %control-BaseUnit = cl_abap_behv=>flag_changed
  ItemCategoryGroup = 'NORM'
  %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
  NetWeight = '1'
  %control-NetWeight = cl_abap_behv=>flag_changed
  Division = '00'
  %control-Division = cl_abap_behv=>flag_changed
    ) ).

        create_productdescription  = VALUE #( %cid_ref = '01'
                                     Product = 'PRODUCT1016'
                                    %target = VALUE #( (  %cid = '04'
                                                          Product = 'PRODUCT1016'
                                                          Language = 'W'
                                                          ProductDescription = 'TEST'
                                                           %control = VALUE #(
                                                           Language =  cl_abap_behv=>flag_changed
                                                           ProductDescription =  cl_abap_behv=>flag_changed
                                                           ) ) ) ).
        APPEND create_productdescription  TO create_productdescription2 .
      ELSE.
        lt_product = VALUE #( (
       %cid = '02'
       Product =  'PRODUCT1017'
       %control-Product = cl_abap_behv=>flag_changed
       ProductType = 'ROH'
       %control-ProductType = cl_abap_behv=>flag_changed

       IndustrySector = 'M'
       %control-IndustrySector = cl_abap_behv=>flag_changed
       GrossWeight = '0.500'
       %control-GrossWeight = cl_abap_behv=>flag_changed
       WeightUnit = 'KG'
       %control-WeightUnit = cl_abap_behv=>flag_changed
       ProductGroup = 'L002'
       %control-ProductGroup = cl_abap_behv=>flag_changed
       BaseUnit = 'EA'
       %control-BaseUnit = cl_abap_behv=>flag_changed
       ItemCategoryGroup = 'NORM'
       %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
       NetWeight = '0.450'
       %control-NetWeight = cl_abap_behv=>flag_changed
       Division = '00'
       %control-Division = cl_abap_behv=>flag_changed
         ) ).

        create_productdescription  = VALUE #( %cid_ref = '02'
                                 Product = 'PRODUCT1017'
                                %target = VALUE #( (  %cid = '04'
                                                      Product = 'PRODUCT1017'
                                                      Language = 'W'
                                                      ProductDescription = 'TEST'
                                                       %control = VALUE #(
                                                       Language =  cl_abap_behv=>flag_changed
                                                       ProductDescription =  cl_abap_behv=>flag_changed
                                                       ) ) ) ).
        APPEND create_productdescription  TO create_productdescription2 .
      ENDIF.

      MODIFY ENTITIES OF I_ProductTP_2
      ENTITY Product
      CREATE FROM lt_product
      CREATE BY \_ProductDescription
      FROM create_productdescription2


       MAPPED DATA(mapped)
       REPORTED DATA(reported)
       FAILED DATA(failed).

      IF failed IS NOT INITIAL.
        LOOP AT reported-product  ASSIGNING FIELD-SYMBOL(<ls_po_reported>).
          DATA(lv_result) = <ls_po_reported>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error1' ).
          out->write( lv_result ).
        ENDLOOP.

        LOOP AT reported-productdescription  ASSIGNING FIELD-SYMBOL(<ls_po_reported7>).
          DATA(lv_result7) = <ls_po_reported7>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error7' ).
          out->write( lv_result7 ) .
        ENDLOOP.

        out->write( 'failed IS NOT INITIAL' ).
      ELSE.

        COMMIT ENTITIES
           RESPONSE OF I_ProductTP_2
               FAILED DATA(failed_commit)
               REPORTED DATA(reported_commit).

        IF failed_commit IS NOT INITIAL.
          LOOP AT reported_commit-product  ASSIGNING FIELD-SYMBOL(<ls_po_reported4>).
            DATA(lv_result4) = <ls_po_reported4>-%msg->if_message~get_text( ).
            out->write( 'EML PO Error4' ).
            out->write( lv_result4 ).
          ENDLOOP.

          LOOP AT reported_commit-productdescription  ASSIGNING FIELD-SYMBOL(<ls_po_reported6>).
            DATA(lv_result6) = <ls_po_reported6>-%msg->if_message~get_text( ).
            out->write( 'EML PO Error6' ).
            out->write( lv_result6 ).
          ENDLOOP.

          out->write( 'failed_commit Error' ).
        ELSE.
          out->write( 'SUCCESS' ).
        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
