package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1226:int;
      
      private var var_349:Number;
      
      private var var_1540:int;
      
      private var var_871:int;
      
      private var var_1919:int;
      
      private var var_1920:Boolean;
      
      private var _reportIntervalMillis:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function method_9(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_871;
         var _loc3_:int = getTimer();
         if(var_871 == 1)
         {
            var_349 = param1;
            var_1226 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_871);
            var_349 = var_349 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_1920 && _loc3_ - var_1226 >= _reportIntervalMillis && var_1540 < var_1919)
         {
            _loc5_ = 1000 / var_349;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++var_1540;
            var_1226 = _loc3_;
            var_871 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         _reportIntervalMillis = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         var_1919 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         var_1920 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
