///scr_text_manip("Manipulation Code");

var scri;

with(obj_textbox_n)
{

/// Text Manipulation

//    text = argument0;
        while string_char_at(message[message_current], 1) == "["
        {
            while string_char_at(message[message_current], maniplen) != "]"
            {
                curr_char = string_char_at(message[message_current], maniplen);
                maniplen++;
            }
            text = string_copy(message[message_current], 0, maniplen+1);
            message[message_current] = string_delete(message[message_current], 1, maniplen);
            maniplen = 0;

// Parse out Manip code
       
            // Change name
            if string_copy(text, 0, 3) == "[N:"
            {
                text = string_delete(text, 1, 3);

                
                for (scri = 0; scri <= string_length(text); scri++)
                {
                    curr_char = string_copy(text, scri, 1);
                    if curr_char == "]" then
                    {
                        name = string_copy(text,0,scri-1); 
                        text = string_delete(text,1,scri); 
                        break;
                    }
                }
                
            }
            
            // Create Cut-in Sprite
            if string_copy(text, 0, 4) == "[IN:"
            {
                text = string_delete(text,1,4);
                
                csid = real(string_copy(text, 0, 1)); // Get slot 1-4
                text = string_delete(text, 1, 2);
                         
                for (scri = 0; scri <= string_length(text); scri++) // Get ID, convert into sprite
                {
                    if string_copy(text, scri, 1) == ":"
                    {
                        cid[csid] = scr_text_sprite(string_copy(text,0, scri-1));
                        text = string_delete(text, 1, scri);
                        break;
                        
                    }
                }
                for (scri = 0; scri <= string_length(text); scri++) // Get Image Index
                {
                   if string_copy(text, scri, 1) == "]"
                    {
                        cindex[csid] = real(string_copy(text, 0, scri-1));
                        text = string_delete(text, 1, scri);
                        break;
                        
                    } 
                }
                cactive = csid;
            }
            
            // Set Active Sprite
            if string_copy(text, 0, 4) == "[IA:"
            {
                cactive = real(string_copy(text, 5, 1));
                text = string_delete(text, 1, 6);
            }
            
 
    } // end of "While character is ["
            

}  
               
//message[message_current] = text;


