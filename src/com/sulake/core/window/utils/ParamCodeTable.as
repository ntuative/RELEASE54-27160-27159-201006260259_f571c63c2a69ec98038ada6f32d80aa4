package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_134;
         param1["bound_to_parent_rect"] = const_85;
         param1["child_window"] = const_1030;
         param1["embedded_controller"] = const_304;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_43;
         param1["internal_event_handling"] = const_679;
         param1["mouse_dragging_target"] = const_199;
         param1["mouse_dragging_trigger"] = const_322;
         param1["mouse_scaling_target"] = const_267;
         param1["mouse_scaling_trigger"] = const_465;
         param1["horizontal_mouse_scaling_trigger"] = const_236;
         param1["vertical_mouse_scaling_trigger"] = const_192;
         param1["observe_parent_input_events"] = const_843;
         param1["optimize_region_to_layout_size"] = const_442;
         param1["parent_window"] = const_969;
         param1["relative_horizontal_scale_center"] = const_173;
         param1["relative_horizontal_scale_fixed"] = const_118;
         param1["relative_horizontal_scale_move"] = const_313;
         param1["relative_horizontal_scale_strech"] = const_281;
         param1["relative_scale_center"] = const_835;
         param1["relative_scale_fixed"] = const_575;
         param1["relative_scale_move"] = const_1041;
         param1["relative_scale_strech"] = const_911;
         param1["relative_vertical_scale_center"] = const_161;
         param1["relative_vertical_scale_fixed"] = const_128;
         param1["relative_vertical_scale_move"] = const_344;
         param1["relative_vertical_scale_strech"] = const_291;
         param1["on_resize_align_left"] = const_740;
         param1["on_resize_align_right"] = const_468;
         param1["on_resize_align_center"] = const_441;
         param1["on_resize_align_top"] = const_724;
         param1["on_resize_align_bottom"] = const_446;
         param1["on_resize_align_middle"] = const_470;
         param1["on_accommodate_align_left"] = const_970;
         param1["on_accommodate_align_right"] = const_395;
         param1["on_accommodate_align_center"] = const_552;
         param1["on_accommodate_align_top"] = const_868;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_608;
         param1["route_input_events_to_parent"] = const_467;
         param1["use_parent_graphic_context"] = const_29;
         param1["draggable_with_mouse"] = const_871;
         param1["scalable_with_mouse"] = const_993;
         param1["reflect_horizontal_resize_to_parent"] = const_386;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_287;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
