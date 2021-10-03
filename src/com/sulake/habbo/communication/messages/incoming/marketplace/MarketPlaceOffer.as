package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1392:int;
      
      private var var_1838:int;
      
      private var var_2177:int = -1;
      
      private var var_152:int;
      
      private var var_1901:int;
      
      private var _offerId:int;
      
      private var var_1391:int;
      
      private var _furniId:int;
      
      private var var_1487:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1901 = param3;
         var_1487 = param4;
         var_1392 = param5;
         var_152 = param6;
         var_2177 = param7;
         var_1838 = param8;
         var_1391 = param9;
      }
      
      public function get status() : int
      {
         return var_152;
      }
      
      public function get price() : int
      {
         return var_1392;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2177;
      }
      
      public function get offerCount() : int
      {
         return var_1391;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1901;
      }
      
      public function get averagePrice() : int
      {
         return var_1838;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1487;
      }
   }
}
