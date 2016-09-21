///scr_textbox_n("Text", font)

 if global.convo == false
 {

    txtobj = instance_create(x, y, obj_textbox_n);
    
    with (txtobj)
    {
        
        message = argument0;
        time = 0;
        tfnt = argument1;
        
                
        text_length = string_length(text);
        // set size of text box
        width = view_wview[0] - view_xview[0] - 30;
        height = view_hview[0]-((view_hview[0]-view_yview[0])*.6) - 15;
    
    }
 }
