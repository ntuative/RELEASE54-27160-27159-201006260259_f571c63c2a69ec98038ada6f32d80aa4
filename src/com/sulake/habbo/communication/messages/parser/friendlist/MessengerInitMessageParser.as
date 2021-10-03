package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2478:int;
      
      private var var_2477:int;
      
      private var var_94:Array;
      
      private var var_245:Array;
      
      private var var_2475:int;
      
      private var var_2474:int;
      
      private var var_2473:int;
      
      private var var_2476:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_94 = new Array();
         this.var_245 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2478;
      }
      
      public function get friends() : Array
      {
         return this.var_245;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2475;
      }
      
      public function get categories() : Array
      {
         return this.var_94;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2477;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2476;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2476 = param1.readInteger();
         this.var_2475 = param1.readInteger();
         this.var_2478 = param1.readInteger();
         this.var_2473 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_94.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_245.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2477 = param1.readInteger();
         this.var_2474 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2473;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2474;
      }
   }
}
