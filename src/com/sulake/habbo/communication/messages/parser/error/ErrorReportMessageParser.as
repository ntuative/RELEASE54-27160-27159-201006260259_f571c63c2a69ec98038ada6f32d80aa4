package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1255:int;
      
      private var var_1246:int;
      
      private var var_1256:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1255;
      }
      
      public function flush() : Boolean
      {
         var_1246 = 0;
         var_1255 = 0;
         var_1256 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1246;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1255 = param1.readInteger();
         var_1246 = param1.readInteger();
         var_1256 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1256;
      }
   }
}
