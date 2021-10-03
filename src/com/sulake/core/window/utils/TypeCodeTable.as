package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_750;
         param1["bitmap"] = const_718;
         param1["border"] = const_542;
         param1["border_notify"] = const_1381;
         param1["button"] = const_379;
         param1["button_thick"] = const_752;
         param1["button_icon"] = const_1437;
         param1["button_group_left"] = const_672;
         param1["button_group_center"] = const_528;
         param1["button_group_right"] = const_652;
         param1["canvas"] = const_619;
         param1["checkbox"] = const_635;
         param1["closebutton"] = const_1011;
         param1["container"] = const_332;
         param1["container_button"] = const_661;
         param1["display_object_wrapper"] = const_641;
         param1["dropmenu"] = const_488;
         param1["dropmenu_item"] = const_376;
         param1["frame"] = const_328;
         param1["frame_notify"] = const_1190;
         param1["header"] = const_541;
         param1["icon"] = const_933;
         param1["itemgrid"] = const_954;
         param1["itemgrid_horizontal"] = const_400;
         param1["itemgrid_vertical"] = const_733;
         param1["itemlist"] = const_1052;
         param1["itemlist_horizontal"] = const_312;
         param1["itemlist_vertical"] = const_338;
         param1["maximizebox"] = const_1254;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1383;
         param1["submenu"] = const_876;
         param1["minimizebox"] = const_1181;
         param1["notify"] = const_1380;
         param1["null"] = const_616;
         param1["password"] = const_582;
         param1["radiobutton"] = const_668;
         param1["region"] = const_398;
         param1["restorebox"] = const_1386;
         param1["scaler"] = const_632;
         param1["scaler_horizontal"] = const_1279;
         param1["scaler_vertical"] = const_1261;
         param1["scrollbar_horizontal"] = const_475;
         param1["scrollbar_vertical"] = const_588;
         param1["scrollbar_slider_button_up"] = const_1014;
         param1["scrollbar_slider_button_down"] = const_864;
         param1["scrollbar_slider_button_left"] = const_881;
         param1["scrollbar_slider_button_right"] = const_862;
         param1["scrollbar_slider_bar_horizontal"] = const_921;
         param1["scrollbar_slider_bar_vertical"] = const_867;
         param1["scrollbar_slider_track_horizontal"] = const_958;
         param1["scrollbar_slider_track_vertical"] = const_955;
         param1["scrollable_itemlist"] = const_1409;
         param1["scrollable_itemlist_vertical"] = const_391;
         param1["scrollable_itemlist_horizontal"] = const_844;
         param1["selector"] = const_698;
         param1["selector_list"] = const_569;
         param1["submenu"] = const_876;
         param1["tab_button"] = const_614;
         param1["tab_container_button"] = const_894;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_1033;
         param1["tab_selector"] = const_545;
         param1["text"] = const_548;
         param1["input"] = const_587;
         param1["toolbar"] = const_1370;
         param1["tooltip"] = const_336;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
