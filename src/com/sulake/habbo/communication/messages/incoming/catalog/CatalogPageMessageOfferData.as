package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_988:Array;
      
      private var var_898:int;
      
      private var var_1307:String;
      
      private var _offerId:int;
      
      private var var_899:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1307 = param1.readString();
         var_898 = param1.readInteger();
         var_899 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_988 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_988.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_988;
      }
      
      public function get priceInCredits() : int
      {
         return var_898;
      }
      
      public function get localizationId() : String
      {
         return var_1307;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_899;
      }
   }
}
