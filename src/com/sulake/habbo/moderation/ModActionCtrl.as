package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_138:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_915:IButtonWindow;
      
      private var var_1329:int;
      
      private var _main:ModerationManager;
      
      private var var_749:OffenceCategoryData;
      
      private var var_431:ITextFieldWindow;
      
      private var var_913:IButtonWindow;
      
      private var var_1330:String;
      
      private var var_340:Boolean = true;
      
      private var var_1514:String;
      
      private var var_914:IDropMenuWindow;
      
      private var var_56:IFrameWindow;
      
      private var var_750:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         _main = param1;
         var_1329 = param2;
         var_1514 = param3;
         var_1330 = param4;
         if(var_138 == null)
         {
            var_138 = new Array();
            var_138.push(new BanDefinition("2 hours",2));
            var_138.push(new BanDefinition("4 hours",4));
            var_138.push(new BanDefinition("12 hours",12));
            var_138.push(new BanDefinition("24 hours",24));
            var_138.push(new BanDefinition("2 days",48));
            var_138.push(new BanDefinition("3 days",72));
            var_138.push(new BanDefinition("1 week",168));
            var_138.push(new BanDefinition("2 weeks",336));
            var_138.push(new BanDefinition("3 weeks",504));
            var_138.push(new BanDefinition("1 month",720));
            var_138.push(new BanDefinition("2 months",1440));
            var_138.push(new BanDefinition("1 year",8760));
            var_138.push(new BanDefinition("2 years",17520));
            var_138.push(new BanDefinition("Permanent",100000));
         }
         var_915 = IButtonWindow(_main.getXmlWindow("modact_offence"));
         var_913 = IButtonWindow(_main.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!isMsgGiven())
         {
            return;
         }
         if(this.var_914.selection < 0)
         {
            _main.windowManager.alert("Alert","You must select ban lenght",0,onAlertClose);
            return;
         }
         _main.connection.send(new ModBanMessageComposer(var_1329,var_431.text,getBanLength(),var_1330));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1514;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_226)
         {
            return;
         }
         if(!var_340)
         {
            return;
         }
         var_431.text = "";
         var_340 = false;
      }
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_914.selection;
         var _loc2_:BanDefinition = var_138[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_138)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(var_56.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_56 != null)
         {
            var_56.destroy();
            var_56 = null;
         }
         if(var_915 != null)
         {
            var_915.destroy();
            var_915 = null;
         }
         if(var_913 != null)
         {
            var_913.destroy();
            var_913 = null;
         }
         var_914 = null;
         var_431 = null;
         _main = null;
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!isMsgGiven())
         {
            return;
         }
         _main.connection.send(new ModAlertMessageComposer(var_1329,var_431.text,var_1330));
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1359;
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_750 != null)
         {
            var_750 = null;
         }
         else
         {
            var_749 = null;
         }
         this.refreshCategorization();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_749 = _main.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_56;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(var_340 || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return false;
         }
         return true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!isMsgGiven())
         {
            return;
         }
         _main.connection.send(new ModKickMessageComposer(var_1329,var_431.text,var_1330));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_56.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = var_749 != null;
         if(this.var_750 != null)
         {
            var_56.findChildByName("offence_txt").caption = this.var_750.name;
            var_56.findChildByName("offence_category").visible = true;
         }
         else if(this.var_749 != null)
         {
            this.refreshButtons("offences_cont",2,var_749.offences,var_915,onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,_main.initMsg.offenceCategories,var_913,onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_750 = var_749.offences[_loc3_];
         var_431.text = var_750.msg;
         var_340 = false;
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         var_56 = IFrameWindow(_main.getXmlWindow("modact_summary"));
         var_56.caption = "Mod action on: " + var_1514;
         var_56.findChildByName("send_caution_but").procedure = onSendCautionButton;
         var_56.findChildByName("kick_but").procedure = onKickButton;
         var_56.findChildByName("ban_but").procedure = onBanButton;
         var_56.findChildByName("change_categorization_but").procedure = onChangeCategorizationButton;
         _main.disableButton(_main.initMsg.alertPermission,var_56,"send_caution_but");
         _main.disableButton(_main.initMsg.kickPermission,var_56,"kick_but");
         _main.disableButton(_main.initMsg.banPermission,var_56,"ban_but");
         var_431 = ITextFieldWindow(var_56.findChildByName("message_input"));
         var_431.procedure = onInputClick;
         var_914 = IDropMenuWindow(var_56.findChildByName("banLengthSelect"));
         prepareBanSelect(var_914);
         var _loc1_:IWindow = var_56.findChildByTag("close");
         _loc1_.procedure = onClose;
         refreshCategorization();
         var_56.visible = true;
      }
   }
}
