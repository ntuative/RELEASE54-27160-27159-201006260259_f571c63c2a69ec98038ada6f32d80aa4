package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_753:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_206:String;
      
      private var var_705:String;
      
      private var var_1513:String;
      
      private var var_164:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_164 = param2;
         var_1513 = param3;
         var_206 = param4;
         var_705 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1513;
      }
      
      public function get colorHex() : String
      {
         return var_705;
      }
      
      public function get text() : String
      {
         return var_206;
      }
      
      public function get objectId() : int
      {
         return var_164;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
