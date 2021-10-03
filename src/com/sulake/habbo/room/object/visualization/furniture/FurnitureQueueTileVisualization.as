package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1163:int = 1;
      
      private static const const_1135:int = 3;
      
      private static const const_1162:int = 2;
      
      private static const const_1161:int = 15;
       
      
      private var var_986:int;
      
      private var var_258:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_258 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1162)
         {
            var_258 = new Array();
            var_258.push(const_1163);
            var_986 = const_1161;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_986 > 0)
         {
            --var_986;
         }
         if(var_986 == 0)
         {
            if(false)
            {
               super.setAnimation(var_258.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
