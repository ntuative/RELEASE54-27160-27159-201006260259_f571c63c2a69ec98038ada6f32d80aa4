package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1784:String = "";
      
      private var var_164:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1784 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_164 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1784;
      }
      
      public function get objectId() : String
      {
         return var_164;
      }
   }
}
