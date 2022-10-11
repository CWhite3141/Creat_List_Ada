with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with CreateList;

procedure Lab1  is

   package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;
   package FIO is new Ada.Text_IO.Float_IO(Float); use FIO;
   length, size: Integer;

begin

   Put_Line("C List");
   get(size);

   declare

      procedure Put(x: integer) is begin
         IIO.Put(x,1);
      end Put;

      package Clist is new CreateList(size, Integer, Put);
      use Clist;
      pt: Integer;

   begin

      PrintList;

      for row in 1..size loop
         get(pt);
         Clist.AddToList(pt);
      end loop;

      length:= ListLength;
      Put_Line("List is: ");
      for pt in 1..length loop
         PrintList(pt);
      end loop;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

      get(pt);
      DeleteList(pt);

      PrintList;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

   end;

   Put_Line("B List:");
   get(size);

   declare

      procedure Put(x: float) is
      begin
         FIO.Put(x,0,0,0);
      end Put;
      package BList is new CreateList( size, float, Put ); use BList;
      floatNum: float;
      pt: integer;

   begin

      PrintList;

      for row in 1..size loop

         FIO.get(FloatNum);-- loop  -- for or while statement
         BList.AddToList(floatNum);    -- or full object oriented notation

      end loop;

      length:= ListLength;
      for pt in 1..length loop
         PrintList(pt);
      end loop;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

      get(pt);
      DeleteList(pt);

      PrintList;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

   end;

   Put_Line("A List:");
   get(size); -- for "B" option

   declare

      type JobType is (Programmer, Software_Engineer, Sales, Inventory_Control, customer, manager);
      package JobTypeIO is new Ada.Text_IO.Enumeration_IO(JobType);  use JobTypeIO;

      procedure Put(x: JobType) is
      begin
         JobTypeIO.Put(x,0);
      end Put;

      package Alist is new CreateList(size, JobType, Put);
      use Alist;

      job: JobType;
      pt: integer;

   begin

      PrintList;

      for row in 1..size loop

         JobTypeIO.get(job);-- loop  -- for or while statement
         AList.AddToList(job);    -- or full object oriented notation

      end loop;

      length:= ListLength;
      for pt in 1..length loop
         PrintList(pt);
      end loop;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

      get(pt);
      DeleteList(pt);

      PrintList;

      Put_Line("list length: " & Integer'Image(ListLength));
      New_Line;

   end;

end Lab1;
