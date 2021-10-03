package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_757:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_489:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_757);
         var_489 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_489;
      }
   }
}
