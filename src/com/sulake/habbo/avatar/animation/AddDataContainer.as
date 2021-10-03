package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1610:String;
      
      private var var_1696:String;
      
      private var var_1129:String;
      
      private var var_459:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1610 = String(param1.@align);
         var_1129 = String(param1.@base);
         var_1696 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_459 = Number(_loc2_);
            if(var_459 > 1)
            {
               var_459 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1610;
      }
      
      public function get ink() : String
      {
         return var_1696;
      }
      
      public function get base() : String
      {
         return var_1129;
      }
      
      public function get isBlended() : Boolean
      {
         return var_459 != 1;
      }
      
      public function get blend() : Number
      {
         return var_459;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
