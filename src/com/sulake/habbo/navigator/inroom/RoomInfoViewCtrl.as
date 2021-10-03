package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_735:IWindowContainer;
      
      private var var_1082:ITextWindow;
      
      private var var_182:RoomSettingsCtrl;
      
      private var var_1285:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_201:Timer;
      
      private var var_1929:IWindowContainer;
      
      private var var_1283:ITextWindow;
      
      private var var_361:IWindowContainer;
      
      private var var_1931:ITextWindow;
      
      private var var_887:IWindowContainer;
      
      private var var_202:UserDefinedRoomEventsCtrl;
      
      private var var_1551:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_712:ITextWindow;
      
      private var var_1552:IWindowContainer;
      
      private var var_1281:IWindowContainer;
      
      private var var_888:ITextWindow;
      
      private var var_1081:ITextFieldWindow;
      
      private var var_274:IWindowContainer;
      
      private var var_885:ITextWindow;
      
      private var var_1554:IButtonWindow;
      
      private var var_1083:ITextWindow;
      
      private var var_2458:int;
      
      private var var_1284:IContainerButtonWindow;
      
      private var var_886:IWindowContainer;
      
      private var var_1280:ITextWindow;
      
      private var var_1282:IContainerButtonWindow;
      
      private var var_1553:ITextWindow;
      
      private var var_1013:TagRenderer;
      
      private var var_1550:IButtonWindow;
      
      private var var_1798:ITextWindow;
      
      private var var_316:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_734:ITextWindow;
      
      private var var_236:RoomThumbnailCtrl;
      
      private var var_1286:IContainerButtonWindow;
      
      private var var_1930:IWindowContainer;
      
      private var var_273:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_316 = new RoomEventViewCtrl(_navigator);
         var_182 = new RoomSettingsCtrl(_navigator,this,true);
         var_236 = new RoomThumbnailCtrl(_navigator);
         var_202 = new UserDefinedRoomEventsCtrl(_navigator);
         var_1013 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_182);
         var_201 = new Timer(6000,1);
         var_201.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_182.active = true;
         this.var_316.active = false;
         this.var_236.active = false;
         this.var_202.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1551.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1550.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1552.visible = Util.hasVisibleChildren(var_1552);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_712.text = param1.roomName;
         var_712.height = NaN;
         _ownerName.text = param1.ownerName;
         var_888.text = param1.description;
         var_1013.refreshTags(var_361,param1.tags);
         var_888.visible = false;
         if(param1.description != "")
         {
            var_888.height = NaN;
            var_888.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_361,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_361,"thumb_down",_loc3_,onThumbDown,0);
         var_1931.visible = _loc3_;
         var_885.visible = !_loc3_;
         var_1553.visible = !_loc3_;
         var_1553.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_361,"home",param2,null,0);
         _navigator.refreshButton(var_361,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_361,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_712.y,0);
         var_361.visible = true;
         var_361.height = Util.getLowestPoint(var_361);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_201.reset();
         this.var_182.active = false;
         this.var_316.active = false;
         this.var_236.active = false;
         this.var_202.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_201)
         {
            var_201.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_201.reset();
            var_201 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_382,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1554.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1285.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1286.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1284.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1282.visible = _navigator.data.canEditRoomSettings && param1;
         var_1281.visible = Util.hasVisibleChildren(var_1281);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_201.reset();
         this.var_316.active = false;
         this.var_182.active = false;
         this.var_236.active = false;
         this.var_202.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_201.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_201.reset();
         this.var_316.active = false;
         this.var_182.active = false;
         this.var_236.active = false;
         this.var_202.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_382,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_274);
         var_274.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_182.refresh(var_274);
         this.var_236.refresh(var_274);
         this.var_202.refresh(var_274);
         Util.moveChildrenToColumn(var_274,["room_details","room_buttons"],0,2);
         var_274.height = Util.getLowestPoint(var_274);
         var_274.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1081.setSelection(0,var_1081.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_273);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_316.refresh(var_273);
         if(Util.hasVisibleChildren(var_273) && !(this.var_236.active || this.var_202.active))
         {
            Util.moveChildrenToColumn(var_273,["event_details","event_buttons"],0,2);
            var_273.height = Util.getLowestPoint(var_273);
            var_273.visible = true;
         }
         else
         {
            var_273.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_201.reset();
         this.var_316.active = true;
         this.var_182.active = false;
         this.var_236.active = false;
         this.var_202.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_201.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1082.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1082.height = NaN;
         var_1283.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1283.height = NaN;
         Util.moveChildrenToColumn(var_735,["public_space_name","public_space_desc"],var_1082.y,0);
         var_735.visible = true;
         var_735.height = Math.max(86,Util.getLowestPoint(var_735));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_202;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true && true)
         {
            var_886.visible = true;
            var_1081.text = this.getEmbedData();
         }
         else
         {
            var_886.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_201.reset();
         this.var_182.load(param1);
         this.var_182.active = true;
         this.var_316.active = false;
         this.var_236.active = false;
         this.var_202.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_201.reset();
         this.var_182.active = false;
         this.var_316.active = false;
         this.var_236.active = true;
         this.var_202.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_69,false);
         _window.setParamFlag(HabboWindowParam.const_1309,true);
         _window.visible = false;
         var_274 = IWindowContainer(find("room_info"));
         var_361 = IWindowContainer(find("room_details"));
         var_735 = IWindowContainer(find("public_space_details"));
         var_1930 = IWindowContainer(find("owner_name_cont"));
         var_1929 = IWindowContainer(find("rating_cont"));
         var_1281 = IWindowContainer(find("room_buttons"));
         var_712 = ITextWindow(find("room_name"));
         var_1082 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_888 = ITextWindow(find("room_desc"));
         var_1283 = ITextWindow(find("public_space_desc"));
         var_1083 = ITextWindow(find("owner_caption"));
         var_885 = ITextWindow(find("rating_caption"));
         var_1931 = ITextWindow(find("rate_caption"));
         var_1553 = ITextWindow(find("rating_txt"));
         var_273 = IWindowContainer(find("event_info"));
         var_887 = IWindowContainer(find("event_details"));
         var_1552 = IWindowContainer(find("event_buttons"));
         var_1798 = ITextWindow(find("event_name"));
         var_734 = ITextWindow(find("event_desc"));
         var_1285 = IContainerButtonWindow(find("add_favourite_button"));
         var_1286 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1284 = IContainerButtonWindow(find("make_home_button"));
         var_1282 = IContainerButtonWindow(find("unmake_home_button"));
         var_1554 = IButtonWindow(find("room_settings_button"));
         var_1551 = IButtonWindow(find("create_event_button"));
         var_1550 = IButtonWindow(find("edit_event_button"));
         var_886 = IWindowContainer(find("embed_info"));
         var_1280 = ITextWindow(find("embed_info_txt"));
         var_1081 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1285,onAddFavouriteClick);
         Util.setProcDirectly(var_1286,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1554,onRoomSettingsClick);
         Util.setProcDirectly(var_1284,onMakeHomeClick);
         Util.setProcDirectly(var_1282,onUnmakeHomeClick);
         Util.setProcDirectly(var_1551,onEventSettingsClick);
         Util.setProcDirectly(var_1550,onEventSettingsClick);
         Util.setProcDirectly(var_1081,onEmbedSrcClick);
         _navigator.refreshButton(var_1285,"favourite",true,null,0);
         _navigator.refreshButton(var_1286,"favourite",true,null,0);
         _navigator.refreshButton(var_1284,"home",true,null,0);
         _navigator.refreshButton(var_1282,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_274,onHover);
         Util.setProcDirectly(var_273,onHover);
         var_1083.width = var_1083.textWidth;
         Util.moveChildrenToRow(var_1930,["owner_caption","owner_name"],var_1083.x,var_1083.y,3);
         var_885.width = var_885.textWidth;
         Util.moveChildrenToRow(var_1929,["rating_caption","rating_txt"],var_885.x,var_885.y,3);
         var_1280.height = NaN;
         Util.moveChildrenToColumn(var_886,["embed_info_txt","embed_src_txt"],var_1280.y,2);
         var_886.height = Util.getLowestPoint(var_886) + 5;
         var_2458 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1798.text = param1.eventName;
         var_734.text = param1.eventDescription;
         var_1013.refreshTags(var_887,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_734.visible = false;
         if(param1.eventDescription != "")
         {
            var_734.height = NaN;
            var_734.y = Util.getLowestPoint(var_887) + 2;
            var_734.visible = true;
         }
         var_887.visible = true;
         var_887.height = Util.getLowestPoint(var_887);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_956,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
