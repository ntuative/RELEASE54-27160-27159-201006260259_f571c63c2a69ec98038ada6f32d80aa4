package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2158:String;
      
      private var var_620:String;
      
      private var var_1541:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1541 = param1.readInteger();
         var_2158 = param1.readString();
         var_620 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_620;
      }
      
      public function get figureString() : String
      {
         return var_2158;
      }
      
      public function get slotId() : int
      {
         return var_1541;
      }
   }
}
