package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDisplayObjectWrapper;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.friendlist.events.FriendRequestEvent;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.RoomVariableEnum;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.IRoomWidget;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.filters.DisplacementMapFilterMode;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomDesktop implements IRoomDesktop, IRoomWidgetMessageListener, IRoomWidgetHandlerContainer
   {
      
      public static const const_612:int = -1;
       
      
      private var var_1278:IHabboAvatarEditor = null;
      
      private var var_180:DesktopLayoutManager;
      
      private var _events:EventDispatcher;
      
      private var _toolbar:IHabboToolbar = null;
      
      private var var_1263:Boolean = true;
      
      private var var_31:IRoomSession = null;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1261:Boolean = true;
      
      private var var_881:IHabboTracking;
      
      private var var_55:Map;
      
      private var var_882:IHabboHelp = null;
      
      private var _connection:IConnection = null;
      
      private var var_540:IHabboSoundManager;
      
      private var var_1871:Boolean = false;
      
      private var var_1262:int = 0;
      
      private var var_270:IAdManager = null;
      
      private var var_860:IRoomWidgetFactory = null;
      
      private var _localization:IHabboLocalizationManager = null;
      
      private var var_21:IRoomSessionManager = null;
      
      private var _roomEngine:IRoomEngine = null;
      
      private var _windowManager:IHabboWindowManager = null;
      
      private var var_454:IAvatarRenderManager = null;
      
      private var _assets:IAssetLibrary = null;
      
      private var var_610:Map;
      
      private var var_713:Array;
      
      private var var_728:IHabboModeration;
      
      private var var_181:IToolTipWindow;
      
      private var var_375:ISessionDataManager = null;
      
      private var var_1872:uint = 16777215;
      
      private var _navigator:IHabboNavigator = null;
      
      private var _catalog:IHabboCatalog = null;
      
      private var var_14:IHabboInventory = null;
      
      private var var_266:Array;
      
      private var var_611:Map;
      
      private var var_416:Map;
      
      private var _friendList:IHabboFriendList = null;
      
      public function RoomDesktop(param1:IRoomSession, param2:IAssetLibrary, param3:IConnection)
      {
         var_266 = [];
         super();
         _events = new EventDispatcher();
         var_31 = param1;
         _assets = param2;
         _connection = param3;
         var_55 = new Map();
         var_416 = new Map();
         var_610 = new Map();
         var_611 = new Map();
         var_180 = new DesktopLayoutManager();
      }
      
      public function set roomEngine(param1:IRoomEngine) : void
      {
         _roomEngine = param1;
         if(_roomEngine != null && false)
         {
            _roomEngine.events.addEventListener(RoomContentLoadedEvent.const_330,onRoomContentLoaded);
            _roomEngine.events.addEventListener(RoomContentLoadedEvent.const_491,onRoomContentLoaded);
            _roomEngine.events.addEventListener(RoomContentLoadedEvent.const_584,onRoomContentLoaded);
         }
      }
      
      public function set toolbar(param1:IHabboToolbar) : void
      {
         _toolbar = param1;
         _toolbar.events.addEventListener(HabboToolbarEvent.TOOLBAR_ORIENTATION,onToolbarRepositionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
      }
      
      private function getSpectatorModeVisualization() : IWindow
      {
         var _loc1_:XmlAsset = _assets.getAssetByName("spectator_mode_xml") as XmlAsset;
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IWindowContainer = _windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         if(_loc2_ == null)
         {
            return null;
         }
         setBitmap(_loc2_.findChildByName("top_left"),"spec_top_left_png");
         setBitmap(_loc2_.findChildByName("top_middle"),"spec_top_middle_png");
         setBitmap(_loc2_.findChildByName("top_right"),"spec_top_right_png");
         setBitmap(_loc2_.findChildByName("middle_left"),"spec_middle_left_png");
         setBitmap(_loc2_.findChildByName("middle_right"),"spec_middle_right_png");
         setBitmap(_loc2_.findChildByName("bottom_left"),"spec_bottom_left_png");
         setBitmap(_loc2_.findChildByName("bottom_middle"),"spec_bottom_middle_png");
         setBitmap(_loc2_.findChildByName("bottom_right"),"spec_bottom_right_png");
         return _loc2_;
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window;
         _roomEngine.modifyRoomCanvas(var_31.roomId,var_31.roomCategory,var_266[0],_loc2_.width,_loc2_.height);
         var _loc3_:String = "null";
         events.dispatchEvent(new RoomWidgetRoomViewUpdateEvent(_loc3_,_loc2_.rectangle));
      }
      
      public function get roomWidgetFactory() : IRoomWidgetFactory
      {
         return var_860;
      }
      
      public function set adManager(param1:IAdManager) : void
      {
         var_270 = param1;
      }
      
      private function getBitmapFilter(param1:int, param2:int) : BitmapFilter
      {
         var _loc3_:BitmapData = new BitmapData(param1,param2);
         _loc3_.perlinNoise(param1,param2,5,Math.random() * 2000000000,true,false);
         var _loc4_:Point = new Point(0,0);
         var _loc5_:int = 0;
         var _loc6_:uint = _loc5_;
         var _loc7_:uint = _loc5_;
         var _loc8_:Number = param1 / 20;
         var _loc9_:Number = -param1 / 25;
         var _loc10_:String = "null";
         return new DisplacementMapFilter(_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,0,0);
      }
      
      public function init() : void
      {
         if(_roomEngine != null && var_31 != null)
         {
            var_713 = _roomEngine.loadRoomResources(var_31.roomResources);
            if(false)
            {
               var_1263 = false;
               processEvent(new RoomWidgetLoadingBarUpdateEvent(RoomWidgetLoadingBarUpdateEvent.const_92));
            }
         }
         if(var_270 != null && true)
         {
            var_1261 = !var_270.showInterstitial();
         }
         checkInterrupts();
      }
      
      public function get events() : IEventDispatcher
      {
         return _events;
      }
      
      public function set roomWidgetFactory(param1:IRoomWidgetFactory) : void
      {
         var_860 = param1;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(_roomEngine != null && var_31 != null)
         {
            _loc2_ = _roomEngine.getRoomCanvasGeometry(var_31.roomId,var_31.roomCategory,getFirstCanvasId());
            if(_loc2_ != null)
            {
               trackZoomTime(_loc2_.isZoomedIn());
            }
         }
         var _loc1_:int = 0;
         if(var_266 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_266.length)
            {
               _loc3_ = 0;
               _loc4_ = getWindowName(_loc3_);
               if(_windowManager)
               {
                  _windowManager.removeWindow(_loc4_);
               }
               _loc1_++;
            }
         }
         if(var_55 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_55.length)
            {
               _loc5_ = var_55.getWithIndex(_loc1_) as IRoomWidget;
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
               _loc1_++;
            }
            var_55.dispose();
            var_55 = null;
         }
         if(var_416 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_416.length)
            {
               _loc6_ = var_416.getWithIndex(_loc1_) as IRoomWidgetHandler;
               if(_loc6_ != null)
               {
                  _loc6_.dispose();
               }
               _loc1_++;
            }
            var_416.dispose();
            var_416 = null;
         }
         if(var_610 != null)
         {
            var_610.dispose();
            var_610 = null;
         }
         if(var_611 != null)
         {
            var_611.dispose();
            var_611 = null;
         }
         _assets = null;
         var_454 = null;
         var_266 = null;
         _events = null;
         if(_friendList && false)
         {
            _friendList.events.removeEventListener(FriendRequestEvent.const_50,processEvent);
            _friendList.events.removeEventListener(FriendRequestEvent.const_256,processEvent);
         }
         _friendList = null;
         var_180.dispose();
         var_180 = null;
         if(_roomEngine != null && false)
         {
            _roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_330,onRoomContentLoaded);
            _roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_491,onRoomContentLoaded);
            _roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_584,onRoomContentLoaded);
         }
         _roomEngine = null;
         var_21 = null;
         var_860 = null;
         var_31 = null;
         var_375 = null;
         _windowManager = null;
         var_14 = null;
         if(_toolbar && false)
         {
            _toolbar.events.removeEventListener(HabboToolbarEvent.TOOLBAR_ORIENTATION,onToolbarRepositionEvent);
            _toolbar.events.removeEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
         }
         _toolbar = null;
         _localization = null;
         _config = null;
         var_540 = null;
         if(var_181 != null)
         {
            var_181.dispose();
            var_181 = null;
         }
      }
      
      public function initializeWidget(param1:String, param2:int) : void
      {
         var _loc3_:IRoomWidget = var_55[param1];
         if(_loc3_ == null)
         {
            trace("Tried to initialize an unknown widget " + param1);
            return;
         }
         _loc3_.initialize(param2);
      }
      
      public function get avatarEditor() : IHabboAvatarEditor
      {
         return var_1278;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function set catalog(param1:IHabboCatalog) : void
      {
         _catalog = param1;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return var_375;
      }
      
      public function get moderation() : IHabboModeration
      {
         return var_728;
      }
      
      public function set localization(param1:IHabboLocalizationManager) : void
      {
         _localization = param1;
      }
      
      public function set windowManager(param1:IHabboWindowManager) : void
      {
         _windowManager = param1;
      }
      
      public function get roomSession() : IRoomSession
      {
         return var_31;
      }
      
      public function setInterstitialCompleted() : void
      {
         var_1261 = true;
         checkInterrupts();
      }
      
      private function setBitmap(param1:IWindow, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         if(_loc3_ == null || _assets == null)
         {
            return;
         }
         var _loc4_:BitmapDataAsset = _assets.getAssetByName(param2) as BitmapDataAsset;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:BitmapData = _loc4_.content as BitmapData;
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.bitmap = _loc5_.clone();
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      public function set soundManager(param1:IHabboSoundManager) : void
      {
         var_540 = param1;
      }
      
      public function set avatarEditor(param1:IHabboAvatarEditor) : void
      {
         var_1278 = param1;
      }
      
      private function resizeColorizer(param1:WindowEvent) : void
      {
         var _loc2_:IDisplayObjectWrapper = param1.target as IDisplayObjectWrapper;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Sprite = _loc2_.getDisplayObject() as Sprite;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.graphics.clear();
         _loc3_.graphics.beginFill(var_1872);
         _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc3_.graphics.endFill();
      }
      
      private function updateHandlers() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < var_416.length)
         {
            _loc2_ = var_416.getWithIndex(_loc1_) as IRoomWidgetHandler;
            if(_loc2_ != null)
            {
               _loc2_.update();
            }
            _loc1_++;
         }
      }
      
      public function set layout(param1:XML) : void
      {
         var_180.setLayout(param1,_windowManager);
         if(_toolbar != null)
         {
            var_180.toolbarSize = _toolbar.size;
            var_180.toolbarOrientation = _toolbar.orientation;
         }
      }
      
      public function set moderation(param1:IHabboModeration) : void
      {
         var_728 = param1;
      }
      
      public function get friendList() : IHabboFriendList
      {
         return _friendList;
      }
      
      public function canvasMouseHandler(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(_roomEngine == null || var_31 == null)
         {
            return;
         }
         var _loc2_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = "";
         switch(_loc2_.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_280:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_49:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_250:
               _loc3_ = "null";
               break;
            default:
               return;
         }
         var _loc4_:IDisplayObjectWrapper = _loc2_.target as IDisplayObjectWrapper;
         if(_loc4_ == _loc2_.target)
         {
            _loc5_ = new Point();
            _loc4_.getGlobalPosition(_loc5_);
            _loc6_ = _loc2_.stageX - _loc5_.x;
            _loc7_ = _loc2_.stageY - _loc5_.y;
            _roomEngine.setActiveRoom(var_31.roomId,var_31.roomCategory);
            _roomEngine.handleRoomCanvasMouseEvent(var_266[0],_loc6_,_loc7_,_loc3_,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown);
         }
         if(_loc3_ == MouseEvent.MOUSE_MOVE && var_181 != null)
         {
            _loc8_ = new Point(_loc2_.stageX,_loc2_.stageY);
            _loc8_.offset(0,15);
            var_181.setGlobalPosition(_loc8_);
         }
      }
      
      public function createWidget(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(var_860 == null)
         {
            return;
         }
         _loc2_ = var_860.createWidget(param1);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.messageListener = this;
         _loc2_.registerUpdateEvents(_events);
         var_180.addWidgetWindow(_loc2_.mainWindow);
         if(!var_55.add(param1,_loc2_))
         {
            _loc2_.dispose();
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_354:
               _loc5_ = new ChatWidgetHandler();
               _loc5_.connection = _connection;
               _loc3_ = _loc5_ as IRoomWidgetHandler;
               break;
            case RoomWidgetEnum.const_457:
               _loc3_ = new InfoStandWidgetHandler();
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               _loc3_ = new ChatInputWidgetHandler();
               break;
            case RoomWidgetEnum.const_480:
               _loc3_ = new MeMenuWidgetHandler();
               break;
            case RoomWidgetEnum.const_727:
               _loc3_ = new PlaceholderWidgetHandler();
               break;
            case RoomWidgetEnum.const_459:
               _loc3_ = new FurnitureCreditWidgetHandler();
               break;
            case RoomWidgetEnum.const_448:
               _loc3_ = new FurnitureStickieWidgetHandler();
               break;
            case RoomWidgetEnum.const_383:
               _loc3_ = new FurniturePresentWidgetHandler();
               break;
            case RoomWidgetEnum.const_433:
               _loc3_ = new FurnitureTrophyWidgetHandler();
               break;
            case RoomWidgetEnum.const_493:
               _loc3_ = new FurnitureEcotronBoxWidgetHandler();
               break;
            case RoomWidgetEnum.const_102:
               _loc3_ = new DoorbellWidgetHandler();
               break;
            case RoomWidgetEnum.const_715:
               _loc3_ = new RoomQueueWidgetHandler();
               break;
            case RoomWidgetEnum.const_388:
               _loc3_ = new LoadingBarWidgetHandler();
               break;
            case RoomWidgetEnum.const_119:
               _loc3_ = new VoteWidgetHandler();
               break;
            case RoomWidgetEnum.const_301:
               _loc3_ = new PollWidgetHandler();
               break;
            case RoomWidgetEnum.const_426:
               _loc3_ = new FurniChooserWidgetHandler();
               break;
            case RoomWidgetEnum.const_283:
               _loc3_ = new UserChooserWidgetHandler();
               break;
            case RoomWidgetEnum.const_477:
               _loc3_ = new FurnitureDimmerWidgetHandler();
               break;
            case RoomWidgetEnum.const_138:
               _loc3_ = new FriendRequestWidgetHandler();
               break;
            case RoomWidgetEnum.const_455:
               _loc3_ = new FurnitureClothingChangeWidgetHandler();
         }
         if(_loc3_ != null)
         {
            _loc3_.container = this;
            if(!var_416.add(param1,_loc3_))
            {
               _loc3_.dispose();
            }
            _loc6_ = null;
            _loc7_ = _loc3_.getWidgetMessages();
            if(_loc7_ != null)
            {
               for each(_loc9_ in _loc7_)
               {
                  _loc6_ = var_610.getValue(_loc9_);
                  if(_loc6_ == null)
                  {
                     _loc6_ = [];
                     var_610.add(_loc9_,_loc6_);
                  }
                  else
                  {
                     Logger.log("Room widget message \'" + _loc9_ + "\' handled by more than one widget message handler, could cause problems. Be careful!");
                  }
                  _loc6_.push(_loc3_);
               }
            }
            _loc8_ = _loc3_.getProcessedEvents();
            if(_loc8_ != null)
            {
               for each(_loc10_ in _loc8_)
               {
                  _loc6_ = var_611.getValue(_loc10_);
                  if(_loc6_ == null)
                  {
                     _loc6_ = [];
                     var_611.add(_loc10_,_loc6_);
                  }
                  _loc6_.push(_loc3_);
               }
            }
         }
         param1 = "null";
         var _loc4_:RoomWidgetRoomViewUpdateEvent = new RoomWidgetRoomViewUpdateEvent(param1,var_180.roomViewRect);
         this.events.dispatchEvent(_loc4_);
      }
      
      private function onToolbarRepositionEvent(param1:HabboToolbarEvent) : void
      {
         if(var_180 != null)
         {
            var_180.toolbarOrientation = param1.orientation;
         }
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_454;
      }
      
      public function get navigator() : IHabboNavigator
      {
         return _navigator;
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         var_375 = param1;
      }
      
      public function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = int(param1.objectId);
         var _loc3_:int = int(param1.category);
         var _loc4_:* = null;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomEngineObjectEvent.ROOM_OBJECT_SELECTED:
               _loc4_ = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.const_306,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               if(var_728 != null && _loc3_ == RoomObjectCategoryEnum.const_33)
               {
                  _loc7_ = var_31.userDataManager.getUserDataByIndex(_loc2_);
                  if(_loc7_ != null && _loc7_.type == RoomObjectTypeEnum.const_353)
                  {
                     var_728.userSelected(_loc7_.webID,_loc7_.name);
                  }
               }
               break;
            case RoomEngineObjectEvent.const_294:
               switch(_loc3_)
               {
                  case RoomObjectCategoryEnum.const_28:
                  case RoomObjectCategoryEnum.const_26:
                     _loc6_ = "null";
                     break;
                  case RoomObjectCategoryEnum.const_33:
                     _loc6_ = "null";
               }
               if(_loc6_ != null)
               {
                  _loc4_ = new RoomWidgetRoomObjectUpdateEvent(_loc6_,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               }
               break;
            case RoomEngineObjectEvent.const_678:
               switch(_loc3_)
               {
                  case RoomObjectCategoryEnum.const_28:
                  case RoomObjectCategoryEnum.const_26:
                     _loc6_ = "null";
                     break;
                  case RoomObjectCategoryEnum.const_33:
                     _loc6_ = "null";
               }
               if(_loc6_ != null)
               {
                  _loc4_ = new RoomWidgetRoomObjectUpdateEvent(_loc6_,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               }
               break;
            case RoomEngineObjectEvent.const_447:
               _loc4_ = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.const_196,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               break;
            case RoomEngineObjectEvent.const_686:
               if(true)
               {
                  return;
               }
               _roomEngine.modifyRoomObject(param1.objectId,param1.category,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomEngineObjectEvent.const_129:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_568,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_STICKIE:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_644,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_121:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_745,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_112:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_538,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_122:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_729,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_125:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_611,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_113:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_1047,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_458:
            case RoomEngineObjectEvent.const_432:
               handleRoomAdClick(param1);
               break;
            case RoomEngineObjectEvent.const_374:
            case RoomEngineObjectEvent.const_423:
               handleRoomAdTooltip(param1);
               break;
            case RoomEngineObjectEvent.const_98:
               processEvent(param1);
               break;
            case RoomEngineObjectEvent.const_136:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_596,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               processWidgetMessage(_loc5_);
         }
         if(_loc4_ != null)
         {
            events.dispatchEvent(_loc4_);
         }
      }
      
      public function get inventory() : IHabboInventory
      {
         return var_14;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:Array = var_611.getValue(param1.type);
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      public function createRoomView(param1:int) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc2_:Rectangle = var_180.roomViewRect;
         var _loc3_:int = _loc2_.width;
         var _loc4_:int = _loc2_.height;
         var _loc5_:int = 0;
         if(var_266.indexOf(param1) >= 0)
         {
            return;
         }
         if(var_31 == null || _windowManager == null || _roomEngine == null)
         {
            return;
         }
         var _loc6_:DisplayObject = _roomEngine.createRoomCanvas(var_31.roomId,var_31.roomCategory,param1,_loc3_,_loc4_,_loc5_);
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:RoomGeometry = _roomEngine.getRoomCanvasGeometry(var_31.roomId,var_31.roomCategory,param1) as RoomGeometry;
         if(_loc7_ != null)
         {
            _loc13_ = _roomEngine.getRoomNumberValue(var_31.roomId,var_31.roomCategory,RoomVariableEnum.const_567);
            _loc14_ = _roomEngine.getRoomNumberValue(var_31.roomId,var_31.roomCategory,RoomVariableEnum.const_684);
            _loc15_ = _roomEngine.getRoomNumberValue(var_31.roomId,var_31.roomCategory,RoomVariableEnum.const_626);
            _loc16_ = _roomEngine.getRoomNumberValue(var_31.roomId,var_31.roomCategory,RoomVariableEnum.const_739);
            _loc17_ = (_loc13_ + _loc14_) / 2;
            _loc18_ = (_loc15_ + _loc16_) / 2;
            _loc19_ = 20;
            _loc17_ += _loc19_ - 1;
            _loc18_ += _loc19_ - 1;
            _loc20_ = Math.sqrt(_loc19_ * _loc19_ + _loc19_ * _loc19_) * Math.tan(0);
            _loc7_.location = new Vector3d(_loc17_,_loc18_,_loc20_);
         }
         var _loc8_:XmlAsset = _assets.getAssetByName("room_view_container_xml") as XmlAsset;
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:IWindowContainer = _windowManager.buildFromXML(_loc8_.content as XML) as IWindowContainer;
         if(_loc9_ == null)
         {
            return;
         }
         _loc9_.width = _loc3_;
         _loc9_.height = _loc4_;
         var _loc10_:IDisplayObjectWrapper = _loc9_.findChildByName("room_canvas_wrapper") as IDisplayObjectWrapper;
         if(_loc10_ == null)
         {
            return;
         }
         _loc10_.setDisplayObject(_loc6_);
         _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_280,canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_250,canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_49,canvasMouseHandler);
         _loc10_.addEventListener(WindowEvent.const_42,onRoomViewResized);
         var _loc11_:Sprite = new Sprite();
         _loc11_.mouseEnabled = false;
         _loc11_.blendMode = BlendMode.MULTIPLY;
         _loc10_ = _loc9_.findChildByName("colorizer_wrapper") as IDisplayObjectWrapper;
         if(_loc10_ == null)
         {
            return;
         }
         _loc10_.setDisplayObject(_loc11_);
         _loc10_.addEventListener(WindowEvent.const_42,resizeColorizer);
         if(false)
         {
            _loc21_ = getSpectatorModeVisualization();
            if(_loc21_ != null)
            {
               _loc21_.width = _loc9_.width;
               _loc21_.height = _loc9_.height;
               _loc9_.addChild(_loc21_);
            }
         }
         var_180.addRoomView(_loc9_);
         var_266.push(param1);
         var _loc12_:String = _roomEngine.getWorldType(var_31.roomId,var_31.roomCategory);
         if(!_roomEngine.isPublicRoomWorldType(_loc12_))
         {
            var_1871 = true;
            var_1262 = getTimer();
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.iconId == HabboToolbarIconEnum.ZOOM)
         {
            if(var_31 != null)
            {
               _loc2_ = _roomEngine.getRoomCanvasGeometry(var_31.roomId,var_31.roomCategory,getFirstCanvasId());
               if(_loc2_ != null)
               {
                  trackZoomTime(_loc2_.isZoomedIn());
                  _loc2_.performZoom();
                  _loc3_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_166,HabboToolbarIconEnum.ZOOM);
                  if(_loc2_.isZoomedIn())
                  {
                     _loc3_.iconState = "2";
                     _toolbar.events.dispatchEvent(_loc3_);
                  }
                  else
                  {
                     _loc3_.iconState = "0";
                     _toolbar.events.dispatchEvent(_loc3_);
                  }
               }
            }
         }
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function getWidgetState(param1:String) : int
      {
         var _loc2_:IRoomWidget = var_55[param1];
         if(_loc2_ == null)
         {
            trace("Requested the state of an unknown widget " + param1);
            return const_612;
         }
         return _loc2_.state;
      }
      
      private function handleRoomAdClick(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IRoomObject = _roomEngine.getRoomObject(param1.roomId,param1.roomCategory,param1.objectId,param1.category);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel() as IRoomObjectModel;
         var _loc4_:String = _loc3_.getString(RoomObjectVariableEnum.const_349);
         if(_loc4_ == null || _loc4_.indexOf("http") != 0)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineObjectEvent.const_458:
               if(false)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc4_);
               break;
            case RoomEngineObjectEvent.const_432:
               if(true)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc4_);
               break;
         }
      }
      
      private function createFilter(param1:int, param2:int) : Array
      {
         var _loc3_:BlurFilter = new BlurFilter(2,2);
         return [];
      }
      
      private function handleRoomAdTooltip(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineObjectEvent.const_374:
               if(var_181 != null)
               {
                  return;
               }
               _loc2_ = _roomEngine.getRoomObject(param1.roomId,param1.roomCategory,param1.objectId,param1.category);
               if(_loc2_ == null)
               {
                  return;
               }
               _loc3_ = _localization.getKey(_loc2_.getType() + ".tooltip","${ads.roomad.tooltip}");
               var_181 = _windowManager.createWindow("room_ad_tooltip",_loc3_,WindowType.const_336,WindowStyle.const_356,WindowParam.const_85) as IToolTipWindow;
               var_181.setParamFlag(WindowParam.const_43,false);
               var_181.visible = true;
               var_181.center();
               break;
            case RoomEngineObjectEvent.const_423:
               if(var_181 == null)
               {
                  return;
               }
               var_181.dispose();
               var_181 = null;
               break;
         }
      }
      
      public function get session() : IRoomSession
      {
         return var_31;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _localization;
      }
      
      public function getRoomViewRect() : Rectangle
      {
         if(!var_180)
         {
            return null;
         }
         return var_180.roomViewRect;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function get soundManager() : IHabboSoundManager
      {
         return var_540;
      }
      
      public function set config(param1:IHabboConfigurationManager) : void
      {
         _config = param1;
      }
      
      public function checkInterrupts() : void
      {
         if(var_21 != null && var_31 != null && var_1261 && var_1263)
         {
            var_21.startSession(var_31);
            processEvent(new RoomWidgetLoadingBarUpdateEvent(RoomWidgetLoadingBarUpdateEvent.const_262));
         }
      }
      
      private function getWindowName(param1:int) : String
      {
         return "Room_Engine_Window_" + param1;
      }
      
      private function onRoomContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(var_713 == null || false)
         {
            return;
         }
         var _loc2_:int = var_713.indexOf(param1.contentType);
         if(_loc2_ != -1)
         {
            var_713.splice(_loc2_,1);
         }
         if(false)
         {
            var_1263 = true;
            checkInterrupts();
         }
      }
      
      private function trackZoomTime(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(var_1871)
         {
            _loc2_ = getTimer();
            _loc3_ = Math.round((_loc2_ - var_1262) / 1000);
            if(var_881 != null)
            {
               if(param1)
               {
                  var_881.track("zoomEnded","in",_loc3_);
               }
               else
               {
                  var_881.track("zoomEnded","out",_loc3_);
               }
            }
            var_1262 = _loc2_;
         }
      }
      
      public function set navigator(param1:IHabboNavigator) : void
      {
         _navigator = param1;
      }
      
      public function set friendList(param1:IHabboFriendList) : void
      {
         _friendList = param1;
         if(_friendList)
         {
            _friendList.events.addEventListener(FriendRequestEvent.const_50,processEvent);
            _friendList.events.addEventListener(FriendRequestEvent.const_256,processEvent);
         }
      }
      
      public function set avatarRenderManager(param1:IAvatarRenderManager) : void
      {
         var_454 = param1;
      }
      
      public function set inventory(param1:IHabboInventory) : void
      {
         var_14 = param1;
      }
      
      public function getFirstCanvasId() : int
      {
         if(var_266 != null)
         {
            if(false)
            {
               return var_266[0];
            }
         }
         return 0;
      }
      
      public function set roomSessionManager(param1:IRoomSessionManager) : void
      {
         var_21 = param1;
      }
      
      public function setRoomViewColor(param1:uint, param2:int) : void
      {
         var _loc3_:IWindowContainer = var_180.getRoomView() as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IDisplayObjectWrapper = _loc3_.getChildByName("colorizer_wrapper") as IDisplayObjectWrapper;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Sprite = _loc4_.getDisplayObject() as Sprite;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:int = ColorConverter.rgbToHSL(param1);
         _loc6_ = (_loc6_ & 16776960) + param2;
         param1 = ColorConverter.hslToRGB(_loc6_);
         var_1872 = param1;
         _loc5_.graphics.clear();
         _loc5_.graphics.beginFill(param1);
         _loc5_.graphics.drawRect(0,0,_loc4_.width,_loc4_.height);
         _loc5_.graphics.endFill();
      }
      
      public function update() : void
      {
         updateHandlers();
      }
      
      public function set habboHelp(param1:IHabboHelp) : void
      {
         var_882 = param1;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = var_610.getValue(param1.type);
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = _loc3_.processWidgetMessage(param1);
               if(_loc4_ != null)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return var_882;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_21;
      }
      
      public function set habboTracking(param1:IHabboTracking) : void
      {
         var_881 = param1;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
   }
}
