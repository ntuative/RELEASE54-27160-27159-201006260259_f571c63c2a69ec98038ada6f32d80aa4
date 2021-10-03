package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1745:int;
      
      private var var_1746:Boolean = false;
      
      private var var_1744:int;
      
      private var var_1748:int;
      
      private var var_1743:int;
      
      private var var_1448:String;
      
      private var var_1392:int;
      
      private var _offerId:int;
      
      private var var_1749:int;
      
      private var var_1750:Boolean;
      
      private var var_1747:Boolean;
      
      private var var_423:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1448 = param2;
         var_1392 = param3;
         var_1747 = param4;
         var_1750 = param5;
         var_1744 = param6;
         var_1743 = param7;
         var_1748 = param8;
         var_1745 = param9;
         var_1749 = param10;
      }
      
      public function get month() : int
      {
         return var_1745;
      }
      
      public function get page() : ICatalogPage
      {
         return var_423;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1750;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_423 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_305;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1747;
      }
      
      public function get localizationId() : String
      {
         return var_1448;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1743;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_1746;
      }
      
      public function get day() : int
      {
         return var_1749;
      }
      
      public function get year() : int
      {
         return var_1748;
      }
      
      public function get price() : int
      {
         return var_1392;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_1746 = param1;
      }
      
      public function get periods() : int
      {
         return var_1744;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1392;
      }
      
      public function get productCode() : String
      {
         return var_1448;
      }
   }
}
