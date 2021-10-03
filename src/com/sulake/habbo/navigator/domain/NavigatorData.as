package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1468:int = 10;
       
      
      private var var_2058:Boolean;
      
      private var var_2056:int;
      
      private var var_1350:int;
      
      private var var_2051:Boolean;
      
      private var var_1109:Array;
      
      private var var_928:Dictionary;
      
      private var var_1110:Array;
      
      private var var_2468:int;
      
      private var var_2054:int;
      
      private var var_2057:UserDefinedRoomEvents;
      
      private var var_1604:int;
      
      private var var_2055:int;
      
      private var var_2001:int;
      
      private var var_646:PublicRoomShortData;
      
      private var var_436:RoomEventData;
      
      private var var_139:MsgWithRequestId;
      
      private var var_2052:Boolean;
      
      private var var_2053:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_2050:Boolean;
      
      private var var_210:GuestRoomData;
      
      private var var_760:Boolean;
      
      private var var_645:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1109 = new Array();
         var_1110 = new Array();
         var_928 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_139 != null && var_139 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2050;
      }
      
      public function startLoading() : void
      {
         this.var_760 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_2056;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2050 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_436 != null)
         {
            var_436.dispose();
         }
         var_436 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1604;
      }
      
      public function get stuffStates() : Array
      {
         return var_2053;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_139 != null && var_139 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_139 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_210;
      }
      
      public function get allCategories() : Array
      {
         return var_1109;
      }
      
      public function onRoomExit() : void
      {
         if(var_436 != null)
         {
            var_436.dispose();
            var_436 = null;
         }
         if(var_646 != null)
         {
            var_646.dispose();
            var_646 = null;
         }
         if(var_210 != null)
         {
            var_210.dispose();
            var_210 = null;
         }
         var_645 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_760 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_210 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1604 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_760 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_646 = null;
         var_210 = null;
         var_645 = false;
         if(param1.guestRoom)
         {
            var_645 = param1.owner;
         }
         else
         {
            var_646 = param1.publicSpace;
            var_436 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_645;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2468 = param1.limit;
         this.var_1350 = param1.favouriteRoomIds.length;
         this.var_928 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_928[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_139 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_2058;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_2053 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_646;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_760 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_2001 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_210 != null && var_645;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_2057;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2051;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1109 = param1;
         var_1110 = new Array();
         for each(_loc2_ in var_1109)
         {
            if(_loc2_.visible)
            {
               var_1110.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2054;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2055;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1110;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_139 == null)
         {
            return;
         }
         var_139.dispose();
         var_139 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_2058 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_436;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_928[param1] = !!param2 ? "yes" : null;
         var_1350 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_139 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_2001;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_139 != null && var_139 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2051 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2054 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2052 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_2057 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_760;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1604 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1350 >= var_2468;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_210 != null)
         {
            var_210.dispose();
         }
         var_210 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2055 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2052;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_210 != null && !var_645;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2056 = param1;
      }
   }
}
