package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1136:int = 31;
      
      private static const const_1135:int = 32;
      
      private static const const_523:int = 30;
      
      private static const const_807:int = 20;
      
      private static const const_524:int = 10;
       
      
      private var var_675:Boolean = false;
      
      private var var_258:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_258 = new Array();
         super();
         super.setAnimation(const_523);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!var_675)
            {
               var_675 = true;
               var_258 = new Array();
               var_258.push(const_1136);
               var_258.push(const_1135);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_524)
         {
            if(var_675)
            {
               var_675 = false;
               var_258 = new Array();
               if(_direction == 2)
               {
                  var_258.push(const_807 + 5 - param1);
                  var_258.push(const_524 + 5 - param1);
               }
               else
               {
                  var_258.push(const_807 + param1);
                  var_258.push(const_524 + param1);
               }
               var_258.push(const_523);
               return;
            }
            super.setAnimation(const_523);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
