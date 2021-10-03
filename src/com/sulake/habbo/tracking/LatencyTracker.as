package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_168:Array;
      
      private var var_37:Boolean = false;
      
      private var var_1688:int = 0;
      
      private var var_1687:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_576:Map;
      
      private var var_2287:int = 0;
      
      private var var_1689:int = 0;
      
      private var var_135:IHabboConfigurationManager;
      
      private var var_1445:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1686:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_37)
         {
            return;
         }
         if(getTimer() - var_1688 > var_1687)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1688 = getTimer();
         var_576.add(var_1445,var_1688);
         _connection.send(new LatencyPingRequestMessageComposer(var_1445));
         ++var_1445;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_135 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1687 = int(var_135.getKey("latencytest.interval"));
         var_1686 = int(var_135.getKey("latencytest.report.index"));
         var_2287 = int(var_135.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1687 < 1)
         {
            return;
         }
         var_576 = new Map();
         var_168 = new Array();
         var_37 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_576 == null || var_168 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_576.getValue(_loc2_.requestId);
         var_576.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_168.push(_loc4_);
         if(var_168.length == var_1686 && var_1686 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_168.length)
            {
               _loc5_ += var_168[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_168.length)
            {
               if(var_168[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_168[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_168 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1689) > var_2287 || var_1689 == 0)
            {
               var_1689 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_168.length);
               _connection.send(_loc11_);
            }
            var_168 = [];
         }
      }
      
      public function dispose() : void
      {
         var_37 = false;
         var_135 = null;
         _communication = null;
         _connection = null;
         if(var_576 != null)
         {
            var_576.dispose();
            var_576 = null;
         }
         var_168 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_135 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
