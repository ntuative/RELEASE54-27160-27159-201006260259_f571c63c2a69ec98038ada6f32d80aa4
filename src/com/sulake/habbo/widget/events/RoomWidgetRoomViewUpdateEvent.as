package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_531:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_645:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_263:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1566:Point;
      
      private var var_1567:Rectangle;
      
      private var var_154:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1567 = param2;
         var_1566 = param3;
         var_154 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1567 != null)
         {
            return var_1567.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_154;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1566 != null)
         {
            return var_1566.clone();
         }
         return null;
      }
   }
}
