CLASS zch_create_routing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCH_CREATE_ROUTING IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 DATA cc TYPE STRUCTURE FOR READ IMPORT I_PURCHASECONTRACTTP.
  ENDMETHOD.
ENDCLASS.
