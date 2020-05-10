CLASS zcl_generate_language_data_007 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_language_data_007 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF zsoftware_007.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  ( language_id = '001' language_name = 'JAVA' language_rating = '5' language_description = 'Die Beste.' )
  ( language_id = '002' language_name = 'C++' language_rating = '4' )
  ( language_id = '003' language_name = 'JavaScript' language_rating = '2' )
  ( language_id = '004' language_name = 'Python' language_rating = '5' )
  ).

*   delete existing entries in the database table
    DELETE FROM zsoftware_007.

*   insert the new table entries
    INSERT zsoftware_007 FROM TABLE @itab.

*   check the result
    SELECT * FROM zsoftware_007 INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'Language data inserted successfully!').
  ENDMETHOD.

ENDCLASS.
