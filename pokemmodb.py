import mariadb
import logging
from pokemmoCleaner import cleandata


params = {
    'user':'{USERNAME}', #Votre username
    'password':'{PASSWORD}', #Votre password
    'host':'0.0.0.0', #L'ip ou le FQDN de votre serveur SQL
    'port':3306, #Port 3306 par défaut, si modifié côté serveur, faites de même ici
    'database':'POKEMMO_BAIES' #Si le nom de la base de données est modifié, modifiez-le ici également
}



def db_select(request):
    """ Connects to the MariaDB database server and initializes the custom commands dict """
    conn = None
    try:
	# connect to the MariaDB server
        logging.info('Initializing commands')
        conn = mariadb.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        cur.execute(request)
        
        result = cur.fetchall()
        cur.close()
        
        
 
        final = cleandata(result)

        
    except (Exception, mariadb.DatabaseError) as error:
        logging.error(error)
    finally:
        if conn is not None:
            conn.close()
            logging.info('Database connection closed.')
            return final

            
def db_plant_berry(berry, route, slots, table):
    """ Connects to the MariaDB database server and initializes the custom commands dict """
    conn = None
    try:
	# connect to the MariaDB server
        logging.info('Initializing commands')
        conn = mariadb.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        
        for slot in slots:
            request = str(f"INSERT INTO {table} (EMPLACEMENT , BAIE) VALUES ((SELECT No_EMPLACEMENT FROM EMPLACEMENTS WHERE ROUTE = '{route}' AND EMPLACEMENT = {slot}) , (SELECT NUMERO FROM BAIES WHERE BAIE = '{berry}'))")
        
            cur.execute(request)
        
        conn.commit()
        
        cur.close()
        
        strslots = str(slots).replace('\'','')[1:-1]
        print(f"Les baies {berry} ont bien été plantées à la zone {route} dans les slots {strslots}. Appuyez sur Entrée pour continuer.")
        
    except (Exception, mariadb.DatabaseError) as error:
        logging.error(error)
    finally:
        if conn is not None:
            conn.close()
            logging.info('Database connection closed.')
            input() #Manual pause until press enter key
            
            
def db_water_berry(route, slots, table):

    """ Connects to the MariaDB database server and initializes the custom commands dict """
    conn = None
    try:
	# connect to the MariaDB server
        logging.info('Initializing commands')
        conn = mariadb.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        
        request = str(f"UPDATE {table} inner join EMPLACEMENTS on {table}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT SET {table}.DERNIER_ARROSAGE = CURRENT_TIMESTAMP WHERE EMPLACEMENTS.ROUTE = '{route}' AND {table}.ETAT = '1' AND EMPLACEMENTS.EMPLACEMENT IN ({slots});")
        
        cur.execute(request)
        
        conn.commit()
        
        cur.close()
        
        strslots = str(slots).replace('\'','')
        print(f"Les baies dans les slots {strslots} de la zone {route} ont bien été déclarées arrosées. Appuyez sur Entrée pour continuer.")
        
    except (Exception, mariadb.DatabaseError) as error:
        logging.error(error)
    finally:
        if conn is not None:
            conn.close()
            logging.info('Database connection closed.')
            input() #Manual pause until press enter key
            
            
def db_remove_berry(route, slots, table, state):

    """ Connects to the MariaDB database server and initializes the custom commands dict """
    conn = None
    try:
	# connect to the MariaDB server
        logging.info('Initializing commands')
        conn = mariadb.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        
        
        # Set state harvested or dead (0 or 2)
        request = str(f"UPDATE {table} inner join EMPLACEMENTS on {table}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT SET {table}.ETAT = '{state}' WHERE EMPLACEMENTS.ROUTE = '{route}' AND {table}.ETAT = '1' AND EMPLACEMENTS.EMPLACEMENT IN ({slots})")
        cur.execute(request)
        
        # Copying Data to Archives table
        request = str(f"INSERT INTO ARCHIVES_{table} (EMPLACEMENT , BAIE, ETAT) SELECT {table}.EMPLACEMENT , {table}.BAIE, {table}.ETAT FROM {table} inner join EMPLACEMENTS on {table}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT WHERE EMPLACEMENTS.ROUTE = '{route}' AND {table}.ETAT = '{state}' AND EMPLACEMENTS.EMPLACEMENT IN ({slots})")
        cur.execute(request)
        
        # Deleting data from Plantation table
        request = str(f"DELETE {table} from {table} inner join EMPLACEMENTS on {table}.EMPLACEMENT = EMPLACEMENTS.No_EMPLACEMENT WHERE EMPLACEMENTS.ROUTE = '{route}' AND {table}.ETAT = '{state}' AND EMPLACEMENTS.EMPLACEMENT IN ({slots})")
        cur.execute(request)


        
        conn.commit()
        
        cur.close()
        
        strslots = str(slots).replace('\'','')
        if state == 0:
            etat = "récoltées"
        elif state == 2:
            etat = "mortes"
            
            
        print(f"Les baies dans les slots {strslots} de la zone {route} ont bien été déclarées {etat}. Appuyez sur Entrée pour continuer.")
        
    except (Exception, mariadb.DatabaseError) as error:
        logging.error(error)
    finally:
        if conn is not None:
            conn.close()
            logging.info('Database connection closed.')
            input() #Manual pause until press enter key
            
            
