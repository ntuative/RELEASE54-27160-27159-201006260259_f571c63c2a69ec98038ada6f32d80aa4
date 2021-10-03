package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_151:int = 1;
      
      public static const const_1317:int = 3;
      
      public static const const_421:int = 2;
       
      
      private var var_1897:int;
      
      private var var_1891:int;
      
      private var var_1887:int;
      
      private var var_1836:int;
      
      private var var_37:int;
      
      private var var_453:int;
      
      private var var_1441:int;
      
      private var var_1888:int;
      
      private var var_1075:int;
      
      private var _roomResources:String;
      
      private var var_1894:int;
      
      private var var_1890:int;
      
      private var var_1892:String;
      
      private var var_1896:String;
      
      private var var_1895:int = 0;
      
      private var var_1277:String;
      
      private var _message:String;
      
      private var var_1868:int;
      
      private var var_1889:String;
      
      private var var_1235:int;
      
      private var var_712:String;
      
      private var var_1893:String;
      
      private var var_1532:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1075 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1895 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1890;
      }
      
      public function set roomName(param1:String) : void
      {
         var_712 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1894 = param1;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_712;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1836 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_37 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1891;
      }
      
      public function get priority() : int
      {
         return var_1897 + var_1895;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1888 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1896;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1532) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1235;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1890 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1441;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1892 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1894;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1836;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1893 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1277 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1888;
      }
      
      public function set priority(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1891 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1892;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1887 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1896 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1868 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1277;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1441 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1887;
      }
      
      public function set flatId(param1:int) : void
      {
         var_453 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1235 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1532 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1868;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1889 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1532;
      }
      
      public function get reportedUserId() : int
      {
         return var_1075;
      }
      
      public function get flatId() : int
      {
         return var_453;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1893;
      }
      
      public function get reporterUserName() : String
      {
         return var_1889;
      }
   }
}
