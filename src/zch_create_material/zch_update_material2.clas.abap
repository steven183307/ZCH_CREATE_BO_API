CLASS zch_update_material2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_MATERIAL2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Basic
    DATA update_product TYPE TABLE FOR UPDATE I_ProductTP_2.
    DATA update_product1 TYPE STRUCTURE FOR UPDATE I_ProductTP_2.
    "description
    DATA update_productdescription TYPE STRUCTURE FOR UPDATE  I_ProductDescriptionTP_2.
    DATA update_productdescription2 TYPE TABLE FOR UPDATE  I_ProductDescriptionTP_2.
    "Base Unit of Measure
    DATA update_unit TYPE STRUCTURE FOR UPDATE I_ProductUnitOfMeasureTP_2.
    DATA update_unit2 TYPE TABLE FOR UPDATE I_ProductUnitOfMeasureTP_2.
    "Base Unit of Measure-item
    DATA create_unit_item TYPE STRUCTURE FOR CREATE I_ProductUnitOfMeasureTP_2\_ProductUnitOfMeasureEAN.
    DATA create_unit_item2 TYPE TABLE FOR CREATE I_ProductUnitOfMeasureTP_2\_ProductUnitOfMeasureEAN.
    "Storage
    DATA update_Storage TYPE STRUCTURE FOR UPDATE I_ProductStorageTP_2.
    DATA update_Storage2 TYPE TABLE FOR UPDATE I_ProductStorageTP_2.
    "sales
    DATA update_sales TYPE STRUCTURE FOR UPDATE I_ProductSalesTP_2.
    DATA update_sales2 TYPE TABLE FOR UPDATE I_ProductSalesTP_2.
    "plant
    DATA update_plant TYPE STRUCTURE FOR UPDATE I_ProductPlantTP_2.
    DATA update_plant2 TYPE TABLE FOR UPDATE I_ProductPlantTP_2.
    "PlantMRP
    DATA create_PlantMRP TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.
    DATA create_plantmrp2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.
    "Valuation Areas
    DATA update_varea TYPE STRUCTURE FOR UPDATE I_ProductValuationTP_2.
    DATA update_varea2 TYPE TABLE FOR UPDATE I_ProductValuationTP_2.
    "Distribution Chain
    DATA update_delivery TYPE STRUCTURE FOR UPDATE I_ProductSalesDeliveryTP_2.
    DATA update_delivery2 TYPE TABLE FOR UPDATE I_ProductSalesDeliveryTP_2.
        update_product1 = VALUE #(
            %key-Product = 'MATERIAL9519'
            Division = '00'
            ItemCategoryGroup = '0002'
            CrossPlantStatus = '01'
            LaboratoryOrDesignOffice = '001'
            %control-Division = cl_abap_behv=>flag_changed
            %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
            %control-CrossPlantStatus = cl_abap_behv=>flag_changed
            %control-LaboratoryOrDesignOffice = cl_abap_behv=>flag_changed

    ).
    APPEND update_product1 TO update_product.
        update_product1 = VALUE #(
            %key-Product = 'MATERIAL9520'
            Division = '00'
            ItemCategoryGroup = '0002'
            CrossPlantStatus = '01'
            LaboratoryOrDesignOffice = '001'
            %control-Division = cl_abap_behv=>flag_changed
            %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
            %control-CrossPlantStatus = cl_abap_behv=>flag_changed
            %control-LaboratoryOrDesignOffice = cl_abap_behv=>flag_changed

    ).
    APPEND update_product1 TO update_product.


    update_productdescription = VALUE #(
            %key-Product = 'MATERIAL9519'
            %key-Language = '1'
            ProductDescription = '果然會改1017'
            %control-ProductDescription = cl_abap_behv=>flag_changed
            ).
    APPEND update_productdescription TO update_productdescription2.

    update_productdescription = VALUE #(
            %key-Product = 'MATERIAL9520'
            %key-Language = '1'
            ProductDescription = '果然會改1017'
            %control-ProductDescription = cl_abap_behv=>flag_changed
            ).
    APPEND update_productdescription TO update_productdescription2.

        update_unit = VALUE #(

    %key-Product = 'MATERIAL9519'
    %key-AlternativeUnit = '%O'
    WeightUnit = 'KG'
    VolumeUnit = 'HL'
    GrossWeight = '3'
    ProductVolume = '2'
    %control-WeightUnit = cl_abap_behv=>flag_changed
    %control-VolumeUnit = cl_abap_behv=>flag_changed
    %control-GrossWeight = cl_abap_behv=>flag_changed
    %control-ProductVolume = cl_abap_behv=>flag_changed
        ).
    APPEND update_unit TO update_unit2.

        update_unit = VALUE #(

    %key-Product = 'MATERIAL9520'
    %key-AlternativeUnit = '%O'
    WeightUnit = 'KG'
    VolumeUnit = 'HL'
    GrossWeight = '3'
    ProductVolume = '2'
    %control-WeightUnit = cl_abap_behv=>flag_changed
    %control-VolumeUnit = cl_abap_behv=>flag_changed
    %control-GrossWeight = cl_abap_behv=>flag_changed
    %control-ProductVolume = cl_abap_behv=>flag_changed
        ).
    APPEND update_unit TO update_unit2.

    create_unit_item = VALUE #(

    %key-Product = 'MATERIAL9519'
    %key-AlternativeUnit = '%O'
    %target = VALUE #( (
                     %cid = 'uomean'
                     Product = 'MATERIAL9519'
                     AlternativeUnit = '%O'
                     ConsecutiveNumber = '00002'
                     InternationalArticleNumberCat = 'E5'
                     IsMainGlobalTradeItemNumber = 'X'
                     ) )
                    ).


    APPEND create_unit_item TO create_unit_item2.

    create_unit_item = VALUE #(

    %key-Product = 'MATERIAL9520'
    %key-AlternativeUnit = '%O'
    %target = VALUE #( (
                     %cid = 'uomean2'
                     Product = 'MATERIAL9520'
                     AlternativeUnit = '%O'
                     ConsecutiveNumber = '00001'
                     InternationalArticleNumberCat = 'E5'
                     IsMainGlobalTradeItemNumber = 'X'
                     ) )
                    ).


    APPEND create_unit_item TO create_unit_item2.

    update_Storage = VALUE #(
    %key-Product = 'MATERIAL9519'
    StorageConditions = '10'
    LabelType = 'M7'
    LabelForm = 'E1'

