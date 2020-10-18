#!/usr/bin/env bash

__print_tmux_mode_indicator() {
  # Get values set by user in .tmux.conf or fallback to defaults
  local copy_mode_text="$(__get_tmux_option "@tmux_mode_indicator_copy_mode_text" "COPY")"
  local prefix_pressed_text="$(__get_tmux_option "@tmux_mode_indicator_prefix_pressed_text" "PREFIX PRESSED")"
  local insert_mode_text="$(__get_tmux_option "@tmux_mode_indicator_insert_mode_text" "INSERT")"
  local normal_mode_text="$(__get_tmux_option "@tmux_mode_indicator_normal_mode_text" "NORMAL")"
  local separator="$(__get_tmux_option "@tmux_mode_indicator_separator" ":")"
  local left_edge_character="$(__get_tmux_option "@tmux_mode_indicator_left_edge_character" "")"
  local right_edge_character="$(__get_tmux_option "@tmux_mode_indicator_right_edge_character" "")"
  local background="$(__get_tmux_option "@tmux_mode_indicator_background" "colour33")"
  local copy_mode_fg="$(__get_tmux_option "@tmux_mode_indicator_copy_mode_fg" "colour82")"
  local prefix_pressed_fg="$(__get_tmux_option "@tmux_mode_indicator_prefix_pressed_fg" "colour226")"
  local normal_fg="$(__get_tmux_option "@tmux_mode_indicator_normal_fg" "#000000")"
  local left_edge_character_bg="$(__get_tmux_option "@tmux_mode_indicator_left_edge_character_bg" "#626262")"
  local separator_fg="$(__get_tmux_option "@tmux_mode_indicator_separator_fg" $normal_fg)"
  local after_interpolation_fg="$(__get_tmux_option "@tmux_mode_indicator_after_interpolation_fg" "#000000")"
  local after_interpolation_bg="$(__get_tmux_option "@tmux_mode_indicator_after_interpolation_bg" "#626262")"
  local right_edge_character_bg="$(__get_tmux_option "@tmux_mode_indicator_right_edge_character_bg" $background)"
  local right_edge_character_fg="$(__get_tmux_option "@tmux_mode_indicator_right_edge_character_fg" "#626262")"

  local left_edge_char="#[fg=${background},bg=${left_edge_character_bg}]${left_edge_character}#[bg=${background},fg=${normal_fg}]"
  local prefix_indicator="#[bg=${background}]#{?client_prefix,#[fg=${prefix_pressed_fg}]${prefix_pressed_text},#[fg=${normal_fg}]${normal_mode_text}}"
  local separator="  #[fg=${separator_fg}]${separator}"
  local normal_or_copy_indicator="#[bg=${background}]#{?pane_in_mode,#[fg=${copy_mode_fg}]${copy_mode_text},#[fg=${normal_fg}]${insert_mode_text}}"
  local right_edge_char="#[bg=${right_edge_character_bg},fg=${right_edge_character_fg}]${right_edge_character}"

  echo -n $left_edge_char
  echo -n " "
  echo -n $prefix_indicator
  echo -n " "
  echo -n $separator
  echo -n " "
  echo -n $normal_or_copy_indicator
  echo -n " "
  echo -n $right_edge_char
  echo -n "#[bg=${after_interpolation_bg},fg=${after_interpolation_fg}]"
}

# Get tmux option or default value
__get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

# Set tmux internal option to given value
__set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

# Replaces interpolation in sent string with tmux_mode_indicator
__do_interpolation() {
  local string="$1"
  local interpolated="${string/$tmux_mode_indicator_interpolation_string/$tmux_mode_indicator}"
  echo "$interpolated"
}

# Update internal tmux option using interpolation
__udpate_tmux_option_with_interpolation() {
  local option="$1"
  local option_value="$(__get_tmux_option "$option")"
  local new_option_value="$(__do_interpolation "$option_value")"
  __set_tmux_option "$option" "$new_option_value"
}

tmux_mode_indicator="$(__print_tmux_mode_indicator)"
tmux_mode_indicator_interpolation_string="\#{tmux_mode_indicator}"

main() {
  __udpate_tmux_option_with_interpolation "status-right"
}

main
