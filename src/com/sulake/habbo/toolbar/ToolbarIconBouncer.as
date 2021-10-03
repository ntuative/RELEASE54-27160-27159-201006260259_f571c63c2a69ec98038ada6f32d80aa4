package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2249:Number;
      
      private var var_674:Number = 0;
      
      private var var_2248:Number;
      
      private var var_673:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2249 = param1;
         var_2248 = param2;
      }
      
      public function update() : void
      {
         var_673 += var_2248;
         var_674 += var_673;
         if(var_674 > 0)
         {
            var_674 = 0;
            var_673 = var_2249 * -1 * var_673;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_673 = param1;
         var_674 = 0;
      }
      
      public function get location() : Number
      {
         return var_674;
      }
   }
}
