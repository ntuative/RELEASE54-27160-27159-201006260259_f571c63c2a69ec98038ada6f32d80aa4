package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1675:int = 2;
      
      public static const const_1603:int = 1;
      
      public static const const_1660:int = 0;
       
      
      private var var_1392:int;
      
      private var var_152:int;
      
      private var var_2525:int;
      
      private var _offerId:int;
      
      private var var_1901:int;
      
      private var _furniId:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1901 = param3;
         var_1392 = param4;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get furniType() : int
      {
         return var_1901;
      }
      
      public function get price() : int
      {
         return var_1392;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
