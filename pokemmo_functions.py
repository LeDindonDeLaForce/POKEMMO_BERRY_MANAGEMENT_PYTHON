import logging
from pokemmodb import db_select
from pokemmo_selecter import selectnum, multiselect


def read_slots(route, table):
    requete = str(f"SELECT EMPLACEMENTS.ROUTE, EMPLACEMENTS.EMPLACEMENT as 'EMP.', BAIES.Baie as 'BAIE', DATE_FORMAT({table}.DATE_PLANTATION, '%d/%m %H:%i' ) as 'PLANTÉ', DATE_FORMAT({table}.DERNIER_ARROSAGE, '%d/%m %H:%i' ) as 'ARROSÉ LE', DATE_FORMAT(DATE_ADD({table}.DERNIER_ARROSAGE, INTERVAL (CROISSANCE.ARROSAGE_H) HOUR), '%d/%m %H:%i' ) as 'PROCH. ARR.', DATE_FORMAT(DATE_ADD({table}.DATE_PLANTATION, INTERVAL (CROISSANCE.DUREE_H) HOUR), '%d/%m %H:%i' ) as 'MATURATION' FROM {table} inner join EMPLACEMENTS on {table}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT inner join BAIES on {table}.BAIE = BAIES.Numero inner join CROISSANCE on {table}.BAIE = CROISSANCE.BAIE where EMPLACEMENTS.ROUTE = '{route}' ORDER BY EMPLACEMENTS.ROUTE, EMPLACEMENTS.EMPLACEMENT ASC")
    plantations = db_select(requete)
    print(plantations)

