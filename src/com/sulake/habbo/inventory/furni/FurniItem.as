package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2076:int;
      
      private var var_2078:Boolean;
      
      private var var_1865:int;
      
      private var var_1487:String;
      
      private var var_2316:Boolean = false;
      
      private var var_2074:int;
      
      private var var_480:int;
      
      private var var_1088:String;
      
      private var var_1541:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1434:int;
      
      private var var_2077:Boolean;
      
      private var var_2317:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2076 = param1;
         var_1088 = param2;
         _objId = param3;
         var_1434 = param4;
         var_1487 = param5;
         var_2078 = param6;
         var_2077 = param7;
         var_2074 = param8;
         var_1541 = param9;
         var_1865 = param10;
         var_480 = -1;
      }
      
      public function get songId() : int
      {
         return var_1865;
      }
      
      public function get iconCallbackId() : int
      {
         return var_480;
      }
      
      public function get expiryTime() : int
      {
         return var_2074;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2317 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2316 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_480 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2077;
      }
      
      public function get slotId() : String
      {
         return var_1541;
      }
      
      public function get classId() : int
      {
         return var_1434;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2078;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2076;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2316;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2317;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1088;
      }
   }
}
