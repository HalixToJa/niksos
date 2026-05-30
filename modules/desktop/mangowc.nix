{
  pkgs,
  ...
}:

{
  hjem.users.halix = {
    packages = [pkgs.mangowc pkgs.xprop pkgs.xrdb];
    files.".config/mango/config.conf".text = ''
    # Xorg scaling fix
    exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
    exec-once=xrdb ~/.config/.Xresources


    exec-once=noctalia-shell

    monitorrule=name:^eDP-1$,width:2880,height:1800,refresh:120,vrr:1,scale:1.75


    blur=0
    blur_layer=0
    blur_optimized=1
    blur_params_num_passes = 2
    blur_params_radius = 5
    blur_params_noise = 0.02
    blur_params_brightness = 0.9
    blur_params_contrast = 0.9
    blur_params_saturation = 1.2

    shadows = 0
    layer_shadows = 0
    shadow_only_floating = 1
    shadows_size = 10
    shadows_blur = 15
    shadows_position_x = 0
    shadows_position_y = 0
    shadowscolor= 0x000000ff

    border_radius=6
    no_radius_when_single=0
    focused_opacity=1.0
    unfocused_opacity=1.0

    # Animation Configuration(support type:zoom,slide)
    # tag_animation_direction: 1-horizontal,0-vertical
    animations=1
    layer_animations=1
    animation_type_open=slide
    animation_type_close=slide
    animation_fade_in=1
    animation_fade_out=1
    tag_animation_direction=1
    zoom_initial_ratio=0.4
    zoom_end_ratio=0.8
    fadein_begin_opacity=0.5
    fadeout_begin_opacity=0.8
    animation_duration_move=500
    animation_duration_open=400
    animation_duration_tag=350
    animation_duration_close=800
    animation_duration_focus=0
    animation_curve_open=0.46,1.0,0.29,1
    animation_curve_move=0.46,1.0,0.29,1
    animation_curve_tag=0.46,1.0,0.29,1
    animation_curve_close=0.08,0.92,0,1
    animation_curve_focus=0.46,1.0,0.29,1
    animation_curve_opafadeout=0.5,0.5,0.5,0.5
    animation_curve_opafadein=0.46,1.0,0.29,1

    # Master-Stack Layout Setting
    new_is_master=0
    default_mfact=0.5
    default_nmaster=1
    smartgaps=0

    # Dwindle Layout Setting
    dwindle_smart_split=0
    dwindle_drop_simple_split=1
    dwindle_manual_split=0
    dwindle_hsplit=1
    dwindle_vsplit=1
    dwindle_preserve_split=0

    # Misc
    no_border_when_single=0
    axis_bind_apply_timeout=100
    focus_on_activate=1
    idleinhibit_ignore_visible=0
    sloppyfocus=1
    warpcursor=1
    focus_cross_monitor=0
    focus_cross_tag=0
    enable_floating_snap=0
    snap_distance=30
    cursor_size=24
    drag_tile_to_tile=1
    drag_tile_small=1

    # keyboard
    repeat_rate=25
    repeat_delay=600
    numlockon=0
    xkb_rules_layout=pl

    # Trackpad
    # need relogin to make it apply
    disable_trackpad=0
    tap_to_click=1
    tap_and_drag=1
    drag_lock=1
    trackpad_natural_scrolling=1
    disable_while_typing=1
    left_handed=0
    middle_button_emulation=0
    swipe_min_threshold=1

    # Appearance
    gappih=5
    gappiv=5
    gappoh=10
    gappov=10
    scratchpad_width_ratio=0.8
    scratchpad_height_ratio=0.9
    borderpx=4
    rootcolor=0x201b14ff
    bordercolor=0x444444ff
    dropcolor=0x8FBA7C55
    splitcolor=0xEB441EFF
    focuscolor=0xc9b890ff
    maximizescreencolor=0x89aa61ff
    urgentcolor=0xad401fff
    scratchpadcolor=0x516c93ff
    globalcolor=0xb153a7ff
    overlaycolor=0x14a57cff

    # layout support:
    # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
    tagrule=id:1,layout_name:tile
    tagrule=id:2,layout_name:tile
    tagrule=id:3,layout_name:tile
    tagrule=id:4,layout_name:tile
    tagrule=id:5,layout_name:tile
    tagrule=id:6,layout_name:tile
    tagrule=id:7,layout_name:tile
    tagrule=id:8,layout_name:tile
    tagrule=id:9,layout_name:tile

    # Key Bindings
    # key name refer to `xev` or `wev` command output,
    # mod keys name: super,ctrl,alt,shift,none

    bind=SUPER,Return,spawn,ghostty
    bind=SUPER,r,reload_config
    bind=SUPER+SHIFT,e,quit
    bind=SUPER,q,killclient

    bind=SUPER,space,spawn,noctalia-shell ipc call launcher toggle
    bind=SUPER,s,spawn,noctalia-shell ipc call sessionMenu toggle
    bind=SUPER,comma,spawn,noctalia-shell ipc call settings toggle

    bind=NONE,XF86AudioRaiseVolume,spawn,noctalia-shell ipc call volume increase
    bind=NONE,XF86AudioLowerVolume,spawn,noctalia-shell ipc call volume decrease
    bind=NONE,XF86AudioMute,spawn,noctalia-shell ipc call volume muteOutput
    bind=NONE,XF86MonBrightnessUp,spawn,noctalia-shell ipc call brightness increase
    bind=NONE,XF86MonBrightnessDown,spawn,noctalia-shell ipc call brightness decrease

    # switch window focus
    bind=SUPER,Tab,focusstack,next
    bind=SUPER,Left,focusdir,left
    bind=SUPER,Right,focusdir,right
    bind=SUPER,Up,focusdir,up
    bind=SUPER,Down,focusdir,down

    # swap window
    bind=SUPER+SHIFT,Up,exchange_client,up
    bind=SUPER+SHIFT,Down,exchange_client,down
    bind=SUPER+SHIFT,Left,exchange_client,left
    bind=SUPER+SHIFT,Right,exchange_client,right

    # switch window status
    bind=SUPER,g,toggleglobal,
    bind=SUPER,Tab,toggleoverview,
    bind=SUPER,backslash,togglefloating,
    bind=SUPER,a,togglemaximizescreen,
    bind=SUPER,f,togglefullscreen,
    bind=SUPER+SHIFT,f,togglefakefullscreen,
    bind=SUPER,i,minimized,
    bind=SUPER,o,toggleoverlay,
    bind=SUPER+SHIFT,I,restore_minimized
    bind=SUPER,z,toggle_scratchpad

    #dwindle layout(manual split mode)
    bind=ALT+SHIFT,Return,dwindle_toggle_split_direction

    # switch layout
    bind=SUPER,n,switch_layout

    bind=SUPER,1,view,1,0
    bind=SUPER,2,view,2,0
    bind=SUPER,3,view,3,0
    bind=SUPER,4,view,4,0
    bind=SUPER,5,view,5,0
    bind=SUPER,6,view,6,0
    bind=SUPER,7,view,7,0
    bind=SUPER,8,view,8,0
    bind=SUPER,9,view,9,0

    # tag: move client to the tag and focus it
    # tagsilent: move client to the tag and not focus it
    # bind=Alt,1,tagsilent,1
    bind=SUPER+SHIFT,1,tag,1,0
    bind=SUPER+SHIFT,2,tag,2,0
    bind=SUPER+SHIFT,3,tag,3,0
    bind=SUPER+SHIFT,4,tag,4,0
    bind=SUPER+SHIFT,5,tag,5,0
    bind=SUPER+SHIFT,6,tag,6,0
    bind=SUPER+SHIFT,7,tag,7,0
    bind=SUPER+SHIFT,8,tag,8,0
    bind=SUPER+SHIFT,9,tag,9,0

    # Mouse Button Bindings
    # btn_left and btn_right can't bind none mod key
    mousebind=SUPER,btn_left,moveresize,curmove
    mousebind=NONE,btn_middle,togglemaximizescreen,0
    mousebind=SUPER,btn_right,moveresize,curresize


    # Axis Bindings
    axisbind=SUPER,UP,viewtoleft_have_client
    axisbind=SUPER,DOWN,viewtoright_have_client


    # layer rule
    layerrule=animation_type_open:zoom,layer_name:rofi
    layerrule=animation_type_close:zoom,layer_name:rofi
    '';
  };
}
