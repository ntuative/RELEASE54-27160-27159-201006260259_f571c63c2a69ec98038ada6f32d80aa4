package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_620:String = "me_menu_sound_settings";
      
      public static const const_565:String = "me_menu_settings_view";
      
      public static const const_103:String = "me_menu_top_view";
      
      public static const const_1210:String = "me_menu_rooms_view";
      
      public static const const_932:String = "me_menu_dance_moves_view";
      
      public static const const_288:String = "me_menu_my_clothes_view";
      
      public static const const_691:String = "me_menu_effects_view";
       
      
      private var var_2141:Boolean = false;
      
      private var var_429:Boolean = false;
      
      private var var_1622:int = 0;
      
      private var var_68:IEventDispatcher;
      
      private var var_1623:int = 0;
      
      private var var_2140:int = 0;
      
      private var var_2139:Boolean = false;
      
      private var var_284:Boolean = false;
      
      private var var_2142:int = 0;
      
      private var var_2143:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_658:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1367:int = 0;
      
      private var var_2144:Boolean = false;
      
      private var var_1131:Point;
      
      private var var_35:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1131 = new Point(0,0);
         var_68 = param4;
         if(param5 != null && false)
         {
            var_2144 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_103);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_765,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_737,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_667,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_640,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_314,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_763,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_633,onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_196,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_228,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_701,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_222,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_300,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_100,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_431,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_164,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_288)
         {
            changeView(const_103);
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_429)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_658;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_284)
         {
            return;
         }
         if(var_35.window.name == const_620)
         {
            (var_35 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1367 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1623 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1623.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_284 && var_35.window.name == const_288))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_593);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_765,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_737,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_667,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_640,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_314,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_196,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_228,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_701,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_763,onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_633,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_222,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_300,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_431,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_100,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_164,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         var_68 = null;
         if(var_35 != null)
         {
            var_35.dispose();
            var_35 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2141;
      }
      
      public function get creditBalance() : int
      {
         return var_1623;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_2143 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_431:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_284 + " view: " + var_35.window.name);
               if(var_284 != true || var_35.window.name != const_103)
               {
                  return;
               }
               (var_35 as MeMenuMainView).setIconAssets("clothes_icon",const_103,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_100:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_2139;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_2143 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2140;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_658 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_658 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1367;
         var_1367 = param1.daysLeft;
         var_2140 = param1.periodsLeft;
         var_2142 = param1.pastPeriods;
         var_2141 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1622);
         var_1622 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_35 != null)
            {
               changeView(var_35.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2139 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_35 != null && var_35.window.name != const_288)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1258,HabboWindowStyle.const_926,HabboWindowParam.const_34,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_658 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_658 = true;
            }
         }
         if(var_35 != null && var_35.window.name == const_691)
         {
            (var_35 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2142;
      }
      
      public function get habboClubDays() : int
      {
         return var_1367;
      }
      
      public function updateSize() : void
      {
         if(var_35 != null)
         {
            var_1131.x = var_35.window.width + 10;
            var_1131.y = var_35.window.height;
            var_35.window.x = 5;
            var_35.window.y = 0;
            _mainContainer.width = var_1131.x;
            _mainContainer.height = var_1131.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_284 = !var_284;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_284 = false;
               break;
            default:
               return;
         }
         if(var_284)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_708);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_35 != null)
         {
            _mainContainer.removeChild(var_35.window);
            var_35.dispose();
            var_35 = null;
         }
         var_284 = false;
         var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_288)
         {
            changeView(const_103);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2144;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_103:
               _loc2_ = new MeMenuMainView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_691:
               _loc2_ = new MeMenuEffectsView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_932:
               _loc2_ = new MeMenuDanceView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_288:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1210:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_565:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_620:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_35 != null)
            {
               _mainContainer.removeChild(var_35.window);
               var_35.dispose();
               var_35 = null;
            }
            var_35 = _loc2_;
            var_35.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1622;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_103);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_613);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_284 = true;
      }
   }
}
