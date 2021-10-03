package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_694:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_164:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         var_164 = param2;
      }
      
      public function get objectId() : int
      {
         return var_164;
      }
   }
}
