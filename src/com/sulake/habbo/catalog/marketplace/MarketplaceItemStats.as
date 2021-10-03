package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1527:Array;
      
      private var var_1838:int;
      
      private var var_1837:int;
      
      private var var_1839:int;
      
      private var var_1840:int;
      
      private var _dayOffsets:Array;
      
      private var var_1841:int;
      
      private var var_1528:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1527;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1527 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1837;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1528 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1838 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1839;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1840;
      }
      
      public function get offerCount() : int
      {
         return var_1841;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1841 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1528;
      }
      
      public function get averagePrice() : int
      {
         return var_1838;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1840 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1839 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1837 = param1;
      }
   }
}
