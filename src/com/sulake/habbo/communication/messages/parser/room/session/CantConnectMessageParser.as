package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1710:int = 2;
      
      public static const const_1218:int = 4;
      
      public static const const_1374:int = 1;
      
      public static const const_1420:int = 3;
       
      
      private var var_1085:int = 0;
      
      private var var_893:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1085;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1085 = param1.readInteger();
         if(var_1085 == 3)
         {
            var_893 = param1.readString();
         }
         else
         {
            var_893 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1085 = 0;
         var_893 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_893;
      }
   }
}
