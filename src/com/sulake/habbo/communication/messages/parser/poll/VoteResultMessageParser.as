package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1368:int;
      
      private var var_1044:String;
      
      private var var_794:Array;
      
      private var var_1076:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_794.slice();
      }
      
      public function flush() : Boolean
      {
         var_1044 = "";
         var_1076 = [];
         var_794 = [];
         var_1368 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1368;
      }
      
      public function get question() : String
      {
         return var_1044;
      }
      
      public function get choices() : Array
      {
         return var_1076.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1044 = param1.readString();
         var_1076 = [];
         var_794 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1076.push(param1.readString());
            var_794.push(param1.readInteger());
            _loc3_++;
         }
         var_1368 = param1.readInteger();
         return true;
      }
   }
}
