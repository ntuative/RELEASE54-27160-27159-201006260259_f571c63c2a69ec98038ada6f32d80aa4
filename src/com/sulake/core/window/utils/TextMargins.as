package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1010:int;
      
      private var _right:int;
      
      private var var_1011:int;
      
      private var var_1009:int;
      
      private var var_196:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_1011 = param1;
         var_1009 = param2;
         _right = param3;
         var_1010 = param4;
         var_196 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_1010 = param1;
         var_196(this);
      }
      
      public function get left() : int
      {
         return var_1011;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_1011 == 0 && _right == 0 && var_1009 == 0 && var_1010 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_1009 = param1;
         var_196(this);
      }
      
      public function get top() : int
      {
         return var_1009;
      }
      
      public function set left(param1:int) : void
      {
         var_1011 = param1;
         var_196(this);
      }
      
      public function get bottom() : int
      {
         return var_1010;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_1011,var_1009,_right,var_1010,param1);
      }
      
      public function dispose() : void
      {
         var_196 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_196(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
