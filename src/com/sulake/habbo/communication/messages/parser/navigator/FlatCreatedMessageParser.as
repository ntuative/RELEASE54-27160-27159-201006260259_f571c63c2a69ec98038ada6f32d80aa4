package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_2157:String;
      
      private var var_453:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_2157;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_453 = param1.readInteger();
         this.var_2157 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_453 + ", " + this.var_2157);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_453;
      }
   }
}
