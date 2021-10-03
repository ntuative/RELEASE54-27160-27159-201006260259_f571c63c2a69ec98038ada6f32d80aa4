package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1135:int = -1;
      
      private static const const_807:int = 20;
      
      private static const const_524:int = 9;
       
      
      private var var_675:Boolean = false;
      
      private var var_258:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_258 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_675)
            {
               var_675 = true;
               var_258 = new Array();
               var_258.push(const_1135);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_675)
            {
               var_675 = false;
               var_258 = new Array();
               var_258.push(const_807);
               var_258.push(const_524 + param1);
               var_258.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
