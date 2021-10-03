package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1557:String;
      
      private var var_2338:int;
      
      private var var_2335:int;
      
      private var var_2336:int;
      
      private var var_2337:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2338 = param1.readInteger();
         var_2336 = param1.readInteger();
         var_2335 = param1.readInteger();
         var_2337 = param1.readString();
         var_1557 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1557;
      }
      
      public function get hour() : int
      {
         return var_2338;
      }
      
      public function get minute() : int
      {
         return var_2336;
      }
      
      public function get chatterName() : String
      {
         return var_2337;
      }
      
      public function get chatterId() : int
      {
         return var_2335;
      }
   }
}
