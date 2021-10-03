package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_967:String = "select_outfit";
       
      
      private var var_2270:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_967);
         var_2270 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2270;
      }
   }
}
