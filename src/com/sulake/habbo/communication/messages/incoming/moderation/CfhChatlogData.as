package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1894:int;
      
      private var var_1075:int;
      
      private var var_2189:int;
      
      private var var_1651:int;
      
      private var var_116:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1651 = param1.readInteger();
         var_2189 = param1.readInteger();
         var_1075 = param1.readInteger();
         var_1894 = param1.readInteger();
         var_116 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1651);
      }
      
      public function get chatRecordId() : int
      {
         return var_1894;
      }
      
      public function get reportedUserId() : int
      {
         return var_1075;
      }
      
      public function get callerUserId() : int
      {
         return var_2189;
      }
      
      public function get callId() : int
      {
         return var_1651;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_116;
      }
   }
}
