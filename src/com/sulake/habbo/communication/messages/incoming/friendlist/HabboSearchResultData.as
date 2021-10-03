package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2444:Boolean;
      
      private var var_2445:int;
      
      private var var_2443:Boolean;
      
      private var var_1621:String;
      
      private var var_1382:String;
      
      private var var_2001:int;
      
      private var var_2136:String;
      
      private var var_2446:String;
      
      private var var_2135:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2001 = param1.readInteger();
         this.var_1621 = param1.readString();
         this.var_2136 = param1.readString();
         this.var_2444 = param1.readBoolean();
         this.var_2443 = param1.readBoolean();
         param1.readString();
         this.var_2445 = param1.readInteger();
         this.var_2135 = param1.readString();
         this.var_2446 = param1.readString();
         this.var_1382 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1382;
      }
      
      public function get avatarName() : String
      {
         return this.var_1621;
      }
      
      public function get avatarId() : int
      {
         return this.var_2001;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2444;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2446;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2135;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2443;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2136;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2445;
      }
   }
}
