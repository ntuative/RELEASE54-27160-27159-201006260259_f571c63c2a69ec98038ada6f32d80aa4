package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2425:Boolean;
      
      protected var var_1699:Number;
      
      protected var var_2423:Boolean;
      
      protected var _type:int;
      
      protected var var_2421:Boolean;
      
      protected var var_1865:int;
      
      protected var var_2424:Boolean;
      
      protected var var_1487:String;
      
      protected var var_2307:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1541:String;
      
      protected var var_2304:Boolean;
      
      protected var _category:int;
      
      protected var var_2302:int;
      
      protected var var_2437:int;
      
      protected var var_2305:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_2304 = param5;
         var_2424 = param6;
         var_2425 = param7;
         var_2423 = param8;
         var_1487 = param9;
         var_1699 = param10;
         var_2437 = param11;
         var_2305 = param12;
         var_2302 = param13;
         var_2307 = param14;
         var_1541 = param15;
         var_1865 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2421;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1699;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2421 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1865;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2423;
      }
      
      public function get slotId() : String
      {
         return var_1541;
      }
      
      public function get expires() : int
      {
         return var_2437;
      }
      
      public function get creationYear() : int
      {
         return var_2307;
      }
      
      public function get creationDay() : int
      {
         return var_2305;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2424;
      }
      
      public function get groupable() : Boolean
      {
         return var_2304;
      }
      
      public function get creationMonth() : int
      {
         return var_2302;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2425;
      }
   }
}
