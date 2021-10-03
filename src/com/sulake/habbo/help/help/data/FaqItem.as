package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1312:int;
      
      private var var_1311:String;
      
      private var var_1807:String;
      
      private var _index:int;
      
      private var var_1808:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1312 = param1;
         var_1807 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1311;
      }
      
      public function get questionId() : int
      {
         return var_1312;
      }
      
      public function get questionText() : String
      {
         return var_1807;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1311 = param1;
         var_1808 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1808;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
