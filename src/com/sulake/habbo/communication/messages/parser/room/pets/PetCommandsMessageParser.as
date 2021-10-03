package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1046:Array;
      
      private var var_1271:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1271 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_1046 = new Array();
         while(_loc2_-- > 0)
         {
            var_1046.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_1046;
      }
      
      public function get petId() : int
      {
         return var_1271;
      }
      
      public function flush() : Boolean
      {
         var_1271 = -1;
         var_1046 = null;
         return true;
      }
   }
}
