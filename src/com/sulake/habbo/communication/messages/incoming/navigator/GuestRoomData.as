package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2152:int;
      
      private var var_2160:String;
      
      private var var_2162:int;
      
      private var var_2161:int;
      
      private var var_786:Boolean;
      
      private var var_2163:Boolean;
      
      private var var_453:int;
      
      private var var_1234:String;
      
      private var var_1873:int;
      
      private var var_1235:int;
      
      private var _ownerName:String;
      
      private var var_712:String;
      
      private var var_2159:int;
      
      private var var_2164:RoomThumbnailData;
      
      private var var_1876:Boolean;
      
      private var var_694:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_694 = new Array();
         super();
         var_453 = param1.readInteger();
         var_786 = param1.readBoolean();
         var_712 = param1.readString();
         _ownerName = param1.readString();
         var_1873 = param1.readInteger();
         var_2152 = param1.readInteger();
         var_2159 = param1.readInteger();
         var_1234 = param1.readString();
         var_2162 = param1.readInteger();
         var_1876 = param1.readBoolean();
         var_2161 = param1.readInteger();
         var_1235 = param1.readInteger();
         var_2160 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_694.push(_loc4_);
            _loc3_++;
         }
         var_2164 = new RoomThumbnailData(param1);
         var_2163 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2159;
      }
      
      public function get roomName() : String
      {
         return var_712;
      }
      
      public function get userCount() : int
      {
         return var_2152;
      }
      
      public function get score() : int
      {
         return var_2161;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2160;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1876;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2163;
      }
      
      public function get event() : Boolean
      {
         return var_786;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_694 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1235;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2162;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2164;
      }
      
      public function get doorMode() : int
      {
         return var_1873;
      }
      
      public function get flatId() : int
      {
         return var_453;
      }
      
      public function get description() : String
      {
         return var_1234;
      }
   }
}
