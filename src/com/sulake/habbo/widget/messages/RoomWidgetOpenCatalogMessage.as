package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_943:String = "RWOCM_CLUB_MAIN";
      
      public static const const_601:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1973:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_601);
         var_1973 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1973;
      }
   }
}
