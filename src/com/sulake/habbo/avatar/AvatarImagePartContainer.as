package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2067:int;
      
      private var var_2069:String;
      
      private var var_1619:IActionDefinition;
      
      private var var_2066:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2064:String;
      
      private var var_2065:String;
      
      private var var_1843:Boolean;
      
      private var var_2068:ColorTransform;
      
      private var var_1797:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2069 = param1;
         var_2064 = param2;
         var_2067 = param3;
         _color = param4;
         _frames = param5;
         var_1619 = param6;
         var_1843 = param7;
         var_1797 = param8;
         var_2065 = param9;
         var_2066 = param10;
         var_2068 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1843;
      }
      
      public function get partType() : String
      {
         return var_2064;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1797;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2066;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2067;
      }
      
      public function get flippedPartType() : String
      {
         return var_2065;
      }
      
      public function get bodyPartId() : String
      {
         return var_2069;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1619;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2068;
      }
   }
}
