package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_453:int;
      
      private var var_1349:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_453;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_453 = param1.readInteger();
         var_1349 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_453 = 0;
         var_1349 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1349;
      }
   }
}
