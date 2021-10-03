package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_191:String = "RWUIUE_PEER";
      
      public static const const_222:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1286:String = "BOT";
      
      public static const const_976:int = 2;
      
      public static const const_1413:int = 0;
      
      public static const const_831:int = 3;
       
      
      private var var_421:String = "";
      
      private var var_1380:String = "";
      
      private var var_1991:Boolean = false;
      
      private var var_1779:int = 0;
      
      private var var_1988:int = 0;
      
      private var var_1987:Boolean = false;
      
      private var var_1382:String = "";
      
      private var var_1984:Boolean = false;
      
      private var var_964:int = 0;
      
      private var var_1993:Boolean = true;
      
      private var var_1124:int = 0;
      
      private var var_1992:Boolean = false;
      
      private var var_1403:Boolean = false;
      
      private var var_1990:Boolean = false;
      
      private var var_1985:int = 0;
      
      private var var_1986:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_296:Array;
      
      private var var_1401:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1776:int = 0;
      
      private var var_1983:Boolean = false;
      
      private var var_1994:int = 0;
      
      private var var_1989:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_296 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1988;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1988 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1991;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1993;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1993 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1984 = param1;
      }
      
      public function get motto() : String
      {
         return var_1380;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1992 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1403;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1380 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1983;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1989;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1403 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1986;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1985 = param1;
      }
      
      public function get badges() : Array
      {
         return var_296;
      }
      
      public function get amIController() : Boolean
      {
         return var_1987;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1987 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1983 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1994 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1989 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1382 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1984;
      }
      
      public function set figure(param1:String) : void
      {
         var_421 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1985;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1401;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1992;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_964 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1994;
      }
      
      public function get realName() : String
      {
         return var_1382;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function set webID(param1:int) : void
      {
         var_1776 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_296 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1990 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1986 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_964;
      }
      
      public function get webID() : int
      {
         return var_1776;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1124 = param1;
      }
      
      public function get xp() : int
      {
         return var_1779;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1991 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1124;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1990;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1401 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1779 = param1;
      }
   }
}
