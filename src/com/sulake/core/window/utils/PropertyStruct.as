package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_556:String = "Rectangle";
      
      public static const const_53:String = "Boolean";
      
      public static const const_719:String = "Number";
      
      public static const const_62:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_530:String = "Point";
      
      public static const const_982:String = "Array";
      
      public static const const_1053:String = "uint";
      
      public static const const_504:String = "hex";
      
      public static const const_858:String = "Map";
       
      
      private var var_604:String;
      
      private var var_178:Object;
      
      private var var_2448:Boolean;
      
      private var _type:String;
      
      private var var_1849:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_604 = param1;
         var_178 = param2;
         _type = param3;
         var_1849 = param4;
         var_2448 = param3 == const_858 || param3 == const_982 || param3 == const_530 || param3 == const_556;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_504:
               return "0x" + uint(var_178).toString(16);
            case const_53:
               return Boolean(var_178) == true ? "true" : "false";
            case const_530:
               return "Point(" + Point(var_178).x + ", " + Point(var_178).y + ")";
            case const_556:
               return "Rectangle(" + Rectangle(var_178).x + ", " + Rectangle(var_178).y + ", " + Rectangle(var_178).width + ", " + Rectangle(var_178).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_858:
               _loc3_ = var_178 as Map;
               _loc1_ = "<var key=\"" + var_604 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_982:
               _loc4_ = var_178 as Array;
               _loc1_ = "<var key=\"" + var_604 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_530:
               _loc5_ = var_178 as Point;
               _loc1_ = "<var key=\"" + var_604 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_556:
               _loc6_ = var_178 as Rectangle;
               _loc1_ = "<var key=\"" + var_604 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_504:
               _loc1_ = "<var key=\"" + var_604 + "\" value=\"" + "0x" + uint(var_178).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_604 + "\" value=\"" + var_178 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_178;
      }
      
      public function get valid() : Boolean
      {
         return var_1849;
      }
      
      public function get key() : String
      {
         return var_604;
      }
   }
}
