import logging
from pick import pick
from pokemmoCleaner import cleanstr
from pokemmo_checker import check_lists

def selectnum(options, text): #This function allows the user to select an option between all defined in a list
    validation = False #Validation token to avoid errors on selection
    
    while validation is not True:

         print(text)
         for idx, element in enumerate(options):
             
             print("{}) {} ".format(idx+1,element))
         i = input("Votre choix" + " : ")
         try:
             if 0 < int(i) <= len(options):
                 i = int(i) - 1
                 choice = options[i]
                 validation = True
                 return choice
                 
                 
             else:
                 print("Choix incorrect, recommencez.")
         except:
             pass
    #return None
    

def selectpick(options, text):
    text = str(text + " : ")
    choice = pick(options, text)
    return choice
    
def multiselect(options, text, free_or_used):
    check = False
    while check is False:
        str_option = cleanstr(options)
        print(f"{text}\nListe des emplacements {free_or_used} ► {str_option}")
        i = input("Votre sélection : ")
        if i == "*":
            selection = options
        else:
            i_list = list(i.split(' '))
    
        #Comparate the options list and the input list to make sure each selected option are avaliable    
        check, final_input = check_lists(options, i_list) 
        
        if check is False:
            print("Erreur : Un ou plusieurs emplacements sont incorrects, on recommence.")
    return final_input
        
            
    