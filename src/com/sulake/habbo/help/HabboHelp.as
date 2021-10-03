package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2240:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_142:TutorialUI;
      
      private var var_802:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_63:HelpUI;
      
      private var var_801:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_669:HotelMergeUI;
      
      private var var_331:IHabboCommunicationManager;
      
      private var var_974:FaqIndex;
      
      private var var_1882:String = "";
      
      private var var_1058:IncomingMessages;
      
      private var var_1431:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1431 = new CallForHelpData();
         var_2240 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_974 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_63 != null)
         {
            var_63.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_63 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_63.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_142 != null)
         {
            var_142.dispose();
            var_142 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1882;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_63 != null)
         {
            var_63.dispose();
            var_63 = null;
         }
         if(var_142 != null)
         {
            var_142.dispose();
            var_142 = null;
         }
         if(var_669)
         {
            var_669.dispose();
            var_669 = null;
         }
         if(var_974 != null)
         {
            var_974.dispose();
            var_974 = null;
         }
         var_1058 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_802)
         {
            var_802.release(new IIDHabboLocalizationManager());
            var_802 = null;
         }
         if(var_331)
         {
            var_331.release(new IIDHabboCommunicationManager());
            var_331 = null;
         }
         if(var_801)
         {
            var_801.release(new IIDHabboConfigurationManager());
            var_801 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_802;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_90:
               if(var_63 != null)
               {
                  var_63.setRoomSessionStatus(true);
               }
               if(var_142 != null)
               {
                  var_142.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_107:
               if(var_63 != null)
               {
                  var_63.setRoomSessionStatus(false);
               }
               if(var_142 != null)
               {
                  var_142.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_63 != null)
         {
            var_63.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2240;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_63 != null)
         {
            var_63.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_669)
         {
            var_669 = new HotelMergeUI(this);
         }
         var_669.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_142 == null && _assetLibrary != null && _windowManager != null)
         {
            var_142 = new TutorialUI(this);
         }
         return var_142 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_63 == null && _assetLibrary != null && _windowManager != null)
         {
            var_63 = new HelpUI(this,_assetLibrary,_windowManager,var_802,_toolbar);
         }
         return var_63 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1431;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1431.reportedUserId = param1;
         var_1431.reportedUserName = param2;
         var_63.showUI(HabboHelpViewEnum.const_310);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1882 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_115,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_802 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_142 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_142.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_331 = IHabboCommunicationManager(param2);
         var_1058 = new IncomingMessages(this,var_331);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_63 != null)
         {
            var_63.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_63 != null)
         {
            var_63.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_331 != null && param1 != null)
         {
            var_331.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_974;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_63 != null)
         {
            var_63.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_801 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_142;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_88)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_57)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_669;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_90,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_107,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_88,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_63 != null)
         {
            var_63.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_801 == null)
         {
            return param1;
         }
         return var_801.getKey(param1,param2,param3);
      }
   }
}
