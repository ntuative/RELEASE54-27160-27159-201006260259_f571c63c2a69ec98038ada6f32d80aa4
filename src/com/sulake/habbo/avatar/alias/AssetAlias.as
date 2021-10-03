package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1136:Boolean;
      
      private var _name:String;
      
      private var var_2137:String;
      
      private var var_1135:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2137 = String(param1.@link);
         var_1135 = Boolean(parseInt(param1.@fliph));
         var_1136 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1135;
      }
      
      public function get flipV() : Boolean
      {
         return var_1136;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2137;
      }
   }
}
