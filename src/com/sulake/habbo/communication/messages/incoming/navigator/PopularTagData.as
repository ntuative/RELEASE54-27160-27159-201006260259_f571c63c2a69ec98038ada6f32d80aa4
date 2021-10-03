package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_2152:int;
      
      private var var_2355:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_2355 = param1.readString();
         var_2152 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_2355;
      }
      
      public function get userCount() : int
      {
         return var_2152;
      }
   }
}
