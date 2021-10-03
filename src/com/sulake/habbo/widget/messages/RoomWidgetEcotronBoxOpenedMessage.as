package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1332:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1434:int;
      
      private var var_1088:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_1088 = param2;
         var_1434 = param3;
      }
      
      public function get classId() : int
      {
         return var_1434;
      }
      
      public function get itemType() : String
      {
         return var_1088;
      }
   }
}
