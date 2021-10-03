package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1509:GarbageMonitor = null;
      
      private var var_1226:int = 0;
      
      private var var_1346:Boolean = false;
      
      private var var_1762:String = "";
      
      private var var_1508:String = "";
      
      private var var_349:Number = 0;
      
      private var var_1224:int = 10;
      
      private var var_2440:Array;
      
      private var var_698:int = 0;
      
      private var var_1223:int = 60;
      
      private var var_1042:int = 0;
      
      private var var_1043:int = 0;
      
      private var var_2041:String = "";
      
      private var var_1765:Number = 0;
      
      private var var_1227:int = 1000;
      
      private var var_1763:Boolean = true;
      
      private var var_1761:Number = 0.15;
      
      private var var_135:IHabboConfigurationManager = null;
      
      private var var_1764:String = "";
      
      private var var_1225:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2440 = [];
         super();
         var_1508 = Capabilities.version;
         var_1762 = Capabilities.os;
         var_1346 = Capabilities.isDebugger;
         var_1764 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1509 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1226 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1509.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1509.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_349;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1223 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1508;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1043;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1227)
         {
            ++var_1042;
            _loc3_ = true;
         }
         else
         {
            ++var_698;
            if(var_698 <= 1)
            {
               var_349 = param1;
            }
            else
            {
               _loc4_ = Number(var_698);
               var_349 = var_349 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1226 > var_1223 * 1000 && var_1225 < var_1224)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_349);
            _loc5_ = true;
            if(var_1763 && var_1225 > 0)
            {
               _loc6_ = differenceInPercents(var_1765,var_349);
               if(_loc6_ < var_1761)
               {
                  _loc5_ = false;
               }
            }
            var_1226 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1765 = var_349;
               if(sendReport())
               {
                  ++var_1225;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1224 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1227 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1764,var_1508,var_1762,var_2041,var_1346,_loc4_,_loc3_,var_1043,var_349,var_1042);
            _connection.send(_loc1_);
            var_1043 = 0;
            var_349 = 0;
            var_698 = 0;
            var_1042 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_135 = param1;
         var_1223 = int(var_135.getKey("performancetest.interval","60"));
         var_1227 = int(var_135.getKey("performancetest.slowupdatelimit","1000"));
         var_1224 = int(var_135.getKey("performancetest.reportlimit","10"));
         var_1761 = Number(var_135.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1763 = Boolean(int(var_135.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
