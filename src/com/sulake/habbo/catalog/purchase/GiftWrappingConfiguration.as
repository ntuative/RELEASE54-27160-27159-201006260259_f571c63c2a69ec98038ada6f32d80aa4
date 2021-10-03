package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_623:Array;
      
      private var var_1392:int;
      
      private var var_1556:Array;
      
      private var var_624:Array;
      
      private var var_1275:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1275 = _loc2_.isWrappingEnabled;
         var_1392 = _loc2_.wrappingPrice;
         var_1556 = _loc2_.stuffTypes;
         var_624 = _loc2_.boxTypes;
         var_623 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_623;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1556;
      }
      
      public function get price() : int
      {
         return var_1392;
      }
      
      public function get boxTypes() : Array
      {
         return var_624;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1275;
      }
   }
}
