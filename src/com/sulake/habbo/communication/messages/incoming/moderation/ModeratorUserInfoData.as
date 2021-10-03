package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2359:int;
      
      private var var_2362:int;
      
      private var var_2360:int;
      
      private var _userName:String;
      
      private var var_2358:int;
      
      private var var_2361:int;
      
      private var var_2363:int;
      
      private var _userId:int;
      
      private var var_769:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2361 = param1.readInteger();
         var_2358 = param1.readInteger();
         var_769 = param1.readBoolean();
         var_2360 = param1.readInteger();
         var_2362 = param1.readInteger();
         var_2359 = param1.readInteger();
         var_2363 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2363;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_769;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2358;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2362;
      }
      
      public function get cautionCount() : int
      {
         return var_2359;
      }
      
      public function get cfhCount() : int
      {
         return var_2360;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2361;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
