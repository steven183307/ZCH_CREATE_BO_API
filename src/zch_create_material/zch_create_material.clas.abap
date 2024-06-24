CLASS zch_create_material DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_MATERIAL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA create_product TYPE TABLE FOR CREATE I_ProductTP_2.
    "工廠資料
    DATA create_productPlant TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductPlant.
    DATA create_productPlant2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductPlant.
    "
    DATA create_ProductPlantCosting TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantCosting.
    DATA create_ProductPlantCosting2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantCosting.
    "產品描述
    DATA create_productdescription TYPE STRUCTURE FOR CREATE  I_ProductTP_2\_ProductDescription.
    DATA create_productdescription2 TYPE TABLE FOR CREATE  I_ProductTP_2\_ProductDescription.
    "
    DATA create_PlantSupplyPlanning TYPE STRUCTURE FOR CREATE  I_ProductPlantTP_2\_ProductPlantSupplyPlanning.
    DATA create_PlantSupplyPlanning2 TYPE TABLE FOR CREATE  I_ProductPlantTP_2\_ProductPlantSupplyPlanning.
    "配銷鏈
    DATA create_salesDelivery TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductSalesDelivery.
    DATA create_salesDelivery2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductSalesDelivery.
    "稅
    DATA create_salesDeliveryTax TYPE STRUCTURE FOR CREATE  I_ProductSalesDeliveryTP_2\_prodsalesdeliverysalestax.
    DATA create_salesDeliveryTax2 TYPE TABLE FOR CREATE  I_ProductSalesDeliveryTP_2\_prodsalesdeliverysalestax.

    DATA  product2  TYPE I_ProductTP_2-Product.
    "儲存地點
    DATA create_ProductStorageLocation TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorageLocation .
    DATA create_ProductStorageLocation2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorageLocation .
    "MRP
    DATA create_ProductPlantMRP TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.
    DATA create_ProductPlantMRP2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.
    "產品銷售
    DATA create_ProductSales TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductSales.
    DATA create_ProductSales2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductSales.
    "
    DATA create_ProductProcurement TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductProcurement.
    DATA create_ProductProcurement2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductProcurement.

    DATA create_QualityManagement TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductQualityManagement.
    DATA create_QualityManagement2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductQualityManagement.

    DATA create_ProductUnitOfMeasure TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductUnitOfMeasure.
    DATA create_ProductUnitOfMeasure2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductUnitOfMeasure.
    "評價範圍
    DATA create_ProductValuation  TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductValuation.
    DATA create_ProductValuation2  TYPE TABLE FOR CREATE I_ProductTP_2\_ProductValuation.
    "產品儲存
    DATA create_ProductStorage TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductStorage.
    DATA create_ProductStorage2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductStorage.

    product2 = 'MATERIAL9519'.
    "產品基本資料
    create_product = VALUE #( (
   %cid = '01'
   Product =  product2
   %control-Product = cl_abap_behv=>flag_changed
   ProductType = 'HALB'
   %control-ProductType = cl_abap_behv=>flag_changed

   IndustrySector = 'M'
   %control-IndustrySector = cl_abap_behv=>flag_changed
   GrossWeight = '0.500'
   %control-GrossWeight = cl_abap_behv=>flag_changed
   WeightUnit = 'KG'
   %control-WeightUnit = cl_abap_behv=>flag_changed
   ProductGroup = 'L003'
   %control-ProductGroup = cl_abap_behv=>flag_changed
   BaseUnit = 'ST'
   %control-BaseUnit = cl_abap_behv=>flag_changed
   ItemCategoryGroup = 'NORM'
   %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
   NetWeight = '0.450'
   %control-NetWeight = cl_abap_behv=>flag_changed
   Division = '00'
   %control-Division = cl_abap_behv=>flag_changed
   ProductDocumentPageCount = '000'
   %control-ProductDocumentPageCount = cl_abap_behv=>flag_changed

     ) ).

    create_productdescription  = VALUE #( %cid_ref = '01'
                                     Product = product2
                                    %target = VALUE #( (  %cid = '04'
                                                          Product = product2
                                                          Language = 'W'
                                                          ProductDescription = 'TEST'
                                                           %control = VALUE #(
                                                           Language =  cl_abap_behv=>flag_changed
                                                           ProductDescription =  cl_abap_behv=>flag_changed
                                                           ) ) ) ).
    APPEND create_productdescription  TO create_productdescription2 .

    create_ProductSales = VALUE #( %cid_ref = '01'
                                     Product = product2
                                     %target = VALUE #( (  %cid = '11'
                                                           Product = product2
                                                           TransportationGroup = '0001'
                                                           %control = VALUE #(
                                                            TransportationGroup = cl_abap_behv=>flag_changed )
                                     ) ) ).
    APPEND create_ProductSales TO create_ProductSales2.

    create_ProductProcurement  = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '12'
                                                          Product = product2
                                    ) ) ).
    APPEND create_ProductProcurement TO create_ProductProcurement2.

    create_QualityManagement  = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '13'
                                                          Product = product2
                                    ) ) ).
    APPEND create_QualityManagement TO create_QualityManagement2.

    create_ProductUnitOfMeasure =  VALUE #( %cid_ref = '01'
                                       Product = product2
                                       %target = VALUE #( (  %cid = '14'
                                                             Product = product2
                                                             AlternativeUnit = 'ST'
                                                             QuantityDenominator = '1'
                                                             QuantityNumerator = '1'
                                                             GrossWeight = '0.500'
                                                             WeightUnit = 'KG'
                                                             BaseUnit = 'ST'
                                                             %control = VALUE #(
                                                              AlternativeUnit = cl_abap_behv=>flag_changed
                                                             QuantityDenominator = cl_abap_behv=>flag_changed
                                                             QuantityNumerator = cl_abap_behv=>flag_changed
                                                             GrossWeight = cl_abap_behv=>flag_changed
                                                             WeightUnit = cl_abap_behv=>flag_changed
                                                             BaseUnit = cl_abap_behv=>flag_changed )

                                       ) ) ).
    APPEND create_ProductUnitOfMeasure TO create_ProductUnitOfMeasure2.

    create_ProductValuation = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '15'
                                                          Product = product2
                                                          ValuationArea = '6310'
                                                          ValuationClass = '7900'
                                                          PriceDeterminationControl = '2'
                                                          StandardPrice = '95.00'
                                                          ProductPriceUnitQuantity = '1'
                                                          InventoryValuationProcedure = 'S'
                                                          Currency = 'TWD'
                                                          BaseUnit = 'ST'
                                                          %control = VALUE #(
                                                          ValuationArea = cl_abap_behv=>flag_changed
                                                          ValuationClass = cl_abap_behv=>flag_changed
                                                          PriceDeterminationControl = cl_abap_behv=>flag_changed
                                                          StandardPrice = cl_abap_behv=>flag_changed
                                                          ProductPriceUnitQuantity = cl_abap_behv=>flag_changed
                                                          InventoryValuationProcedure = cl_abap_behv=>flag_changed
                                                          Currency = cl_abap_behv=>flag_changed
                                                          BaseUnit = cl_abap_behv=>flag_changed )

                                    ) ) ).
    APPEND create_ProductValuation TO create_ProductValuation2.





    create_productplant = VALUE #( %cid_ref = '01'
                                    Product = product2
                                   %target = VALUE #( (  %cid = '02'
                                                         Product = product2
                                                         Plant = '6310'
                                                         PeriodType = 'M'
                                                         ProfitCenter = 'YB111'
                                                         BaseUnit = 'ST'

                                                      %control = VALUE #(
