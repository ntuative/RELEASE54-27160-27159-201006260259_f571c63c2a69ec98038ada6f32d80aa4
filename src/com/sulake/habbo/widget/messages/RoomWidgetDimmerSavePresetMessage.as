package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_731:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2260:int;
      
      private var var_2259:int;
      
      private var var_2258:Boolean;
      
      private var var_1122:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_731);
         var_2259 = param1;
         var_2260 = param2;
         _color = param3;
         var_1122 = param4;
         var_2258 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2260;
      }
      
      public function get presetNumber() : int
      {
         return var_2259;
      }
      
      public function get brightness() : int
      {
         return var_1122;
      }
      
      public function get apply() : Boolean
      {
         return var_2258;
      }
   }
}
