package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1088:String;
      
      private var var_2213:int;
      
      private var var_2306:int;
      
      private var var_1699:int;
      
      private var var_2307:int;
      
      private var _category:int;
      
      private var var_2538:int;
      
      private var var_2305:int;
      
      private var var_2301:int;
      
      private var var_2303:int;
      
      private var var_2302:int;
      
      private var var_2304:Boolean;
      
      private var var_1487:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_2213 = param1;
         var_1088 = param2;
         var_2306 = param3;
         var_2303 = param4;
         _category = param5;
         var_1487 = param6;
         var_1699 = param7;
         var_2301 = param8;
         var_2305 = param9;
         var_2302 = param10;
         var_2307 = param11;
         var_2304 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2303;
      }
      
      public function get extra() : int
      {
         return var_1699;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function get groupable() : Boolean
      {
         return var_2304;
      }
      
      public function get creationMonth() : int
      {
         return var_2302;
      }
      
      public function get roomItemID() : int
      {
         return var_2306;
      }
      
      public function get itemType() : String
      {
         return var_1088;
      }
      
      public function get itemID() : int
      {
         return var_2213;
      }
      
      public function get songID() : int
      {
         return var_1699;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2301;
      }
      
      public function get creationYear() : int
      {
         return var_2307;
      }
      
      public function get creationDay() : int
      {
         return var_2305;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
