package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2032:Boolean;
      
      private var var_2033:int;
      
      private var _offerId:int;
      
      private var var_1822:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2032 = param1.readBoolean();
         var_2033 = param1.readInteger();
         var_1822 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1822;
      }
      
      public function get isVip() : Boolean
      {
         return var_2032;
      }
      
      public function get daysRequired() : int
      {
         return var_2033;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
