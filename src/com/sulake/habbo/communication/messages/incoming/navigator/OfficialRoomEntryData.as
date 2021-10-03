package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1368:int = 4;
      
      public static const const_561:int = 3;
      
      public static const const_597:int = 2;
      
      public static const const_901:int = 1;
       
      
      private var var_2182:String;
      
      private var _disposed:Boolean;
      
      private var var_2152:int;
      
      private var var_2180:Boolean;
      
      private var var_868:String;
      
      private var var_955:PublicRoomData;
      
      private var var_2179:int;
      
      private var _index:int;
      
      private var var_2181:String;
      
      private var _type:int;
      
      private var var_1924:String;
      
      private var var_954:GuestRoomData;
      
      private var var_2183:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2182 = param1.readString();
         var_2183 = param1.readString();
         var_2180 = param1.readInteger() == 1;
         var_2181 = param1.readString();
         var_868 = param1.readString();
         var_2179 = param1.readInteger();
         var_2152 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_901)
         {
            var_1924 = param1.readString();
         }
         else if(_type == const_561)
         {
            var_955 = new PublicRoomData(param1);
         }
         else if(_type == const_597)
         {
            var_954 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2179;
      }
      
      public function get popupCaption() : String
      {
         return var_2182;
      }
      
      public function get userCount() : int
      {
         return var_2152;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2180;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_901)
         {
            return 0;
         }
         if(this.type == const_597)
         {
            return this.var_954.maxUserCount;
         }
         if(this.type == const_561)
         {
            return this.var_955.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2183;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_954 != null)
         {
            this.var_954.dispose();
            this.var_954 = null;
         }
         if(this.var_955 != null)
         {
            this.var_955.dispose();
            this.var_955 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_954;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2181;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_955;
      }
      
      public function get picRef() : String
      {
         return var_868;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1924;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
