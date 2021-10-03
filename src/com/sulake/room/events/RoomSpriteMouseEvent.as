package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1783:Boolean = false;
      
      private var var_1787:Boolean = false;
      
      private var var_1784:String = "";
      
      private var _type:String = "";
      
      private var var_1786:Boolean = false;
      
      private var var_1782:Number = 0;
      
      private var var_1790:Number = 0;
      
      private var var_1785:Number = 0;
      
      private var var_1788:String = "";
      
      private var var_1781:Number = 0;
      
      private var var_1789:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1788 = param2;
         var_1784 = param3;
         var_1790 = param4;
         var_1785 = param5;
         var_1782 = param6;
         var_1781 = param7;
         var_1789 = param8;
         var_1787 = param9;
         var_1786 = param10;
         var_1783 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1789;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1783;
      }
      
      public function get localX() : Number
      {
         return var_1782;
      }
      
      public function get localY() : Number
      {
         return var_1781;
      }
      
      public function get canvasId() : String
      {
         return var_1788;
      }
      
      public function get altKey() : Boolean
      {
         return var_1787;
      }
      
      public function get spriteTag() : String
      {
         return var_1784;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1790;
      }
      
      public function get screenY() : Number
      {
         return var_1785;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1786;
      }
   }
}
