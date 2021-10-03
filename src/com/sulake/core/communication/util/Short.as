package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_831:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_831 = new ByteArray();
         var_831.writeShort(param1);
         var_831.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_831.position = 0;
         if(false)
         {
            _loc1_ = var_831.readShort();
            var_831.position = 0;
         }
         return _loc1_;
      }
   }
}
