package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1745:int;
      
      private var var_1392:int;
      
      private var var_1744:int;
      
      private var _offerId:int;
      
      private var var_1748:int;
      
      private var var_1749:int;
      
      private var var_1750:Boolean;
      
      private var var_1743:int;
      
      private var var_1747:Boolean;
      
      private var var_1448:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1448 = param1.readString();
         var_1392 = param1.readInteger();
         var_1747 = param1.readBoolean();
         var_1750 = param1.readBoolean();
         var_1744 = param1.readInteger();
         var_1743 = param1.readInteger();
         var_1748 = param1.readInteger();
         var_1745 = param1.readInteger();
         var_1749 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1748;
      }
      
      public function get month() : int
      {
         return var_1745;
      }
      
      public function get price() : int
      {
         return var_1392;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1744;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1743;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1747;
      }
      
      public function get day() : int
      {
         return var_1749;
      }
      
      public function get vip() : Boolean
      {
         return var_1750;
      }
      
      public function get productCode() : String
      {
         return var_1448;
      }
   }
}
