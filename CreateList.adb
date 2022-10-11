with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;


package body CreateList is -- in file CreateList.adb

   len: Integer := 0;
   list: array(1..size) of itemType;

   procedure AddToList( ListItem: in itemType ) is
   begin

      if len > size then

         Put("list full");

      else

         len := len + 1;
         list(len) := ListItem;

      end if;

   end AddToList;

   procedure PrintList is
   begin
      if len = 0 then
         put("list empty"); New_Line;
      else
         put("list is: ");
         for i in 1..len loop
            Put(list(i));
            put(" ");
         end loop;
         New_Line(2);
      end if;
   end PrintList;

   procedure PrintList( pt: in Integer) is
   begin

      Put(list(pt)); Put_Line(" ");

   end PrintList;

   procedure DeleteList( pt: in Integer) is
   begin
      Put_Line("Delete item at: " & Integer'Image(pt));
      if pt = 0 then
         put("underflow");
      else
         for i in pt..(len-1) loop
            if i < len then
               list(i) := list(i + 1);
            end if;
         end loop;
         len := len - 1;
      end if;
      New_Line;

   end DeleteList;

   function ListLength return Integer is
   begin
      return len;
   end ListLength;

end CreateList;
