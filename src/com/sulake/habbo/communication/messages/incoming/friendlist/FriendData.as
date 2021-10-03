package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_421:String;
      
      private var var_1383:String;
      
      private var var_1380:String;
      
      private var var_1235:int;
      
      private var var_620:int;
      
      private var var_1382:String;
      
      private var _name:String;
      
      private var var_1381:Boolean;
      
      private var var_769:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_620 = param1.readInteger();
         this.var_769 = param1.readBoolean();
         this.var_1381 = param1.readBoolean();
         this.var_421 = param1.readString();
         this.var_1235 = param1.readInteger();
         this.var_1380 = param1.readString();
         this.var_1383 = param1.readString();
         this.var_1382 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_620;
      }
      
      public function get realName() : String
      {
         return var_1382;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1380;
      }
      
      public function get categoryId() : int
      {
         return var_1235;
      }
      
      public function get online() : Boolean
      {
         return var_769;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1381;
      }
      
      public function get lastAccess() : String
      {
         return var_1383;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
   }
}
