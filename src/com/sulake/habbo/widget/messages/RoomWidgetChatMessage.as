package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_111:int = 0;
      
      public static const const_132:int = 1;
      
      public static const const_109:int = 2;
      
      public static const const_712:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1406:int = 0;
      
      private var var_1842:String = "";
      
      private var var_206:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_206 = param2;
         var_1406 = param3;
         var_1842 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1842;
      }
      
      public function get chatType() : int
      {
         return var_1406;
      }
      
      public function get text() : String
      {
         return var_206;
      }
   }
}
