package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_1246:int;
      
      private var var_791:String;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_791 = param1.readString();
         this.var_1246 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_791;
      }
      
      public function get errorCode() : int
      {
         return this.var_1246;
      }
   }
}
