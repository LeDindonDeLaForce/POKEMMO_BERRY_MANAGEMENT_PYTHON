from pokemmo_functions import choose_route, choose_berry, choose_free_slot, choose_used_slot, read_berry, read_slots, recap_plant, recap_water_harvest
from pokemmo_selecter import selectpick
from pokemmodb import db_plant_berry, db_water_berry, db_remove_berry


TABLE="PLANTATION_{USERNAME}"

actions = ['PLANTATION', 'ARROSAGE', 'RECOLTE', 'MORT', 'DONNEES BAIE', 'QUITTER']

while True:
    action, index = selectpick(actions, "Que voulez-vous faire ?")
    
    if action == 'QUITTER':
        print("Au revoir !")
        input()
        exit()
        
    elif action == 'DONNEES BAIE':
        berry = choose_berry()
        read_berry(berry)
    
    
    else:
        print(f"Vous avez sélectionné l'option {action}.")
    
        route = choose_route()
    
    
    if action == 'PLANTATION':
        slot = choose_free_slot(route, TABLE)
        if slot is not False:         
            berry = choose_berry()
            choix = recap_plant(route, slot, action, berry)
            if choix == 'Oui':
                db_plant_berry(berry, route, slot, TABLE)
            else:
                input("OK, on recommence. Appuyez sur Entrée pour continuer.\n")
    
    elif action == 'ARROSAGE':
        slot = choose_used_slot(route, TABLE)
        if slot is not False:
            choix = recap_water_harvest(route, slot, action)
            if choix == 'Oui':
            
                db_water_berry(route, slot, TABLE)
            else:
                input("OK, on recommence. Appuyez sur Entrée pour continuer.\n")
    
    
    elif action == 'RECOLTE':
        slot = choose_used_slot(route, TABLE)
        state = 0 #State 0 means harvest is done, State = 2 means plant is dead and no berry has been harvested
        if slot is not False:
            choix = recap_water_harvest(route, slot, action)
            if choix == 'Oui':
            
                db_remove_berry(route, slot, TABLE, state)
            else:
                input("OK, on recommence. Appuyez sur Entrée pour continuer.\n")
            
        
    
    elif action == 'MORT':
        slot = choose_used_slot(route, TABLE)
        state = 2 #State 0 means harvest is done, State = 2 means plant is dead and no berry has been harvested
        if slot is not False:
            choix = recap_water_harvest(route, slot, action)
            if choix == 'Oui':
            
                db_remove_berry(route, slot, TABLE, state)
            else:
                input("OK, on recommence. Appuyez sur Entrée pour continuer.\n")
    
    




