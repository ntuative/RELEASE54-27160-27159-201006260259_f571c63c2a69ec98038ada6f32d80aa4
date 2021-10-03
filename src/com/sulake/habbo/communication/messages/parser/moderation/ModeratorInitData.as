package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1119:Array;
      
      private var var_2081:Boolean;
      
      private var var_1118:Array;
      
      private var var_2082:Boolean;
      
      private var var_2086:Boolean;
      
      private var var_2083:Boolean;
      
      private var var_159:Array;
      
      private var var_2087:Boolean;
      
      private var var_2085:Boolean;
      
      private var var_935:Array;
      
      private var var_2084:Boolean;
      
      private var var_2080:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_159 = [];
         var_1118 = [];
         var_1119 = [];
         var_935 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_159.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1118.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_935.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2087 = param1.readBoolean();
         var_2083 = param1.readBoolean();
         var_2082 = param1.readBoolean();
         var_2086 = param1.readBoolean();
         var_2080 = param1.readBoolean();
         var_2085 = param1.readBoolean();
         var_2081 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1119.push(param1.readString());
            _loc4_++;
         }
         var_2084 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_2080;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1118;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2082;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2081;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2087;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1118 = null;
         var_1119 = null;
         var_159 = null;
         for each(_loc1_ in var_935)
         {
            _loc1_.dispose();
         }
         var_935 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1119;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2085;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2086;
      }
      
      public function get offenceCategories() : Array
      {
         return var_935;
      }
      
      public function get issues() : Array
      {
         return var_159;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2084;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2083;
      }
   }
}
