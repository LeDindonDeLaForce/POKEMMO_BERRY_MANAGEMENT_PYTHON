def check_lists(slot_list, slot_input):
    validation = True
    
    #Deleting possible empty items due to extra spacebar 
    for element in slot_input:
        if element == '':
            slot_input.remove(element)
    
    
    # Compare input and list
    for i in slot_input:
        token = i in slot_list
        if token is False:
            validation = False
    return validation, slot_input
        