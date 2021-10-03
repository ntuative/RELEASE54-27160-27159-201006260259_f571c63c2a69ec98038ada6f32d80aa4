package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1193:PetData;
      
      private var var_1718:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1718 = param1.readBoolean();
         var_1193 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1718 + ", " + var_1193.id + ", " + var_1193.name + ", " + pet.figure + ", " + var_1193.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1718;
      }
      
      public function get pet() : PetData
      {
         return var_1193;
      }
   }
}
