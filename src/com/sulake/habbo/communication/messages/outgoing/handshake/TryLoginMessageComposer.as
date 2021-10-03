package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class TryLoginMessageComposer implements IMessageComposer
   {
       
      
      private var var_1917:String;
      
      private var _password:String;
      
      private var _userId:int;
      
      public function TryLoginMessageComposer(param1:String, param2:String, param3:int)
      {
         super();
         var_1917 = param1;
         _password = param2;
         _userId = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1917,_password,_userId];
      }
      
      public function dispose() : void
      {
      }
   }
}
