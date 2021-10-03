package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1916:int;
      
      private var var_1327:PetData;
      
      private var var_2310:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1916;
      }
      
      public function get petData() : PetData
      {
         return var_1327;
      }
      
      public function flush() : Boolean
      {
         var_1327 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2310;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1916 = param1.readInteger();
         var_2310 = param1.readInteger();
         var_1327 = new PetData(param1);
         return true;
      }
   }
}