* NmbrOfGROrGISlipsToPrintQty = 06
* TotalShelfLife = 20
* MinRemainingShelfLife = 2
        %control-StorageConditions = cl_abap_behv=>flag_changed
        %control-LabelType = cl_abap_behv=>flag_changed
        %control-LabelForm = cl_abap_behv=>flag_changed

     ).

    APPEND update_Storage TO update_Storage2.

    update_Storage = VALUE #(
    %key-Product = 'MATERIAL9520'
    StorageConditions = '10'
    LabelType = 'M7'
    LabelForm = 'E1'

* NmbrOfGROrGISlipsToPrintQty = 06
* TotalShelfLife = 20
* MinRemainingShelfLife = 2
        %control-StorageConditions = cl_abap_behv=>flag_changed
        %control-LabelType = cl_abap_behv=>flag_changed
        %control-LabelForm = cl_abap_behv=>flag_changed

     ).

    APPEND update_Storage TO update_Storage2.

    update_sales = VALUE #(
     %key-Product =  'MATERIAL9519'
     TransportationGroup = '0002'
     SalesStatus = '01'
     SalesStatusValidityDate = '20231016'
     %control-TransportationGroup = cl_abap_behv=>flag_changed
     %control-SalesStatus = cl_abap_behv=>flag_changed
     %control-SalesStatusValidityDate = cl_abap_behv=>flag_changed
     ).
    APPEND update_sales TO update_sales2.

    update_sales = VALUE #(
     %key-Product =  'MATERIAL9520'
     TransportationGroup = '0002'
     SalesStatus = '01'
     SalesStatusValidityDate = '20231016'
     %control-TransportationGroup = cl_abap_behv=>flag_changed
     %control-SalesStatus = cl_abap_behv=>flag_changed
     %control-SalesStatusValidityDate = cl_abap_behv=>flag_changed
     ).
    APPEND update_sales TO update_sales2.

        update_plant = VALUE #(
        %key-Product = 'MATERIAL9519'
        %key-Plant = '6310'
        ProfitCenter = 'YB102'
        %control-ProfitCenter = cl_abap_behv=>flag_changed
        ).

    APPEND update_plant TO update_plant2.

        update_plant = VALUE #(
        %key-Product = 'MATERIAL9520'
        %key-Plant = '6310'
        ProfitCenter = 'YB102'
        %control-ProfitCenter = cl_abap_behv=>flag_changed
        ).

    APPEND update_plant TO update_plant2.

        update_varea = VALUE #(
            %key-product = 'MATERIAL9519'
            %key-ValuationArea = '6310'
