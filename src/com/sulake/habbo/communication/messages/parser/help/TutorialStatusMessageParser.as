package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1091:Boolean;
      
      private var var_1090:Boolean;
      
      private var var_1089:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1091;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1090;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1089 = param1.readBoolean();
         var_1090 = param1.readBoolean();
         var_1091 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1089;
      }
      
      public function flush() : Boolean
      {
         var_1089 = false;
         var_1090 = false;
         var_1091 = false;
         return true;
      }
   }
}
