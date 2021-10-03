package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2112:Number = 0.0;
      
      private var var_2111:Number = 0.0;
      
      private var var_2113:Number = 0.0;
      
      private var var_2110:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2111 = param1;
         var_2113 = param2;
         var_2112 = param3;
         var_2110 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2111;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2112;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2113;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2110;
      }
   }
}
