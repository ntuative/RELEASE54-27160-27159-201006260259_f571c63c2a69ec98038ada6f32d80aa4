package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_413:uint;
      
      private var var_1056:IUnknown;
      
      private var var_1250:String;
      
      private var var_1057:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1057 = param1;
         var_1250 = getQualifiedClassName(var_1057);
         var_1056 = param2;
         var_413 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1057;
      }
      
      public function get disposed() : Boolean
      {
         return var_1056 == null;
      }
      
      public function get references() : uint
      {
         return var_413;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_413) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1056;
      }
      
      public function get iis() : String
      {
         return var_1250;
      }
      
      public function reserve() : uint
      {
         return ++var_413;
      }
      
      public function dispose() : void
      {
         var_1057 = null;
         var_1250 = null;
         var_1056 = null;
         var_413 = 0;
      }
   }
}
