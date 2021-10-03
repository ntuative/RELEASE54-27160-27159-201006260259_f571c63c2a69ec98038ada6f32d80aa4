package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1791:int;
      
      private var var_1695:int;
      
      private var var_1793:int;
      
      private var var_1795:int;
      
      private var var_1794:int;
      
      private var var_1694:int;
      
      private var var_1792:int;
      
      private var var_1275:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1791;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1695;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1792;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1795;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1794;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1694;
      }
      
      public function get commission() : int
      {
         return var_1793;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1275 = param1.readBoolean();
         var_1793 = param1.readInteger();
         var_1695 = param1.readInteger();
         var_1694 = param1.readInteger();
         var_1795 = param1.readInteger();
         var_1791 = param1.readInteger();
         var_1794 = param1.readInteger();
         var_1792 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1275;
      }
   }
}
