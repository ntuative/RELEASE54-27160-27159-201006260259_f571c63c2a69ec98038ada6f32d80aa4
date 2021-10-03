package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1108:Boolean;
      
      private var var_1466:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1108 = param1.readInteger() > 0;
         var_1466 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1108;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1466;
      }
      
      public function flush() : Boolean
      {
         var_1108 = false;
         var_1466 = false;
         return true;
      }
   }
}
