package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_649:int = -1;
      
      public static const const_997:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2367:int = -1;
      
      private var var_91:int = 0;
      
      private var var_1472:int = 1;
      
      private var var_1004:int = 1;
      
      private var var_2369:Boolean = false;
      
      private var var_2368:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_91 = param2;
         _y = param3;
         var_2369 = param5;
         if(param4 < 0)
         {
            param4 = const_649;
         }
         var_1004 = param4;
         var_1472 = param4;
         if(param6 >= 0)
         {
            var_2367 = param6;
            var_2368 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_1004 > 0 && param1 > var_1004)
         {
            param1 = var_1004;
         }
         var_1472 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_1004;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2368;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_1004 < 0)
         {
            return const_649;
         }
         return var_1472;
      }
      
      public function get activeSequence() : int
      {
         return var_2367;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2369;
      }
      
      public function get x() : int
      {
         return var_91;
      }
   }
}
