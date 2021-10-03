package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1958:String;
      
      private var var_1252:String;
      
      private var var_1959:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1959 = param1;
         var_1252 = param2;
         var_1958 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1959,var_1252,var_1958];
      }
      
      public function dispose() : void
      {
      }
   }
}
