package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_178:String;
      
      private var var_409:int;
      
      private var var_206:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_178 = param1;
         var_206 = param2;
         var_409 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_206.text = var_178.substring(0,param1) + "...";
         return var_206.textHeight > var_409;
      }
   }
}
