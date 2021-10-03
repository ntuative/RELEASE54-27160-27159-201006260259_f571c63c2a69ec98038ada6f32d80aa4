package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_604:int = 2;
      
      public static const const_986:int = 4;
      
      private static const const_520:int = 2;
      
      private static const const_820:int = 1;
      
      public static const const_1694:int = 3;
      
      private static const const_1155:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_414:int = 1;
      
      private static const const_819:int = 3;
       
      
      private var var_2239:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1427:IRegionWindow;
      
      private var var_461:int;
      
      private var var_1429:Boolean = true;
      
      private var var_799:GuestRoomListCtrl;
      
      private var var_18:IFrameWindow;
      
      private var var_444:Timer;
      
      private var var_287:IWindowContainer;
      
      private var var_216:IWindowContainer;
      
      private var var_251:IWindowContainer;
      
      private var var_1428:IWindow;
      
      private var var_1430:Boolean;
      
      private var var_973:OfficialRoomListCtrl;
      
      private var var_22:IWindowContainer;
      
      private var var_800:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1426:int = 0;
      
      private var var_227:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_800 = new PopularTagsListCtrl(_navigator);
         var_799 = new GuestRoomListCtrl(_navigator);
         var_973 = new OfficialRoomListCtrl(_navigator);
         var_444 = new Timer(300,1);
         var_444.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_630)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_642)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_618)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_219)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_309)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_533)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_697)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_320)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_208)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_450)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_18 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_227 = ITabContextWindow(var_18.findChildByName("tab_context"));
         var_22 = IWindowContainer(var_18.findChildByName("tab_content"));
         var_251 = IWindowContainer(var_18.findChildByName("custom_content"));
         var_216 = IWindowContainer(var_18.findChildByName("list_content"));
         var_287 = IWindowContainer(var_18.findChildByName("custom_footer"));
         var_1428 = var_18.findChildByName("loading_text");
         var _loc1_:IWindow = var_18.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1427 = IRegionWindow(var_18.findChildByName("to_hotel_view"));
         var_1427.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_18.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_227.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_37,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_18.scaler.setParamFlag(HabboWindowParam.const_683,false);
         var_18.scaler.setParamFlag(HabboWindowParam.const_1203,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_18;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_56)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1430)
         {
            var_1430 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_355:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_292:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_299:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_273:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_224:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_450:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_630:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_642:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_618:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_219:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_723:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_309:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_533:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_697:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_320:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_208:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_216.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_18 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_216);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_800);
         refreshScrollbar(var_799);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1429 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_414)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_604)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_461 = const_520;
            this.var_216.blend = 0;
            if(this.var_251.visible)
            {
               this.var_251.blend = 0;
               this.var_287.blend = 0;
            }
         }
         else
         {
            this.var_461 = const_820;
         }
         this.var_1426 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_251);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_251);
         if(Util.hasVisibleChildren(var_251))
         {
            var_251.visible = true;
         }
         else
         {
            var_251.visible = false;
            var_251.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_18)
            {
               var_18.dispose();
               var_18 = null;
            }
            if(var_22)
            {
               var_22.dispose();
               var_22 = null;
            }
            if(var_444)
            {
               var_444.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_444.reset();
               var_444 = null;
            }
            if(var_800)
            {
               var_800.dispose();
               var_800 = null;
            }
            if(var_799)
            {
               var_799.dispose();
               var_799 = null;
            }
            if(var_973)
            {
               var_973.dispose();
               var_973 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_42 || param2 != var_18)
         {
            return;
         }
         if(!this.var_444.running)
         {
            this.var_444.reset();
            this.var_444.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_973,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_799,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_227.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1430 = true;
            var_227.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_800,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_18 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_18.visible = true;
         var_18.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.NAVIGATOR,var_18));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_287);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_287);
         if(Util.hasVisibleChildren(var_287))
         {
            var_287.visible = true;
         }
         else
         {
            var_287.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_27)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_18 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_251.height = Util.getLowestPoint(var_251);
         var_287.height = Util.getLowestPoint(var_287);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_22,["custom_content","list_content"],var_251.y,8);
         var_216.height = var_216.height + _loc1_ - 0 - 0 + var_2239;
         Util.moveChildrenToColumn(var_22,["list_content","custom_footer"],var_216.y,8);
         var_2239 = var_287.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_216 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_461 == const_820)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_216.blend - _loc2_));
            this.var_216.blend = _loc3_;
            this.var_251.blend = !!var_1429 ? Number(_loc3_) : Number(1);
            this.var_287.blend = !!var_1429 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_461 = const_520;
            }
         }
         else if(var_461 == const_520)
         {
            if(var_1426 % 10 == 1)
            {
               var_1428.visible = true;
            }
            ++var_1426;
            if(!_navigator.data.isLoading())
            {
               var_461 = const_819;
            }
         }
         else if(var_461 == const_819)
         {
            this.refresh();
            var_461 = const_1155;
         }
         else
         {
            var_1428.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_216.blend + _loc2_));
            this.var_216.blend = _loc3_;
            this.var_251.blend = !!var_1429 ? Number(_loc3_) : Number(1);
            this.var_287.blend = !!var_1429 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1427,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1427,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_18 != null)
         {
            var_18.visible = false;
         }
      }
   }
}