*            %key-ValuationType = ''
            ValuationClass = '7900'
            ProjectStockValuationClass = '7900'
            PriceDeterminationControl = '3'
            %control-ValuationClass = cl_abap_behv=>flag_changed
            %control-ProjectStockValuationClass = cl_abap_behv=>flag_changed
            %control-PriceDeterminationControl = cl_abap_behv=>flag_changed
            ).
    APPEND update_varea TO update_varea2.

        update_varea = VALUE #(
            %key-product = 'MATERIAL9520'
            %key-ValuationArea = '6310'
*            %key-ValuationType = ''
            ValuationClass = '7900'
            ProjectStockValuationClass = '7900'
            PriceDeterminationControl = '3'
            %control-ValuationClass = cl_abap_behv=>flag_changed
            %control-ProjectStockValuationClass = cl_abap_behv=>flag_changed
            %control-PriceDeterminationControl = cl_abap_behv=>flag_changed
            ).
    APPEND update_varea TO update_varea2.

    update_delivery = VALUE #(
            %key-Product = 'MATERIAL9519'
            %key-ProductSalesOrg = '6310'
            %key-ProductDistributionChnl = '10'
            MinimumOrderQuantity = '99'
            SupplyingPlant = '6310'
*            SalesMeasureUnit = 'CMS'
            ProductSalesStatus = '01'
            ProductSalesStatusValidityDate = '20231017'
            %control-MinimumOrderQuantity = cl_abap_behv=>flag_changed
            %control-SupplyingPlant = cl_abap_behv=>flag_changed
*            %control-SalesMeasureUnit = cl_abap_behv=>flag_changed
            %control-ProductSalesStatus = cl_abap_behv=>flag_changed
            %control-ProductSalesStatusValidityDate = cl_abap_behv=>flag_changed
            ).
    APPEND update_delivery to update_delivery2.
    update_delivery = VALUE #(

            %key-Product = 'MATERIAL9520'
            %key-ProductSalesOrg = '6310'
            %key-ProductDistributionChnl = '10'
            MinimumOrderQuantity = '100'
            SupplyingPlant = '6310'
*            SalesMeasureUnit = 'CMS'
            ProductSalesStatus = '01'
            ProductSalesStatusValidityDate = '20231017'
            %control-MinimumOrderQuantity = cl_abap_behv=>flag_changed
            %control-SupplyingPlant = cl_abap_behv=>flag_changed
*            %control-SalesMeasureUnit = cl_abap_behv=>flag_changed
            %control-ProductSalesStatus = cl_abap_behv=>flag_changed
            %control-ProductSalesStatusValidityDate = cl_abap_behv=>flag_changed
            ).
    APPEND update_delivery to update_delivery2.

    MODIFY ENTITIES OF I_ProductTP_2
    ENTITY Product
    UPDATE FROM update_product

    ENTITY ProductDescription
    UPDATE FROM update_productdescription2

     ENTITY ProductUnitOfMeasure
     UPDATE FROM update_unit2
*     CREATE BY \_ProductUnitOfMeasureEAN
*     FROM create_unit_item2

    ENTITY ProductStorage
    UPDATE FROM update_storage2

    ENTITY ProductSales
    UPDATE FROM update_sales2

    ENTITY ProductPlant
    UPDATE FROM update_plant2
    "為測試過
*    CREATE BY \_ProductPlantMRP
*    FROM create_plantmrp2

     ENTITY ProductValuation
     UPDATE FROM update_varea2
*
    ENTITY ProductSalesDelivery
    UPDATE FROM update_delivery2

    FAILED DATA(failed)
    REPORTED DATA(reported).

    IF Failed IS NOT INITIAL.
      LOOP AT reported-productsalesdelivery ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'product1 error' ).
        out->write( lv_result1 ).
      ENDLOOP.
      LOOP AT reported-productunitofmeasureean ASSIGNING FIELD-SYMBOL(<lt_proudct3>).
        DATA(lv_result3) = <lt_proudct3>-%msg->if_message~get_text( ).
        out->write( 'product1 error' ).
        out->write( lv_result3 ).
      ENDLOOP.
    ELSE.

      COMMIT ENTITIES
          RESPONSE OF I_ProductTP_2
              FAILED DATA(failed_commit)
              REPORTED DATA(reported_commit).

      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-productsalesdelivery ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'product2 error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        LOOP AT reported_commit-product  ASSIGNING FIELD-SYMBOL(<lt_proudct4>).
          DATA(lv_result4) = <lt_proudct4>-%msg->if_message~get_text( ).
          out->write( 'product2 error' ).
          out->write( lv_result4 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
