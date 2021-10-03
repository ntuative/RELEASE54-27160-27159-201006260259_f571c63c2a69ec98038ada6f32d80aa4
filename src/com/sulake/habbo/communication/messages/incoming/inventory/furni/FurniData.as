package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1487:String;
      
      private var var_1088:String;
      
      private var var_2075:Boolean;
      
      private var var_1699:int;
      
      private var var_2076:int;
      
      private var var_2079:Boolean;
      
      private var var_1541:String = "";
      
      private var var_2078:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1434:int;
      
      private var var_2077:Boolean;
      
      private var var_1865:int = -1;
      
      private var var_2074:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2076 = param1;
         var_1088 = param2;
         _objId = param3;
         var_1434 = param4;
         _category = param5;
         var_1487 = param6;
         var_2075 = param7;
         var_2078 = param8;
         var_2077 = param9;
         var_2079 = param10;
         var_2074 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1541;
      }
      
      public function get extra() : int
      {
         return var_1699;
      }
      
      public function get classId() : int
      {
         return var_1434;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2079;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2075;
      }
      
      public function get stripId() : int
      {
         return var_2076;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function get songId() : int
      {
         return var_1865;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1541 = param1;
         var_1699 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1088;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_2074;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2077;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2078;
      }
   }
}
