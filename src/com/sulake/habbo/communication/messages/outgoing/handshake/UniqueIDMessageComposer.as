package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UniqueIDMessageComposer implements IMessageComposer
   {
       
      
      private var var_942:String;
      
      public function UniqueIDMessageComposer(param1:String)
      {
         super();
         var_942 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_942];
      }
      
      public function dispose() : void
      {
      }
   }
}
