CLASS zch_update_material DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_UPDATE_MATERIAL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA  product2  TYPE I_ProductTP_2-Product.


    product2 = 'MATERIAL9519'.


    MODIFY ENTITIES OF I_ProductTP_2
     ENTITY Product
     UPDATE FIELDS (
                    ProductGroup
                    Division
                     )
     WITH VALUE #( ( %key-Product =  product2
     ProductGroup = 'A002'
     ) )

     ENTITY ProductDescription
     UPDATE FIELDS (

                    ProductDescription

                     )
    WITH VALUE #( (  %key-Product = product2

                  %key-Language = 'E'
                    ProductDescription = 'goodgood'

                  ) )
     ENTITY ProductPlant
     UPDATE FIELDS ( ProfitCenter )
     WITH VALUE #( (  %key-Product = product2
                   %key-Plant  = '6310'
                   ProfitCenter = 'YB800'
                   ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    IF Failed IS NOT INITIAL.
      LOOP AT reported-product ASSIGNING FIELD-SYMBOL(<lt_proudct1>).
        DATA(lv_result1) = <lt_proudct1>-%msg->if_message~get_text( ).
        out->write( 'product1 error' ).
        out->write( lv_result1 ).
      ENDLOOP.
      LOOP AT reported-productdescription ASSIGNING FIELD-SYMBOL(<lt_proudct3>).
        DATA(lv_result3) = <lt_proudct3>-%msg->if_message~get_text( ).
        out->write( 'product3 error' ).
        out->write( lv_result3 ).
      ENDLOOP.
      LOOP AT reported-productplant ASSIGNING FIELD-SYMBOL(<lt_proudct5>).
        DATA(lv_result5) = <lt_proudct5>-%msg->if_message~get_text( ).
        out->write( 'product5 error' ).
        out->write( lv_result5 ).
      ENDLOOP.
    ELSE.
      COMMIT ENTITIES
       RESPONSE OF I_ProductTP_2
           FAILED DATA(failed_commit)
           REPORTED DATA(reported_commit).
      IF failed_commit IS NOT INITIAL.
        LOOP AT reported_commit-product ASSIGNING FIELD-SYMBOL(<lt_proudct2>).
          DATA(lv_result2) = <lt_proudct2>-%msg->if_message~get_text( ).
          out->write( 'product2 error' ).
          out->write( lv_result2 ).
        ENDLOOP.
        LOOP AT reported_commit-productdescription ASSIGNING FIELD-SYMBOL(<lt_proudct4>).
          DATA(lv_result4) = <lt_proudct4>-%msg->if_message~get_text( ).
          out->write( 'product4 error' ).
          out->write( lv_result4 ).
        ENDLOOP.
        LOOP AT reported_commit-productplant ASSIGNING FIELD-SYMBOL(<lt_proudct6>).
          DATA(lv_result6) = <lt_proudct6>-%msg->if_message~get_text( ).
          out->write( 'product6 error' ).
          out->write( lv_result6 ).
        ENDLOOP.
        out->write( 'failed commit error' ).
      ELSE.
        out->write( 'success' ).
      ENDIF.

    ENDIF.




  ENDMETHOD.
ENDCLASS.
