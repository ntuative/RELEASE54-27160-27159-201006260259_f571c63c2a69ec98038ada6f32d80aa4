package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1042:int = 0;
      
      private var var_1346:int = 0;
      
      private var var_1762:String = "";
      
      private var var_1043:int = 0;
      
      private var var_2041:String = "";
      
      private var var_2042:int = 0;
      
      private var var_1508:String = "";
      
      private var var_1851:int = 0;
      
      private var var_2043:int = 0;
      
      private var var_1764:String = "";
      
      private var var_2044:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1851 = param1;
         var_1764 = param2;
         var_1508 = param3;
         var_1762 = param4;
         var_2041 = param5;
         if(param6)
         {
            var_1346 = 1;
         }
         else
         {
            var_1346 = 0;
         }
         var_2042 = param7;
         var_2043 = param8;
         var_1043 = param9;
         var_2044 = param10;
         var_1042 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1851,var_1764,var_1508,var_1762,var_2041,var_1346,var_2042,var_2043,var_1043,var_2044,var_1042];
      }
      
      public function dispose() : void
      {
      }
   }
}
