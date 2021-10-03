package com.sulake.habbo.communication.messages.outgoing.room.pets
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetPetInfoMessageComposer implements IMessageComposer
   {
       
      
      private var var_1271:int;
      
      public function GetPetInfoMessageComposer(param1:int)
      {
         super();
         var_1271 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1271];
      }
      
      public function dispose() : void
      {
      }
   }
}