def read_berry(berry): #Read all useful data to a selected berry
    requete = str(f"SELECT CROISSANCE.DUREE_H from BAIES inner join CROISSANCE on BAIES.Numero = CROISSANCE.BAIE where BAIES.Baie = '{berry}'") ##Define the request string
    croissance = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    
    requete = str(f"SELECT CROISSANCE.ARROSAGE_H from BAIES inner join CROISSANCE on BAIES.Numero = CROISSANCE.BAIE where BAIES.Baie = '{berry}'") ##Define the request string
    arrosage = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    
    requete = str(f"SELECT BAIES.EPICE from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    epice = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    
    requete = str(f"SELECT BAIES.SEC from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    sec = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable

    requete = str(f"SELECT BAIES.SUCRE from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    sucre = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    
    requete = str(f"SELECT BAIES.AMER from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    amer = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable

    requete = str(f"SELECT BAIES.ACIDE from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    acide = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    
    requete = str(f"SELECT BAIES.Effet from BAIES where BAIES.Baie = '{berry}'") ##Define the request string
    effet = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable

    

    print(f"Voici les données de la baie {berry}")
    print("\n\nNom : " + berry)
    print("Pousse en " + str(croissance[0]) + " heures")
    print("Doit être arrosé toutes les " + str(arrosage[0]) + " heures")
    print("Épicé : " + str(epice[0]))
    print("Sec : " + str(sec[0]))
    print("Sucré : " + str(sucre[0]))
    print("Amer : " + str(amer[0]))
    print("Acide : " + str(acide[0]))
    print("Effet : " + str(effet[0] + "\n"))
    input()
    


def recap_plant(route, slots, action, berry):

    text = str(f"Je récapitule : vous avez selectionné l'option {action} pour les BAIES {berry} sur les slots {slots} de la zone {route}, confirmez-vous votre choix ?")
    options = ['Oui', 'Non']
    choix = selectnum(options, text)
    return choix
    
def recap_water_harvest(route, slots, action):

    text = str(f"Je récapitule : vous avez selectionné l'option {action} pour les BAIES sur les slots {slots} de la zone {route}, confirmez-vous votre choix ?")
    options = ['Oui', 'Non']
    choix = selectnum(options, text)
    return choix
    

def choose_route():
    requete = str("select Numero_Route from ROUTES") ##Define the request string
    routes = db_select(requete) ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    text = "Voici la liste des routes disponibles. \nVeuillez selectionner une route"
    choice = selectnum(routes,text)
    print("Vous avez sélectionné " + choice)
    return choice
    
    
def choose_berry():
    requete = str("select Baie from BAIES order by Baie asc") ##Define the request string
    baies = db_select(requete)  ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    text = "Voici la liste des baies disponibles. \nVeuillez selectionner une baie à planter"
    choice = selectnum(baies,text)
    berry = choice.replace(' ','') #Delete eventual spaces at end on string
    print("Vous avez sélectionné la baie " + berry)
    return berry
    
    
def choose_free_slot(route, table_plant): #displays and allows user to select free slots to plant berry
    requete = str(f"select EMPLACEMENTS.EMPLACEMENT from EMPLACEMENTS inner join {table_plant} on {table_plant}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT where EMPLACEMENTS.ROUTE = '{route}' AND {table_plant}.ETAT = 1") #displays used slots
    
    ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    used_slots = db_select(requete)  
    nb_slots = len(used_slots)
    
    
    # if used slots
    if nb_slots > 0: 
        slots = str(used_slots)[1:-1] 
        requete = str(f"select EMPLACEMENTS.EMPLACEMENT from EMPLACEMENTS where EMPLACEMENTS.ROUTE = '{route}' AND NOT EMPLACEMENTS.EMPLACEMENT IN ({slots})") #do a SQL request excluding used slots

        
    #elif no used slot
    elif nb_slots == 0: 
        requete = str(f"select EMPLACEMENTS.EMPLACEMENT from EMPLACEMENTS where EMPLACEMENTS.ROUTE = '{route}'")
        
    ##calls the pokemmodb file which sends the requests to the DB and cleans special characters to make data usable
    free_slots = db_select(requete)
    
    nb_slots = len(free_slots)
    if nb_slots == 0:
        print("Aucun slot disponible ici.")
        selection = False
        input() #Manual pause until press enter key

    else: 

        text = str(f"Voulez-vous sélectionner tous les emplacements disponibles de la route {route} ?")
        full = ['Oui', 'Non']
        choice = selectnum(full,text)
    
    
        if choice == "Oui":
            selection = free_slots
        
        else:
            text = str(f"Veuillez entrer les emplacements voulus parmi les emplacements disponibles, en séparant chaque numéro d'un espace. Pour copier coller sur cmd, maintenez votre clic gauche sur le texte et tapez entrée, puis clic droit pour coller")
        
            #Manual selection of slots
            selection = multiselect(free_slots, text, 'disponibles')

        
    return selection
    
    
def choose_used_slot(route, table_plant): #displays and allows user to select used slots to water or harvest berry
    requete = str(f"select EMPLACEMENTS.EMPLACEMENT from EMPLACEMENTS inner join {table_plant} on {table_plant}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT where EMPLACEMENTS.ROUTE = '{route}' AND {table_plant}.ETAT = 1 ORDER BY EMPLACEMENTS.EMPLACEMENT ASC")
    used_slots = db_select(requete)
    
    nb_slots = len(used_slots)
    if nb_slots == 0:
        print("Aucun slot occupé ici.")
        selection = False
        input() #Manual pause until press enter key

    else:
        text = str(f"Voulez-vous sélectionner tous les emplacements occupés de la route {route} ?")
        full = ['Oui', 'Non']
        choice = selectnum(full,text)
    
    
        if choice == "Oui":
            selection = str(used_slots)[1:-1]
        
        else:
            text = str(f"Veuillez entrer les emplacements voulus parmi les emplacements disponibles, en séparant chaque numéro d'un espace. Pour copier coller sur cmd, maintenez votre clic gauche sur le texte et tapez entrée, puis clic droit pour coller")
        
            #Manual selection of slots
            slots_input = multiselect(used_slots, text, 'occupés')
            selection = str(slots_input)[1:-1]

    return selection