*                                                      Product = cl_abap_behv=>flag_changed
                                                       Plant = cl_abap_behv=>flag_changed
                                                       BaseUnit = cl_abap_behv=>flag_changed
                                                       PeriodType = cl_abap_behv=>flag_changed
                                                       ProfitCenter = cl_abap_behv=>flag_changed
                                                     ) ) ) ).
    APPEND create_productplant TO create_productplant2 .

    create_PlantSupplyPlanning   = VALUE #( %cid_ref = '02'
                                    Product = product2
                                    Plant = '6310'
                                   %target = VALUE #( ( %cid = '05'
                                                       Product = product2
                                                       Plant = '6310'
                                                       MRPType = 'ND'
                                                       MRPResponsible = '001'
                                                       LotSizingProcedure = 'EX'
                                                       PlannedDeliveryDurationInDays = '10'
                                                       SafetySupplyDurationInDays = '00'
                                                       TotalReplenishmentLeadTime = '2'
                                                       ProcurementType = 'E'
                                                       ProcurementSubType = '50'
                                                       AvailabilityCheckType = 'SR'
                                                       ProdInhProdnDurationInWorkDays = '1'
                                                       DependentRequirementsType = '2'
                                                       BackwardCnsmpnPeriodInWorkDays = '100'
                                                       FwdConsumptionPeriodInWorkDays = '100'
                                                       ProdRqmtsConsumptionMode = '2'
                                                       SchedulingFloatProfile = '001'
                                                       ProductionInvtryManagedLoc = '631B'
                                                       Currency = 'TWD'
                                                       BaseUnit = 'ST'
                                                      %control = VALUE #(
                                                        MRPType  = cl_abap_behv=>flag_changed
                                                        MRPResponsible = cl_abap_behv=>flag_changed
                                                        LotSizingProcedure = cl_abap_behv=>flag_changed
                                                        PlannedDeliveryDurationInDays = cl_abap_behv=>flag_changed
                                                        SafetySupplyDurationInDays = cl_abap_behv=>flag_changed
                                                        TotalReplenishmentLeadTime = cl_abap_behv=>flag_changed
                                                        ProcurementType = cl_abap_behv=>flag_changed
                                                        ProcurementSubType = cl_abap_behv=>flag_changed
                                                        AvailabilityCheckType = cl_abap_behv=>flag_changed
                                                        ProdInhProdnDurationInWorkDays = cl_abap_behv=>flag_changed
                                                        DependentRequirementsType = cl_abap_behv=>flag_changed
                                                        BackwardCnsmpnPeriodInWorkDays = cl_abap_behv=>flag_changed
                                                        FwdConsumptionPeriodInWorkDays = cl_abap_behv=>flag_changed
                                                        ProdRqmtsConsumptionMode = cl_abap_behv=>flag_changed
                                                        SchedulingFloatProfile = cl_abap_behv=>flag_changed
                                                        ProductionInvtryManagedLoc = cl_abap_behv=>flag_changed
                                                        Currency = cl_abap_behv=>flag_changed
                                                        BaseUnit = cl_abap_behv=>flag_changed
                                                        ) ) ) ).
    APPEND create_PlantSupplyPlanning  TO create_PlantSupplyPlanning2.

    create_ProductStorage    = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '16'
                                                          Product = product2
                                    ) ) ).
    APPEND create_ProductStorage TO create_ProductStorage2.



    create_salesdelivery = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '07'
                                                          Product = product2
                                                          ProductSalesOrg = '6310'
                                                          ProductDistributionChnl = '10'
                                                          ItemCategoryGroup = 'NORM'
                                                          AccountDetnProductGroup = '02'
                                                          LogisticsStatisticsGroup = '1'
                                                          BaseUnit = 'ST'
                                                          %control = VALUE #(
                                                          ProductSalesOrg = cl_abap_behv=>flag_changed
                                                          ProductDistributionChnl = cl_abap_behv=>flag_changed
                                                          ItemCategoryGroup  = cl_abap_behv=>flag_changed
                                                          AccountDetnProductGroup = cl_abap_behv=>flag_changed
                                                          LogisticsStatisticsGroup = cl_abap_behv=>flag_changed
                                                          BaseUnit = cl_abap_behv=>flag_changed
                                                           )
                                    )                   ) ).
    APPEND create_salesdelivery TO create_salesdelivery2.

    create_salesDeliveryTax  = VALUE #( %cid_ref = '07'
                                        Product = product2
                                        ProductSalesOrg = '6310'
                                        ProductDistributionChnl = '10'
                                        %target = VALUE #( (  %cid = '08'
                                                              Product = product2
                                                              ProductSalesOrg = '6310'
                                                              ProductDistributionChnl = '10'
                                                              Country = 'TW'
                                                              ProductSalesTaxCategory = 'TTX1'
                                                              ProductTaxClassification = '1'
                                                              %control = VALUE #(
                                                          ProductSalesTaxCategory = cl_abap_behv=>flag_changed
                                                          ProductTaxClassification  = cl_abap_behv=>flag_changed
                                                          Country = cl_abap_behv=>flag_changed
                                        ) ) ) ).
    APPEND create_salesDeliveryTax TO create_salesDeliveryTax2.

    create_productplantcosting = VALUE #(
                                          %cid_ref = '02'
                                         Product = product2
                                          Plant = '6310'
                                          %target = VALUE #( (
                                                            %cid = '03'
                                                            Product = product2
                                                            Plant = '6310'
                                                            CostingLotSize = 100
                                                            VarianceKey = '000001'
                                                            BaseUnit = 'ST'
                                                             TaskListGroup = '49999991'
                                                             TaskListGroupCounter = 1
                                                             %control = VALUE #(
                                                                    TaskListGroup = cl_abap_behv=>flag_changed
                                                                    TaskListGroupCounter = cl_abap_behv=>flag_changed
                                                                    CostingLotSize = cl_abap_behv=>flag_changed
                                                                    VarianceKey = cl_abap_behv=>flag_changed
                                                                    BaseUnit = cl_abap_behv=>flag_changed )
                                                            ) ) ).

    APPEND create_productplantcosting TO create_productplantcosting2.

    create_ProductStorageLocation  = VALUE #( %cid_ref = '02'
                                         Product = product2
                                          Plant = '6310'

                                    %target = VALUE #( (  %cid = '17'
                                                          Product = product2
                                                          Plant = '6310'
                                                          StorageLocation = '631B'
                                                          %control = VALUE #(
                                                                    StorageLocation = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND create_ProductStorageLocation TO create_ProductStorageLocation2.

    MODIFY ENTITIES OF I_ProductTP_2
    ENTITY Product
    CREATE FROM create_product
    CREATE BY \_ProductDescription
    FROM create_productdescription2
    CREATE BY \_ProductPlant
    FROM create_productplant2
    CREATE BY \_ProductSales
    FROM  create_productsales2
    CREATE BY \_ProductProcurement
    FROM create_ProductProcurement2
    CREATE BY \_ProductQualityManagement
    FROM  create_QualityManagement2
    CREATE BY \_ProductSalesDelivery
    FROM create_salesdelivery2
    CREATE BY \_ProductUnitOfMeasure
    FROM create_productunitofmeasure2
    CREATE BY \_ProductValuation
    FROM create_productvaluation2
    CREATE BY \_ProductStorage
    FROM create_productstorage2


    ENTITY ProductPlant
    CREATE BY \_ProductPlantSupplyPlanning
    FROM create_PlantSupplyPlanning2
    CREATE BY \_ProductPlantStorageLocation
    FROM create_ProductStorageLocation2
    CREATE BY \_ProductPlantCosting
    FROM create_productplantcosting2
    CREATE BY \_ProductPlantMRP
    FROM create_ProductPlantMRP2

    ENTITY ProductSalesDelivery
    CREATE BY \_ProdSalesDeliverySalesTax
    FROM create_salesdeliverytax2


     MAPPED DATA(mapped)
     REPORTED DATA(reported)
     FAILED DATA(failed).

    IF failed IS NOT INITIAL.
      LOOP AT reported-product  ASSIGNING FIELD-SYMBOL(<ls_po_reported>).
        DATA(lv_result) = <ls_po_reported>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error1' ).
        out->write( lv_result ).
      ENDLOOP.
      LOOP AT reported-productplant ASSIGNING FIELD-SYMBOL(<ls_po_reported2>).
        DATA(lv_result2) = <ls_po_reported2>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error2' ).
        out->write( lv_result2 ).
      ENDLOOP.
      LOOP AT reported-productplantcosting  ASSIGNING FIELD-SYMBOL(<ls_po_reported3>).
        DATA(lv_result3) = <ls_po_reported3>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error3' ).
        out->write( lv_result3 ) .
      ENDLOOP.

      LOOP AT reported-productsalesdelivery  ASSIGNING FIELD-SYMBOL(<ls_po_reported7>).
        DATA(lv_result7) = <ls_po_reported7>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error7' ).
        out->write( lv_result7 ) .
      ENDLOOP.
      LOOP AT reported-productsalesdeliverysalestax  ASSIGNING FIELD-SYMBOL(<ls_po_reported8>).
        DATA(lv_result8) = <ls_po_reported8>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error8' ).
        out->write( lv_result8 ) .
      ENDLOOP.
      LOOP AT reported-productplantsupplyplanning ASSIGNING FIELD-SYMBOL(<ls_po_reported9>).
        DATA(lv_result9) = <ls_po_reported9>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error9' ).
        out->write( lv_result9 ) .
      ENDLOOP.
      LOOP AT reported-productprocurement ASSIGNING FIELD-SYMBOL(<ls_po_reported10>).
        DATA(lv_result10) = <ls_po_reported10>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error10' ).
        out->write( lv_result10 ) .
      ENDLOOP.

      LOOP AT reported-ProductQualityManagement ASSIGNING FIELD-SYMBOL(<ls_po_reported11>).
        DATA(lv_result11) = <ls_po_reported11>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error11' ).
        out->write( lv_result10 ) .
      ENDLOOP.
      LOOP AT reported-ProductUnitOfMeasure ASSIGNING FIELD-SYMBOL(<ls_po_reported12>).
        DATA(lv_result12) = <ls_po_reported12>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error12' ).
        out->write( lv_result12 ) .
      ENDLOOP.
      LOOP AT reported-ProductValuation  ASSIGNING FIELD-SYMBOL(<ls_po_reported13>).
        DATA(lv_result13) = <ls_po_reported13>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error13' ).
        out->write( lv_result13 ) .
      ENDLOOP.
      LOOP AT reported-ProductStorage  ASSIGNING FIELD-SYMBOL(<ls_po_reported14>).
        DATA(lv_result14) = <ls_po_reported14>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error14' ).
        out->write( lv_result14 ) .
      ENDLOOP.
      LOOP AT reported-ProductValuation  ASSIGNING FIELD-SYMBOL(<ls_po_reported15>).
        DATA(lv_result15) = <ls_po_reported15>-%msg->if_message~get_text( ).
        out->write( 'EML PO Error15' ).
        out->write( lv_result15 ) .
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
        LOOP AT reported_commit-productplant  ASSIGNING FIELD-SYMBOL(<ls_po_reported5>).
          DATA(lv_result5) = <ls_po_reported5>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error5' ).
          out->write( lv_result5 ).
        ENDLOOP.
        LOOP AT reported_commit-productplantcosting  ASSIGNING FIELD-SYMBOL(<ls_po_reported6>).
          DATA(lv_result6) = <ls_po_reported6>-%msg->if_message~get_text( ).
          out->write( 'EML PO Error6' ).
          out->write( lv_result6 ).
        ENDLOOP.
        out->write( 'failed_commit Error' ).
      ELSE.
        out->write( 'SUCCESS' ).
      ENDIF.
*            COMMIT ENTITIES END.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
